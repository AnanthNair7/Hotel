//
//  utill.swift
//  R-Kitchen
//
//  Created by Ananth Nair on 10/02/24.
//

import Foundation
import UIKit

extension UIView {
  @IBInspectable  var cornorRadius : CGFloat {
        get {return cornorRadius}
        set { self.layer.cornerRadius = newValue }
    }
}
