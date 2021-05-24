//
//
//
//  Created by m2sar on 02/11/2020.
//  Copyright © 2020 UPMC. All rights reserved.
//

import Foundation
import UIKit

class ScoresView: UIView  {
 
    let done = UIButton(type: .custom)
    var labels : [(name: UILabel,score: UILabel)] = []
    let score_label = UILabel()
    let y_score_label = UILabel()
    let y_score = UILabel()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        done.setTitle("Done", for: .normal)
        let fs = UIDevice.current.userInterfaceIdiom == .phone ? CGFloat(30) : CGFloat(45)
        done.titleLabel?.font = UIFont.boldSystemFont(ofSize: fs)
        done.addTarget(self.superview, action: #selector(ViewController.doneScores), for: .touchUpInside)
        done.sizeToFit()
        score_label.text = "Best Scores"
        score_label.font = UIFont.boldSystemFont(ofSize: fs-8)
        score_label.sizeToFit()
        score_label.textColor = UIColor.white
        y_score_label.text = "Your Score"
        y_score_label.font = UIFont.boldSystemFont(ofSize: fs-8)
        y_score_label.sizeToFit()
        y_score_label.textColor = UIColor.white
        y_score.textColor = UIColor.white
        y_score.text = "50"
        y_score.font = UIFont.systemFont(ofSize: fs-18)
        y_score.sizeToFit()
        let blur = UIBlurEffect(style: .prominent)
        let ve = UIVisualEffectView(effect: blur)
        ve.alpha = 0.2
        ve.frame = frame
        self.addSubview(ve)
        self.addSubview(done)
        self.addSubview(score_label)
        self.addSubview(y_score_label)
        self.addSubview(y_score)
        for _ in 0...4{
            let l1 = UILabel()
            let l2 = UILabel()
            l1.font = UIFont.systemFont(ofSize: fs-15)
            l2.font = UIFont.systemFont(ofSize: fs-15)
            l1.textColor = UIColor.white
            l2.textColor = UIColor.white
            labels.append((name:l1,score:l2))
            self.addSubview(l1)
            self.addSubview(l2)
        }

        draw_in_format(frame: frame.size)
    }

    func setScore(s : String){
        y_score.text = s
        y_score.sizeToFit()
        draw_in_format(frame: self.frame.size)
    }

    func draw_in_format(frame: CGSize){
        done.frame.origin.x = frame.width-done.frame.width-20
        done.frame.origin.y = 20
        score_label.frame.origin.x = frame.width/2 - score_label.frame.width/2
        score_label.frame.origin.y = 20
        y_score_label.frame.origin.x = frame.width/2 - y_score_label.frame.width/2
        y_score_label.frame.origin.y = 40 + score_label.frame.height + 5 * 25
        y_score.frame.origin.x = frame.width/2 - y_score.frame.width/2
        y_score.frame.origin.y = 60 + score_label.frame.height + 5 * 25 + y_score_label.frame.size.height
        
        
    }
    
    func setScores(scores:[(name: String,score: String)]){
        var i  = 0
        for label in labels{
            label.name.text = scores[i].name
            label.score.text = scores[i].score
            i+=1
        }
        let frame = UIScreen.main.bounds.size
        for i in 0...4{
            labels[i].name.sizeToFit()
            labels[i].score.sizeToFit()
            labels[i].name.frame.origin.x = frame.width / 2 - 20 - labels[i].name.frame.width
            labels[i].name.frame.origin.y = 40 + score_label.frame.height + CGFloat(i) * (25)
            labels[i].score.frame.origin.x = frame.width / 2 + 20
            labels[i].score.frame.origin.y = 40 + score_label.frame.height + CGFloat(i) * (25)
        }
    }
}
