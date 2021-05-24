//
//
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit

class PrefsView: UIView  {
 
    let MyButton = UIButton(type: .custom)
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        MyButton.setTitle("Prefs", for: .normal)
        let fs = UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(30) : CGFloat(45)
        MyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: fs)
       // MyButton.addTarget(self.superview, action: #selector(ViewController.MyButton), for: .touchUpInside)
        
        let blur = UIBlurEffect(style: .prominent)
        let ve = UIVisualEffectView(effect: blur)
        ve.alpha = 0.2
        ve.frame = frame
        self.addSubview(ve)
        self.addSubview(MyButton)
        draw_in_format(frame: frame.size)
        //question_label.font = UIFont(name: "Times new roman",size: 15)
    }


    func draw_in_format(frame: CGSize){
        MyButton.sizeToFit()
        MyButton.frame.origin.x = frame.width/2-MyButton.frame.width/2
        MyButton.frame.origin.y = frame.height/2-MyButton.frame.height/2
        
    }
    
}
