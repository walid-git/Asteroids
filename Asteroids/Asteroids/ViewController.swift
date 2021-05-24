//
//  ViewController.swift
//  
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer : Timer!
    var player : Player!
    let gameView = GameView(frame: UIScreen.main.bounds)
    let mainMenu = MainMenuView(frame: UIScreen.main.bounds)
    let prefsView  = PrefsView(frame: UIScreen.main.bounds)
    let scoresView = ScoresView(frame: UIScreen.main.bounds)
    var asteroids = [Asteroid]()
    var current_score = 0
    let asteroid_imgs = ["asteroide-100-1","asteroide-100-2","asteroide-100-3","asteroide-100-4",
                         "asteroide-120-1","asteroide-120-2","asteroide-120-3","asteroide-120-4"]
    
    var scores_list : [(name:String, score:String)] = [(name:"???",score:"???"),
                                                  (name:"???",score:"???"),
                                                  (name:"???",score:"???"),
                                                  (name:"???",score:"???"),
                                                  (name:"???",score:"???")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let v = MainView(frame: UIScreen.main.bounds)
        self.view = v
        gameView.isHidden = true
        prefsView.isHidden = true
        scoresView.isHidden = true
        v.addSubview(mainMenu)
        v.addSubview(gameView)
        v.addSubview(prefsView)
        v.addSubview(scoresView)
        player = Player(pos: CGPoint(x: UIScreen.main.bounds.width/2-Player.size/2,y: UIScreen.main.bounds.height-40-Player.size/2), dx: 10)
        init_asteroides(frame: UIScreen.main.bounds)
        gameView.addPlayer(player: player)
        
    }
    
    func init_asteroides(frame : CGRect){
        for _ in 1...5{
            asteroids.append(
                Asteroid(image: UIImage(named: asteroid_imgs.randomElement()!)!,
                         pos: CGPoint(x: CGFloat.random(in: 0...frame.width),y: 0),
                         dx: CGFloat.random(in: -10...10),
                         dy:CGFloat.random(in: 2...8),
                         dtheta : CGFloat.random(in: -1.0...1.0)))
        }
        for a in asteroids{
            gameView.addAsteroid(a: a)
        }
        
        
    }
    
    @objc func update(_ sender: Any){
        let b = UIScreen.main.bounds
        //update player
        player.pos.x += (player.left && !player.right) ? -player.dx : (player.right && !player.left) ? player.dx : 0
        gameView.movePlayer(p: player)
        //update asteroids
        for a in asteroids{
            //recycle when out of the screen
            if a.img.center.x-Asteroid.size/2 > b.width || a.img.center.y-Asteroid.size/2 > b.height {
                a.pos.x = CGFloat.random(in: 0...b.width)
                a.pos.y = 0
                a.dx = CGFloat.random(in: -10...10)
                a.dy = CGFloat.random(in: 5...15)
                a.dtheta = CGFloat.random(in: -1.0...1.0)
                current_score += 1
            }
            else {
                a.pos.x += a.dx
                a.pos.y += a.dy
            }
            a.theta = (a.theta + a.dtheta) //% CGFloat.pi*2
            gameView.moveAsteroid(a: a)
            let sa = Asteroid.size/2
            let sp = Player.size/2
           
            if (a.pos.y+sa > player.pos.y-sp && a.pos.y+sa < player.pos.y+sp)||(a.pos.y-sa > player.pos.y-sp && a.pos.y-sa < player.pos.y+sp){
                if (a.pos.x+sa < player.pos.x+sp && a.pos.x+sa > player.pos.x-sp)||(a.pos.x-sa < player.pos.x+sp && a.pos.x-sa > player.pos.x-sp){
                    gameOver()
                }
                
            }
            
        }
        gameView.setScore(t: String(current_score))

        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let v = self.view as! MainView
        v.draw_in_format(frame: size)
    }
    
    @objc func left_touch(_ sender: Any){
       
        player.left = true
    }
    
    @objc func right_touch(_ sender: Any){
        player.right = true
    }
    
    @objc func left_release(_ sender: Any){
       
        player.left = false
    }
    
    @objc func right_release(_ sender: Any){
        player.right = false
    }
    
    @objc func play(_ sender: Any){
        mainMenu.isHidden = true
        gameView.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.03), target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    @objc func preferences(_ sender: Any){
        mainMenu.isHidden = true
        prefsView.isHidden = false
    }
    
    @objc func scores(_ sender: Any){
        mainMenu.isHidden = true
        scoresView.isHidden = false
        scoresView.setScores(scores: scores_list)
    }
    
    @objc func doneScores(_ sender: Any){
        scoresView.isHidden = true
        mainMenu.isHidden = false
    }
    
    func gameOver(){
        timer.invalidate()
        gameView.hideGameOver(b:false)
        Timer.scheduledTimer(withTimeInterval: TimeInterval(5), repeats: false, block: {_ in
            self.gameView.hideGameOver(b:true)
            self.scoresView.setScore(s: String(self.current_score))
            self.resetGame()
            self.scoresView.isHidden = false
            self.gameView.isHidden = true
            self.scoresView.setScores(scores: self.scores_list)
        })
        
    }
    
    func resetGame(){
        self.current_score = 0
        player.pos.x = UIScreen.main.bounds.width/2-Player.size/2
        for a in asteroids{
            a.pos.y = 0
        }
    }
   
}

