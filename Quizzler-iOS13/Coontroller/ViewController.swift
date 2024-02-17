//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLable: UILabel!
    @IBOutlet weak var pprogressBar2: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
   
    @IBOutlet weak var trueButton: UIButton!    
    
    @IBOutlet weak var falseButton: UIButton!
    
    
    
    var QuizsBrain = quizsBrain()
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
    }
    @IBAction func answerbuttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
       let userGotItRight = QuizsBrain.checkAnswer(userAnswer)
        
        
       //if userAnswer == actualAnswer {
        //    print ( " right!")
    //    }
          //  else {
             //   print ("wrong!")
           //
          //  }
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
            
        }
        
        QuizsBrain.nextQuestionText()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
  
        
       
    }
    
    @objc func updateUI(){
        questionLabel.text = QuizsBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
    
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = QuizsBrain.progressBar()
        scoreLabel.text = "score: \(QuizsBrain.getScore())"
        
    }
}
    
    
    
    
    
    
    
    

