//
//  ${POD_NAME}Target.swift
//  ${POD_NAME}
//
//  Created by ${PROJECT_OWNER} on ${TODAYS_DATE}.
//  See: https://github.com/yangKJ/Rickenbacker/blob/master/Rickenbacker/Modules/Mediator/Mediator/SecondTarget.swift

import Foundation

class ${POD_NAME}Target: NSObject {
    /// 备注提示，这里必须加上`@objc`
    /// 否则会出现找不到该方法从而导致控制器为`nil`问题
    @objc func setupViewController() -> UIViewController? {
        let vc = ${POD_NAME}ViewController()
        return vc
    }
}
