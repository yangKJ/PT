# PT

<font color=red>**👌. Automatically generate componentized modules**</font>

- 自动生成组件化模块

```
Pod lib create Demo swift --template-url='git@github.com:yangKJ/PT'
```

-----

### Swift
- cd 任意目录文件
- 自动快捷创建Swift组件模块，终端执行如下命令

#### pod lib create Demo swift --template-url="https://github.com/yangKJ/PT"
- 将上述 `Demo` 换成对应工程名即可 ⚠️

亦或者执行此命令也可 👒👒

- pod lib create Demo swift --template-url='git@github.com:yangKJ/PT'

<img src="https://raw.githubusercontent.com/yangKJ/PT/master/screenshots/flow.png" width=90% hspace="5px">

- <font color=red>**Tip: 该模块会引入默认MVVM + RxSwift响应式架构模块**</font>

> 关于该模块架构更多信息，请查看文档
> 
> [RickenbackerDemo](https://github.com/yangKJ/Rickenbacker)
> 
> If you find it helpful, please help me with a star. If you have any questions or needs, you can also issue.
>
> Thanks.🎇

### Contents
<img src="https://raw.githubusercontent.com/yangKJ/PT/master/screenshots/template.png" width=90% hspace="5px">

- 自动生成组件化模块目录结构如下，该区域删除或者增加模块，在`podspec`增加or删除模块即可；
- The automatically generated component module directory structure is as follows. 
- Delete or add modules in this area, and add or delete modules in `podspec` file.

```
Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '1.0.0'
  s.summary          = 'A short description of ${POD_NAME}.'
  
  s.homepage         = 'https://github.com/${USER_NAME}/${POD_NAME}'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Condy' => 'yangkj310@gmail.com' }
  s.source           = { :git => 'https://github.com/${USER_NAME}/${POD_NAME}.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '10.0'
  s.swift_version    = '5.0'
  s.requires_arc     = true
  s.static_framework = true
  
  s.dependency 'Rickenbacker/Adapter' # 响应式基础架构
  s.dependency 'Rickenbacker/Mediator' # 组件化模块
  #s.dependency 'RxNetworks' # 网络架构
  #s.dependency 'SnapKit' # 布局架构
  #s.dependency 'Wintersweet' # 图像框架，支持GIF和Image
  
  s.subspec 'Resources' do |xx|
    xx.resource_bundles = { '${POD_NAME}' => ['Sources/Resources/*.{xcassets,lproj}'] }
  end
  
  s.subspec 'Util' do |xx|
    xx.source_files = 'Sources/Util/*.swift'
  end
  
  s.subspec 'Api' do |xx|
    xx.source_files = 'Sources/Api/*.swift'
  end
  
  s.subspec 'Controller' do |xx|
    xx.source_files = 'Sources/Controller/*.swift'
  end
  
  s.subspec 'ViewModel' do |xx|
    xx.source_files = 'Sources/ViewModel/*.swift'
  end
  
  s.subspec 'View' do |xx|
    xx.source_files = 'Sources/View/*.swift'
  end
  
  s.subspec 'Model' do |xx|
    xx.source_files = 'Sources/Model/*.swift'
  end
  
end
```

### About the author
- 🎷 **E-mail address: [yangkj310@gmail.com](yangkj310@gmail.com) 🎷**
- 🎸 **GitHub address: [yangKJ](https://github.com/yangKJ) 🎸**

-----

### LICENSE

LICENSE is available under the [MIT](LICENSE) license. See the [LICENSE](LICENSE) file for more info.