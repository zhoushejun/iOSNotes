#CocoaPods的使用


##开始使用CocoaPods管理主项目
1.  通过Xcode新建一个项目，取名：`SJNotes`；
2.  终端中，cd到项目目录，即`SJNotes.xcodeproj`所在的目录;
3.  执行命令：`$ pod init` 建立`Podfile`配置文件；    
4. 直接通过Xcode打开并编辑`Podfile`配置文件，添加需要的依赖库；当然，也可以先不编辑；
5. 执行`$ pod install` 或 `$ pod update`，CocoaPods会自动下载需要的依赖库；下载成功后打开项目不再是双击`SJNotes.xcodeproj`了，而是双击`SJNotes.xcworkspace`了。

<img src="images/CocoaPods的使用-1.png" width="100%" height="100%" align=center />    


##Podfile配置文件语法解析

`Pods`项目默认会将所有的依赖库分别编译为对应的`.a`静态库。

1. 如果`Podfile`文件中使用了命令`use_frameworks!`，则生成的是`.framework` 的库( 实际内容为: **Header + 动态链接库 + 资源文件**)，使用 `dynamic frameworks` 来取代 `static libraries` 方式。

2. 如果`Podfile`文件中没有使用命令`use_frameworks!`，则生成的是`.a` 的静态链接库，通过 `static libraries` 这个方式来管理pod的代码。

3. Linked:`libPods-xxx.a`包含了其它用`Pod`导入的第三方框架的`.a`文件。

4. Linked:`Pods_xxx.framework`包含了其它用`Pod`导入的第三方框架的`.framework`文件。  
	`use_frameworks!` -> `dynamic frameworks` 方式 -> `.framework`  
	`#use_frameworks!` -> `static libraries` 方式 -> `.a`

<img src="images/CocoaPods的使用-2.png" width="100%" height="100%" align=center />    

<img src="images/CocoaPods的使用-3.png" width="100%" height="100%" align=center />    

## Swift与OC混合编辑

1. 用`CocoaPods` 导入`OC`框架到`OC`项目    
（1）`#use_frameworks!` ：在需要用到的文件里 `#import <xxx/xxx.h>`，如：`#import <SDWebImage/UIImageView+WebCache.h>`；也可以通过`pch`文件，用法类似`OC`中的头文件。  
（2）`use_frameworks! `：与(1)类似，用法上没有区别。
2. 用 `CocoaPods` 导入`OC`框架到 `Swift`项目  
（1）`#use_frameworks!`：必须创建头文件，在头文件里面 `#import "xxx.h"`  
（2）`use_frameworks!` ：如果有头文件，在头文件里面 `#import "xxx/xxx.h"`，其它`Swift`文件中用到不需要再`import`；如果没有头文件，则在每个需要用到的`Swift`文件里 `import xxx`，如`import AFNetworking`。

3. 用 `CocoaPods` 导入 `Swift`框架到 `Swift`项目  
（1）必须`use_frameworks!`  
（2）不需要头文件，在需要用到框架的swift文件里 `import xxx`，如：`import Masonry`




> 注意： 
> 
>1.  用 `CocoaPods` 导入 `Swift` 框架到 `Swift`项目 或 `OC`项目 都必须要 `use_frameworks!`。  
	`swift`项目：`CocoaPods` 默认 `use_frameworks! `；  
	`OC`项目：`CocoaPods` 默认 `#use_frameworks!`。
>
>2. 静态库:（.a）在编译时会将库copy一份到目标程序中，编译完成之后目标程序不依赖外部的库也可以运行。但缺点是会使应用程序变大。
>
>3. 动态库：（.dylib）编译时只存储了指向动态库的引用。可以多个程序指向这个库，在运行时才加载，不会使应用体积变大。但缺点是运行时加载会损耗部分性能，并且依赖外部的环境，如果库不存在或者版本不正确则无法运行。
>
>4. framework：实际上是一种打包方式，将库的二进制文件、头文件和有关的资源文件打包到一起，方便管理和分发。



--------------------------------------------

上一篇：[CocoaPods的常用命令](CocoaPods的常用命令.md)

下一篇：[本地私有库的使用](本地私有库的使用.md)