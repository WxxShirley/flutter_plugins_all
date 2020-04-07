##  Tutorial

### Part1: Requests and reponses

```
django-admin startproject mysite 
python manage.py runserver       
python manage.py startapp polls  
```



```python
# polls/views.py
from django.http import HttpResponse

def index(request):
  return HttpResponse("Hello world, you are at the polls index")
```



* 配置url

  ```python
  # polls/urls.py
  from django.urls import path
  from . import views
  urlpatterns = [
    path('',views.index,name = 'index')
  ]
  
  # mysite/urls.py
  from django.contrib import admin
  from django.urls import include,path
  urlpatterns = [
    path('polls/',include('polls.urls')),
    path('admin/',admin.site.urls),
  ]
  ```

  > 这里django可以一个项目内创建多个module-app，在每个app内配置url，同时再在整个项目文件内部配置url（通过include）。这样使得整体架构布局更加清晰。

* path() 参数详解

  * route：包含URL模式的字符串。每当处理一个请求时，django从**urlpatterns**中第一项开始匹配，直至匹配成功。

  * view：当django匹配到合适的URL字符串后，将执行相应的视图函数（该函数的第一形参为**HttpRequest**

    

### Part2: Models and the admin site

* Datebase setup
  * 在*mysite/settings.py* 文件是对项目的配置，默认的数据库为 **SQLite3** 。
  * 在*mysite/settings.py* 文件中INSTALLED_APPS项加上 **polls**。

* **数据库模型** 

  ```python
  # polls/models.py
  from django.db import models
  
  class Questions(models.Model):
    question_text = models.CharField(max_length = 200)
    pub_date = models.DateTimeField('date published')
    
    def __str__(self):
      return question_text
    def was_published_recently(self):
      return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    class Meta:
      ordering = ['-pub_date']
      verbose_name = "问题"
  
   class Choice(models.Model):
    question = models.ForeignKey(Question,on_delete = models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    
    def __str__(self):
      return choice_text
    class Meta:
      verbose_name = "选项"
  ```

   *   Django中数据项
       * CharField - 字符串，需要指定max_length
       * TextField - 长文本段
       * DateTimeField - 时间
       * IntergerField - 数字
       * ImageField(图像)，FileField(文件)
   *     Class Meta - 元数据
       * Unique - 指定唯一项
       * ordering - 指定排序关系
       * verbose_name - 指定别名

   *  嵌套函数
      * 如上定义的 `was_published_recently` 可以之后在admin控制台应用，便于对数据更直观的分析
      * def __str__ (): 指定该模型的返回项，如果不指定，默认为主键

* 终端指令 `python manage.py shell` ，进入后可以对数据库进行操作

  ```python
  from polls.models import Choice,Question
  Questions.objects.all()  # all QUESTION-objects
  Questions.objects.get(id=2)
  ```

  

* 在polls/admin.py 文件中配置，就可以在admin控制台查看该项目下数据详细信息

  ```python
  from .models import Questions
  admin.site.register(Question)
  ```

> 这里django对数据的操作非常灵活
>
> - 丰富的数据类型，比如ImageField，FileField等
> - 灵活的自定义函数和admin控制台数据的显示方式，方便对数据的查询、查看、按条件过滤等。

### Part3: Views and templates

> View(视图)是Django应用中的web界面，通常作用一个函数。比如，在一个博客应用中，可能会有下述视图
>
> * Blog homepage - 博客主页，展示最新的文章
> * Entry “detail” page - 单篇博文的界面
> * Year-based archive page - 展示给定年份的博文界面
> * Month-based archive page - 展示给定月份的博文界面
> * Comment action - 处理一次评论操作
>
> 在我们的 投票 应用中，有如下4个视图函数
>
> * Question "index" page - 展示最新的问题
> * Question "detail" page - 展示问题文本
> * Question "results" page - 展示特定问题的结果
> * Vote action - 投票操作

* 配置url

  ```python
  #polls/urls.py
  urlpatterns = [
    path('',views.index,name = 'index'),
    path('<int::question_id>/',views.detail,name = 'detail'),
    path('<int::question_id>/results/',views.results,name = 'results'),
    path('<int::question_id>/vote/',views.vote,name = 'vote'),
  ]
  ```

  

* 完成index视图

  ```python
  # 视图函数（polls/views.py)
  def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list':latest_question_list}
    return render(request,'polls/index.html',context)
  ```

   * 完成index - html界面

     ```html
     {% if latest_question_list %}
     <ul>
         {% for question in latest_question_list %}
           <li>
               <a href = "/polls/{{question.id}}/">{{question.question_text}}</a>
           </li>
       {% endfor %}
     </ul>
     {% else %}
        <p> No polls are available.</p>
     {% endif %}
     ```



### Part4: Forms and generic views

> 这一部分的内容有：
>
> * Django表单基础，实例是该polls应用界面投票表单和触发的投票行为
> * 通用视图。将视图封装为类，使得views文件整体架构清晰

* Polls/templates/polls/detail.html

  ```html
  <h1>
    {{question.question_text}}
  </h1>
  
  {% if error_message %}<p>
    <strong>{{ error_message }}</strong>
  </p>
  {% endif %}
  
  <form action = "{% url 'polls:vote' question.id %}" method = "post">
    {% csrf_token %}
    {% for choice in question.choice_set.all %}
       <input type = "radio" name = "choice" id = "choice{{ forloop.counter }}" value = "{{choice.id}}">
    <label for="choice{{ forloop.counter }}">{{ choice.choice_text }}</label>
   {% endfor %}
    <input type = "submit" value = "Vote">
  </form>
  ```

  * 变量 forloop.counter 是循环计数器

  * 使用{% csrf_token %} 否则的话点击提交会出现错误

    

* polls/views.py - 编写投票的视图逻辑

  ```python
  def vote(request,question_id):
    question = get_object_or_404(Question,pk = question_id)
    try:
      selected_choice = question.choice_set.get(pk = request.POST['choice'])
    except(KeyError,Choice.DoesNotExist):
      return render(request,'polls/detail.html',{
        'question':question,
        'error_message':'You didnt select a choice',
      })
      else:
        selected_choice.votes += 1
        selected_choice.save()
        return HttpResponseRedirect(reverse('polls:results',args = (question.id)))
  ```































