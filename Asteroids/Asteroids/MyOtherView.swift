//
//  MyView.swift
//  quizz
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit


class MyOtherView: UIView   {
 
    let left = UIButton(type: .system)
    let right = UIButton(type: .system)
    let player = UIImageView(image: UIImage(named: "player"))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        left.setTitle("<<<", for: .normal)
        left.titleLabel!.font = UIFont.boldSystemFont(ofSize: 40)
        right.setTitle(">>>", for: .normal)
        right.titleLabel!.font = UIFont.boldSystemFont(ofSize: 40)
        left.addTarget(self.superview, action: #selector(ViewController.left_touch), for: .touchDown)
        right.addTarget(self.superview, action: #selector(ViewController.right_touch), for: .touchDown)
        left.addTarget(self.superview, action: #selector(ViewController.left_release(_:)), for: .touchUpInside)
        right.addTarget(self.superview, action: #selector(ViewController.right_release), for: .touchUpInside)
        left.addTarget(self.superview, action: #selector(ViewController.left_release(_:)), for: .touchUpOutside)
        right.addTarget(self.superview, action: #selector(ViewController.right_release), for: .touchUpOutside)
        self.addSubview(left)
        self.addSubview(right)
        self.addSubview(player)
        draw_in_format(frame: frame.size)
        player.frame = CGRect(x: frame.width/2-30, y: frame.height-70, width: 60, height: 60)
        
        //question_label.font = UIFont(name: "Times new roman",size: 15)
    }

    func movePlayer(p : Player){
        player.frame.origin.x = p.pos.x
    }
    
    func draw_in_format(frame: CGSize){
        left.frame=CGRect(x: 20, y: frame.height-100, width: 80, height: 80)
        right.frame=CGRect(x: frame.width-100, y: frame.height-100, width: 80, height: 80)
    }

  
    
    func addAsteroid(a : Asteroid){
        self.addSubview(a.img)
        a.img.frame = CGRect(x: a.pos.x, y: a.pos.y, width: Asteroid.size, height: Asteroid.size)
    }
}
