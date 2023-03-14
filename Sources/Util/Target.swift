//
//  ${POD_NAME}Target.swift
//  ${POD_NAME}
//
//  Created by ${USER_NAME} on ${DATE}.
//  https://github.com/yangKJ/Rickenbacker

import Foundation

class ${POD_NAME}Target: NSObject {
    /// 备注提示，这里必须加上`@objc`
    /// 否则会出现找不到该方法从而导致控制器为`nil`问题
    @objc func setupViewController() -> UIViewController? {
        let vc = ${POD_NAME}ViewController()
        return vc
    }
}
