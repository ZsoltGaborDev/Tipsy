//
//  AddShadow.swift
//  Tipsy
//
//  Created by zsolt on 21/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        //layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
