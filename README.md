# flutter_examples
一些flutter-demo项目和好用的插件

## Examples

```
这些demo都是我在做app时部分插件或者功能的测试项目，可以作为简单的练手/插件使用的example例子
```

* [**hello world**](https://github.com/WxxShirley/flutter_examples/tree/master/hello_world)
   
   ```hello world``` 测试.
  

* [**map_test**](https://github.com/WxxShirley/flutter_examples/tree/master/map_test)
   
   高德地图插件测试项目，使用了`地图视图`和`POI搜索`两个功能
   
   屏幕截图：
      ```我定位在了家乡江苏连云港```
     ![mapview](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/map_test1.jpg)
   
     ![map_search](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/map_test2.jpg)
   

* [**contacts**](https://github.com/WxxShirley/flutter_examples/tree/master/contacts)

   AZlistview插件测试项目，以A-Z的昵称顺序显示各个联系人
   
   屏幕截图：
     ![azlistview_example](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/contacts.png)
   
* [**card**](https://github.com/WxxShirley/flutter_examples/tree/master/card)
   
   卡片形式展示朋友的实时动态

   屏幕截图：
      ```因为最近看如懿传有点上头，所以取了剧中的人物和故事```
      ![card](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/card.jpg)


* [**message_reminder**](https://github.com/WxxShirley/flutter_examples/tree/master/message_reminder)

   列表显示系统消息。支持上拉加载、下拉刷新、右滑删除。
   
   屏幕截图：
      ![message1](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/message1.jpg)
    
    
     ![message2](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/message2.jpg)

       
* [**img_test**](https://github.com/WxxShirley/flutter_examples/tree/master/image_test)

  支持从相机选择图片并裁剪，之后上传到[djaogo后台](https://github.com/WxxShirley/flutter_examples/tree/master/image_backend)
  支持请求django后台显示图片(使用`Image.network(url)`
  
  用到的插件有：
  * `image_picker`:支持拍摄图片、从相册中选择图片
  * `image_crop`:支持图片裁剪
  * `http`:将图片内容传送给django后台
  
  屏幕截图示例:
      ![eg1](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/img_test1.jpg)
      ![eg2](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/img_test2.jpg)
      ![eg3](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/img_test3.jpg)
      ![eg4](https://github.com/WxxShirley/flutter_examples/blob/master/screenshots/img_test4.jpg)

   
## Useful plugins

* [amap_map_fluttify](https://pub.dev/packages/amap_map_fluttify)

   高德地图插件

* [city_pickers](https://pub.dev/packages/city_pickers)

   中国的城市三级联动选择器

* [azlistview](https://pub.dev/packages/azlistview)

   a-z显示的Listview，可应用于显示联系人/中国城市

* [pull_to_refresh](https://pub.dev/packages/pull_to_refresh)

   下拉刷新和上拉加载插件
   
   [这里](https://github.com/peng8350/flutter_pulltorefresh/blob/master/README_CN.md)是详细的中文版README
   
   
* [image_picker](https://pub.dev/packages/image_picker)

  从手机相册中选择照片/拍摄图片


* [image_crop](https://pub.dev/packages/image_crop)
  
  图片裁剪

## Good Projects
优秀的flutter项目。他山之石，可以攻玉。

**入门级**
 * [flutter_planets](https://github.com/sergiandreplace/flutter_planets_tutorial)
    
   手把手教你使用 Flutter 制作一个星球 App，README 中有6篇详细的教程。
  
 * [menu-flutter](https://github.com/braulio94/menu_flutter)
   
   这个菜单 App 包括一下几个特点：
   * 背景颜色随着 PageView 的改变而改变
   * 可以修改食物价格和数量
   * 实现了`PageView`的动画
   * 自定义`PageView`阴影效果
  

**进阶级**
 * [droidkaigi](https://github.com/konifar/droidkaigi2018-flutter)
   
   这个项目是2018年2月8日-2月9日在日本举行的 DroidKaigi 开发者大会时制作的非官方 App，是日本开发者对 Flutter 进行的实践。
   主要功能有：
   * 查看所有会议的内容以及时间表
   * 添加喜欢的会议到收藏
   * 查看会场地图
   
