//
//  Commons.swift
//  News
//
//  Created by Tomas Fernandez Velazco on 19/3/22.
//

import Foundation

import Foundation

extension NSObject {
    public class var nameOfClass: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
