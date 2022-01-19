//
//  CTMediator.swift
//  WhaleFull
//
//  Created by Condy on 2021/12/30.
//

import Foundation
//import WhaleFull
//
//public extension CTMediator {
//    /// Swift调度者
//    /// 备注提示，这里必须加上`@objc`
//    /// 否则路由组件部分使用字符串调用该方法会找不到
//    @objc public func PROJECT_viewController() -> UIViewController? {
//        let params = [
//            kCTMediatorParamsKeySwiftTargetModuleName: Util.moduleName
//        ] as [AnyHashable : Any]
//        let viewController = self.performTarget(String(describing: PROJECTViewController.self),
//                                                action: "Extension_ViewController",
//                                                params: params,
//                                                shouldCacheTarget: false) as? UIViewController
//        return viewController
//    }
//}
//
//class Target_PROJECTViewController: NSObject {
//    /// 备注提示，这里必须加上`@objc`
//    /// 否则会出现找不到该方法从而导致控制器为`nil`问题
//    @objc func Action_Extension_ViewController(_ params: NSDictionary) -> UIViewController? {
//        let vc = PROJECTViewController.init()
//        return vc
//    }
//}
