//
//
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit

class MainMenuView: UIView  {
 
    let play = UIButton(type: .custom)
    let scoresBt = UIButton(type: .custom)
    let preferences = UIButton(type: .custom)
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        play.setTitle("Play", for: .normal)
        //play.backgroundColor = UIColor.white
        scoresBt.setTitle("Scores", for:.normal)
        preferences.setTitle("Preferences", for: .normal)
        let fs = UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(30) : CGFloat(45)
        scoresBt.titleLabel?.font = UIFont.boldSystemFont(ofSize: fs)
        preferences.titleLabel?.font = UIFont.boldSystemFont(ofSize: fs)
        scoresBt.addTarget(self.superview, action: #selector(ViewController.scores),for: .touchUpInside)
        scoresBt.translatesAutoresizingMaskIntoConstraints = false
        preferences.addTarget(self.superview, action: #selector(ViewController.preferences),for: .touchUpInside)
        preferences.translatesAutoresizingMaskIntoConstraints = false
        play.titleLabel?.font = UIFont.boldSystemFont(ofSize: fs)
        play.addTarget(self.superview, action: #selector(ViewController.play), for: .touchUpInside)
        play.translatesAutoresizingMaskIntoConstraints = false
        let blur = UIBlurEffect(style: .prominent)
        let ve = UIVisualEffectView(effect: blur)
        ve.alpha = 0.2
        ve.frame = frame
        self.addSubview(ve)
        self.addSubview(play)
        self.addSubview(preferences)
        self.addSubview(scoresBt)
        draw_in_format(frame: frame.size)
        //question_label.font = UIFont(name: "Times new roman",size: 15)
    }


    func draw_in_format(frame: CGSize){
        play.sizeToFit()
        play.frame.origin.x = frame.width/2-play.frame.width/2
        play.frame.origin.y = frame.height/2-play.frame.height/2
        scoresBt.sizeToFit()
        scoresBt.frame.origin.x = 20
        scoresBt.frame.origin.y = 20
        preferences.sizeToFit()
        preferences.frame.origin.x = frame.width - preferences.frame.width - 20
        preferences.frame.origin.y = 20

        
    }
    
}
