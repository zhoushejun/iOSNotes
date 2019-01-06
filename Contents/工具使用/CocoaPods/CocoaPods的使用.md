#CocoaPods的使用


##开始使用CocoaPods管理主项目
1.  通过Xcode新建一个项目，取名：`SJNotes`；
2.  终端中，cd到项目目录，即`SJNotes.xcodeproj`所在的目录;
3.  执行命令：`$ pod init` 建立`Podfile`配置文件；    
4. 直接通过Xcode打开并编辑`Podfile`配置文件，添加需要的依赖库；当然，也可以先不编辑；
5. 执行`$ pod install` 或 `$ pod update`，CocoaPods会自动下载需要的依赖库；下载成功后打开项目不再是双击`SJNotes.xcodeproj`了，而是双击`SJNotes.xcworkspace`了。

<img src="images/CocoaPods的使用-1.png" width="100%" height="100%" align=center />    


##Podfile配置文件语法解析

Pods项目默认会将所有的依赖库分别编译为对应的**.a**静态库 *。如果需要编译为动态库，则需要添加命令`use_frameworks!`，该命令编译出来的是 `.framework` 的动态库。

> 注意： 
> 
>1.  用CocoaPods 导入Swift 框架到Swift项目或OC项目都必须要 `use_frameworks!`。
>
>2. 静态库:（.a）在编译时会将库copy一份到目标程序中，编译完成之后目标程序不依赖外部的库也可以运行。但缺点是会使应用程序变大。
>
>3. 动态库：（.dylib）编译时只存储了指向动态库的引用。可以多个程序指向这个库，在运行时才加载，不会使应用体积变大。但缺点是运行时加载会损耗部分性能，并且依赖外部的环境，如果库不存在或者版本不正确则无法运行。
>
>4. framework：实际上是一种打包方式，将库的二进制文件，头文件和有关的资源文件打包到一起，方便管理和分发。



--------------------------------------------

上一篇：[CocoaPods的常用命令](CocoaPods的常用命令.md)

下一篇：[本地私有库的使用](本地私有库的使用.md)