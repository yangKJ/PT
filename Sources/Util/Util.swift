//
//  ${POD_NAME}Util.swift
//  ${POD_NAME}
//
//  Created by ${USER_NAME} on ${DATE}.
//  https://github.com/yangKJ/Rickenbacker

import Foundation
import Rickenbacker

struct ${POD_NAME}Util {
    
    internal static let moduleName = "${POD_NAME}"
}

extension Rickenbacker.R {
    
    internal static func image(_ named: String) -> UIImage {
        self.image(named, forResource: ${POD_NAME}Util.moduleName)
    }
    
    internal static func text(_ string: String) -> String {
        self.text(string, forResource: ${POD_NAME}Util.moduleName)
    }
}
