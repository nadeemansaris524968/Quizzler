//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Nadeem Ansari on 6/2/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var choiceBtns: [UIButton]!
    @IBOutlet weak var scoreLbl: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateUI()
        styleButtons()
    }
    
    func styleButtons() {
        for btn in choiceBtns {
            btn.layer.cornerRadius = 5
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guard let userAnswer = sender.titleLabel?.text else { return }
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        quizBrain.progress()
        updateUI()
    }
    
    func updateUI() {
        questionLbl.text = quizBrain.getQuestion()
        let choices = quizBrain.getQuestionChoices()
        for (index, choice) in choices.enumerated() {
            choiceBtns[index].setTitle(choice, for: .normal)
        }
        scoreLbl.text = "Score: \(quizBrain.getScore())/\(quizBrain.getQuizLength())"
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            for btn in self.choiceBtns {
                btn.setTitleColor(.white, for: .normal)
                btn.backgroundColor = .clear
            }
        }
        updateProgressBar()
    }
    
    func updateProgressBar() {
        let progress = Float(quizBrain.getQuestionNumber() + 1)/Float(quizBrain.getQuizLength())
        progressBar.setProgress(progress, animated: false)
    }
}
