//
//  Player.swift
//  Asteroids
//
//  Created by m2sar on 24/11/2020.
//  Copyright © 2020 m2sar. All rights reserved.
//

import Foundation
import UIKit


class Player{
    static let size = CGFloat(60)
    var img =  UIImageView(image: UIImage(named: "player"))
    var pos : CGPoint
    var dx : CGFloat
    var left = false
    var right = false
    
    init(pos : CGPoint, dx: CGFloat) {
        self.pos = pos
        self.dx = dx
    }
}
