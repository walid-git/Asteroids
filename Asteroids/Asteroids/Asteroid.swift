//
//  Asteroid.swift
//  Asteroids
//
//  Created by m2sar on 23/11/2020.
//  Copyright © 2020 m2sar. All rights reserved.
//

import Foundation
import UIKit


class Asteroid {
    
    static var size = CGFloat(60)
    var pos : CGPoint
    var img : UIImageView
    var dx : CGFloat
    var dy : CGFloat
    var dtheta : CGFloat
    var theta = CGFloat(0)
    init(image: UIImage, pos : CGPoint, dx : CGFloat, dy : CGFloat, dtheta : CGFloat) {
        self.pos = pos
        self.dx = dx
        self.dy = dy
        self.img = UIImageView(image:image)
        self.dtheta = dtheta
    }
    

}
