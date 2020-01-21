//
//  TipCalculator.swift
//  Tipsy
//
//  Created by zsolt on 06/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct TipCalculator {
    
    var value: Double?
    
    
    func getValue() -> String {
        let valueToPay = String(format: "%.2f", value ?? 0.0)
        return valueToPay
    }
    
    mutating func calculateValue(totalBill: Double, percentageSelected: Double, splitNumber: Double ) {
        value = ((totalBill * (percentageSelected / 100)) + totalBill) / splitNumber
    }
}
