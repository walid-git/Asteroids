//
//
//  
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit


class GameView: UIView {
 
    let left = UIButton(type: .system)
    let right = UIButton(type: .system)
    let gameOver = UILabel()
    let score = UILabel()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        gameOver.text = "Loooooser !"
        gameOver.textAlignment = .center
        gameOver.font = UIFont.boldSystemFont(ofSize: 60)
        gameOver.textColor = UIColor.white
        gameOver.frame = frame
        gameOver.isHidden = true
        score.text = "Score: 0"
        score.font = UIFont.boldSystemFont(ofSize: 30)
        score.sizeToFit()
        score.textColor = UIColor.white
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
        self.addSubview(gameOver)
        self.addSubview(score)
        draw_in_format(frame: frame.size)
        
        //question_label.font = UIFont(name: "Times new roman",size: 15)
    }

    func hideGameOver(b : Bool){
        gameOver.isHidden = b
    }
    
    func draw_in_format(frame: CGSize){
        left.frame=CGRect(x: 20, y: frame.height-100, width: 80, height: 80)
        right.frame=CGRect(x: frame.width-100, y: frame.height-100, width: 80, height: 80)
        score.frame.origin.x = frame.width-score.frame.width-20
        score.frame.origin.y = 20
    }

    func setScore(t : String){
        score.text = "Score: "+t
        score.sizeToFit()
        score.frame.origin.x = frame.width-score.frame.width-20
        score.frame.origin.y = 20
    }
    
    func movePlayer(p : Player){
        p.img.center.x = p.pos.x
        p.img.center.y = p.pos.y
    }
    func moveAsteroid(a : Asteroid){
        a.img.center.x = a.pos.x
        a.img.center.y = a.pos.y
        a.img.transform = CGAffineTransform(rotationAngle: a.theta)
    }
    
    func addPlayer(player : Player){
        self.addSubview(player.img)
        player.img.frame = CGRect(x: frame.width/2-Player.size/2, y: frame.height-40-Player.size/2, width: Player.size, height: Player.size)
    }
    func addAsteroid(a : Asteroid){
        self.addSubview(a.img)
        a.img.frame = CGRect(x: a.pos.x, y: a.pos.y, width: Asteroid.size, height: Asteroid.size)
    }
}
