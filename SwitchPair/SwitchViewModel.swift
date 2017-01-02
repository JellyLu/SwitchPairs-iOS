//
//  SwitchViewModel.swift
//  SwitchPair
//
//  Created by Yangjie Lu on 10/13/16.
//  Copyright © 2016 Lu. All rights reserved.
//

import Foundation
import UIKit

class SwitchViewModel {
    private var selectCoders: [NameCellModel] = []
    private var currentCoder: NameCellModel!
    private let colors: [UIColor] = [UIColor.redColor(), UIColor.purpleColor(), UIColor.blueColor(), UIColor.greenColor(), UIColor.yellowColor(), UIColor.grayColor(), UIColor.whiteColor()]

    func bind(selectedCoders: [NameCellModel]) {
        self.selectCoders = selectedCoders
    }

    func removeCoder() {
        selectCoders = selectCoders.filter({ $0.name != currentCoder.name })
    }

    func randomColor() -> UIColor {
        let index = Int(arc4random())%colors.count
        return colors[index]
    }

    func getCurrentCoder() -> NameCellModel {
        let index = Int(arc4random())%selectCoders.count
        print(selectCoders[index])        
        return selectCoders[index]
    }
 
}
