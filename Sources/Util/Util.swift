//
//  PROJECTUtil.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  https://github.com/yangKJ/Rickenbacker

import Foundation
import Rickenbacker

struct PROJECTUtil {

    internal static let moduleName = "PROJECT"
}

extension Rickenbacker.R {

    internal static func image(_ named: String) -> UIImage {
        self.image(named, forResource: PROJECTUtil.moduleName)
    }

    internal static func text(_ string: String) -> String {
        self.text(string, forResource: PROJECTUtil.moduleName)
    }
}
