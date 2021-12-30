//
//  CTMediator.swift
//  PROJECT
//
//  Created by Condy on TODAYS_DATE.
//

import UIKit
import WhaleFull

//public extension CTMediator {
//    /// Swift调度者
//    public func PROJECT_viewController() -> UIViewController? {
//        let params = [
//            kCTMediatorParamsKeySwiftTargetModuleName: Util.moduleName
//        ] as [AnyHashable : Any]
//        let viewController = self.performTarget(String(describing: PROJECTViewController.self),
//                                                action: "Extension_ViewController",
//                                                params: params,
//                                                shouldCacheTarget: false) as? UIViewController
//        return viewController
//    }
//
//    /// 回收`target`
//    public func PROJECT_cleanTarget() {
//        let name = "Target_" + String(describing: PROJECTViewController.self)
//        self.releaseCachedTarget(withFullTargetName: name)
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
