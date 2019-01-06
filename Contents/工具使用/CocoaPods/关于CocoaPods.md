#关于CocoaPods

##简介

CocoaPods是管理Xcode项目的库依赖性的工具。在一个名为 **Podfile** 的文本文件中指定项目的依赖项。CocoaPods将解析库之间的依赖关系，获取依赖库的源代码，并生成对应的库，然后将生成的库链接到Xcode工作区中，以构建项目。

CocoaPods将所有的依赖库都放在一个名为 **Pods** 的项目下，然后让主项目依赖 **Pods** 项目。Pods项目默认会将所有的依赖库分别编译为对应的**.a**静态库 *（如果`Podfile`文件中使用了命令`use_frameworks!`，则生成的是 `.framework` 的库）* 并统一放在 **Pods** 项目的 **Products** 目录下，主项目依赖这些库。

---
> 对于依赖库，CocoaPods 提供了一个名为 **Pods-XXX-frameworks.sh** 的 bash 脚本，该脚本在每次项目编译的时候都会执行，将第三方库复制到主项目中。

----
> 对于资源文件，CocoaPods 提供了一个名为 **Pods-XXX-resources.sh** 的 bash 脚本，该脚本在每次项目编译的时候都会执行，将第三方库的各种资源文件复制到目标目录中。
CocoaPods 通过一个名为 Pods.xcconfig 的文件来在编译时设置所有的依赖和参数。

---

CocoaPods的目标是通过创建一个更加集中的生态系统来提高第三方开源库的发现性和参与度。

##工作原理

待完善


--------------------------------------------

上一篇：[返回首页](CocoaPods.md)

下一篇：[安装CocoaPods](安装CocoaPods.md)