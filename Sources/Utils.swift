//
//  Utils.swift
//  Smile
//
//  Created by Khoa Pham on 05/06/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

struct Utils {

  static func dropPrefix(string: String, subString: String) -> String {
    guard string.hasPrefix(subString),
      let range = string.range(of: subString) else {
      return string
    }

    return string.replacingCharacters(in: range, with: "")
  }

  static func remove(string: String, set: Set<String>) -> String {
    var result = string
    set.forEach {
      result = result.replacingOccurrences(of: $0, with: "")
    }
    
    return result
  }

  static func flatten(string: String, base: UInt32 = 0) -> [String] {
    return string.unicodeScalars.flatMap({ scalarView in
      if let scalar = UnicodeScalar(base + scalarView.value) {
        return String(scalar)
      } else {
        return nil
      }
    })
  }
}
