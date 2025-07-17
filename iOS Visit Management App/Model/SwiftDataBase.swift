//
//  SwiftDataBase.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftData

@Model
class MyData {
    var string1: String
    var string2: String

    init(string1: String, string2: String) {
        self.string1 = string1
        self.string2 = string2
    }
}
