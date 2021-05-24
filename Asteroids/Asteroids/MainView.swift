//
//
//  
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView  {
 
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let iv = UIImageView(image: UIImage(named: "background"))
        let effectH = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        let effectV = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        effectH.maximumRelativeValue = 40
        effectH.minimumRelativeValue = -40
        effectV.maximumRelativeValue = 40
        effectV.minimumRelativeValue = -40
        iv.addMotionEffect(effectH)
        iv.addMotionEffect(effectV)
        iv.frame = CGRect(x: -50, y: -50, width: frame.width+100, height: frame.height+100)
       
        let blur = UIBlurEffect(style: .dark)
        
        let ve = UIVisualEffectView(effect: blur)
        ve.alpha = 0.2
        ve.frame = iv.frame
        self.addSubview(iv)
        self.addSubview(ve)
        draw_in_format(frame: frame.size)
        //question_label.font = UIFont(name: "Times new roman",size: 15)
    }


    func draw_in_format(frame: CGSize){
        
    }
    
}
