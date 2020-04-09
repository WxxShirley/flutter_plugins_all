# flutter_examples
项目说明：一些flutter-demo项目和好用的插件

## 插件汇总结果
* **本地缓存**: shared_preference

* **本机数据**：device_info（平台、设备具体信息), connectivity(网络信息，包括wifi/流量，ip地址等）

* **页面更新相关**: 下拉刷新(pull_to_refresh)、右滑删除

* **网络请求**:     http， dio(get方法)

* **地图插件**:     高德地图插件全家桶（amap_location_fluttify可定位， amap_search_fluttify可以查询poi、导航信息， amap_map_fluttify显示地图视图）

* **图片处理**:     从相机选择图片（image_picker)，图片裁剪（image_crop)

* **中国特色**:     省市区三级调度(image_picker)

* **联系人显示**：   a-z字母顺序显示联系人(azlistview)，grouped_list（可自定义分组显示方式）

* **socket**:      websocket


## Examples

```
这些demo都是我在做app时部分插件或者功能的测试项目，可以作为简单的练手/插件使用的example例子
```
* [**flutter_chat**](https://github.com/WxxShirley/flutter_plugins_all/tree/master/flutter_chat)

   聊天界面的设计。
   
   真正应用时：
   
    *   两大组件（文本框+发送，双方已发送内容）
    *   三大事件控制（initState获取双方聊天记录，发送新消息处理机制，消息撤回）
    
    这里还需完善.......
  

* [**map_test**](https://github.com/WxxShirley/flutter_examples/tree/master/map_test)
   
   高德地图插件测试项目，使用了`地图视图`和`POI搜索`两个功能
   
   

* 🌟🌟[**contacts**](https://github.com/WxxShirley/flutter_examples/tree/master/contacts)

   AZlistview插件测试项目，以A-Z的昵称顺序显示各个联系人
   
   
* [**card**](https://github.com/WxxShirley/flutter_examples/tree/master/card)
   
   卡片形式展示朋友的实时动态


* [**message_reminder**](https://github.com/WxxShirley/flutter_examples/tree/master/message_reminder)

   列表显示系统消息。支持上拉加载、下拉刷新、右滑删除。
   
       
* [**img_test**](https://github.com/WxxShirley/flutter_examples/tree/master/image_test)

  支持从相机选择图片并裁剪，之后上传到[djaogo后台](https://github.com/WxxShirley/flutter_examples/tree/master/image_backend)
  支持请求django后台显示图片(使用`Image.network(url)`
  
  用到的插件有：
  * `image_picker`:支持拍摄图片、从相册中选择图片
  * `image_crop`:支持图片裁剪
  * `http`:将图片内容传送给django后台

* [**group_demo**](https://github.com/WxxShirley/flutter_plugins_all/tree/master/group_demo)
    
   对联系人姓名首字母排序展示（不足：没有悬停bar）
   👍**优点**：
     * 拓展性强，支持嵌套下拉刷新插件
     * 排序关系可自定义
     * 元素显示方式、分隔组件都可自己定义

* [**like_button**](https://github.com/WxxShirley/flutter_examples/tree/master/like_button_example)
   
   赋予IconButton以动画效果，支持触发事件`onTap:FunctionName`.


* [**websocket_demp**](https://github.com/WxxShirley/flutter_plugins_all/tree/master/websocket_demo)
   
   [服务端](https://github.com/WxxShirley/flutter_plugins_all/tree/master/websocket_test)
   
   支持双端通信的demo工程


   
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

* [like_button](https://github.com/fluttercandies/like_button/blob/master/README-ZH.md)
   
   支持icon-button的动画效果，好看且好用～

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
   
