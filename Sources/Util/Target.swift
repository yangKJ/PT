//
//  PROJECTTarget.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//

import Rickenbacker

class PROJECTTarget: NSObject {
    /// 备注提示，这里必须加上`@objc`
    /// 否则会出现找不到该方法从而导致控制器为`nil`问题
    @objc func setupPROJECTViewController() -> UIViewController? {
        return nil
    }
}
