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
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
    let quiz: [Question] = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton(trueBtn)
        roundButton(falseBtn)
        updateUI()
        updateProgressBar()
    }
    
    func roundButton(_ button: UIButton) {
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guard let userAnswer = sender.titleLabel?.text else { return }
        let actualAnswer = quiz[questionNumber].answer
        if userAnswer == actualAnswer {
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = .green
        } else {
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = .red
        }
        if questionNumber < quiz.count - 1 {
            questionNumber+=1
        } else {
            questionNumber = 0
        }
        updateUI()
        updateProgressBar()
    }
    
    func updateUI() {
        questionLbl.text = quiz[questionNumber].text
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            self.trueBtn.setTitleColor(.white, for: .normal)
            self.falseBtn.setTitleColor(.white, for: .normal)
            self.trueBtn.backgroundColor = .clear
            self.falseBtn.backgroundColor = .clear
        }
    }
    
    func updateProgressBar() {
        let progress = Float(questionNumber + 1)/Float(quiz.count)
        progressBar.setProgress(progress, animated: true)
    }
    
}
