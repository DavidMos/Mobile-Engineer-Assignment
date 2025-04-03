//
//  UIResponder+Extension.swift
//  Mobile Engineer Assignment
//
//  Created by David Mosoyan on 03.04.25.
//

import UIKit

extension UIResponder {
    class var name: String {
        return String(describing: self)
    }
}
