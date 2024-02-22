//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.setProgress(0, animated: true)
        updateUI()
        
    }
    
    @objc func updateUI() {
//        Update the score label text
        scoreLabel.text = "Score: \(quizBrain.getScore())/\(quizBrain.getNoOfQuestions())"
        
//        Update the background color of the options buttons and the text on them
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        
//        Check if there are any more questions.
//        If so, update the UI to show the next Q and options.
        if(quizBrain.nextQuestion()) {
            questionLabel.text = quizBrain.getQuizText()
            var answers:[String] = quizBrain.getPossibleAnswers()
            option1.setTitle(answers.randomElement(), for: UIControl.State.normal)
            repeat {
                option2.setTitle(answers.randomElement(), for: UIControl.State.normal)
            }while(option1.currentTitle == option2.currentTitle)
            repeat {
                option3.setTitle(answers.randomElement(), for: UIControl.State.normal)
            }while(option3.currentTitle == option2.currentTitle || option3.currentTitle==option1.currentTitle)
            
            progressBar.setProgress(quizBrain.getProgress(), animated: true)
        } else {
//            Else throw an alert on screen to signal end of quiz
            let alertController = UIAlertController(title: "Quiz finished!", message: "Congratulations!\nYou have finished the quiz. No more questions are available.\nYour score is: \(quizBrain.getScore())/\(quizBrain.getNoOfQuestions())", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            quizBrain.setQuestionNumber(0)
            quizBrain.setScore(0)
            updateUI()
        }
    }
    
    @IBAction func responseBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!;
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor=UIColor.green
            quizBrain.incrementScore()
        }else {
            sender.backgroundColor=UIColor.red
        }
        
        quizBrain.incrementQuestionNumber()
        
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
}

