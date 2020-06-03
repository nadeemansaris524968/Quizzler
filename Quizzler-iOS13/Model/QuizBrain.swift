//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Nadeem Ansari on 6/3/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import Foundation

struct QuizBrain {
    private var questionNumber = 0
    private var correctAnswers = 0
    private let quiz: [Question] = [
        Question(q: "Which is the largest organ in the human body?",
                 c: ["Heart", "Skin", "Large Intestine"],
                 a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?",
                 c: ["25", "50", "100"],
                 a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?",
                 c: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
                 a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?",
                 c: ["Chapeau", "Écharpe", "Bonnet"],
                 a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?",
                 c: ["Notebook", "Handkerchief", "Watch"],
                 a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?",
                 c: ["Au Revoir", "Adiós", "Salir"],
                 a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?",
                 c: ["Green", "Orange", "Blue"],
                 a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?",
                 c: ["Rum", "Whisky", "Gin"],
                 a: "Rum"),
        Question(q: "What type of animal was Harambe?",
                 c: ["Panda", "Gorilla", "Crocodile"],
                 a: "Gorilla"),
        Question(q: "Where is Tasmania located?",
                 c: ["Indonesia", "Australia", "Scotland"],
                 a: "Australia")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let actualAnswer = quiz[questionNumber].correctAnswer
        if userAnswer == actualAnswer {
            correctAnswers += 1
        }
        return userAnswer == actualAnswer
    }
    
    mutating func progress() {
        if questionNumber < quiz.count - 1 {
            questionNumber+=1
        } else {
            reset()
        }
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    func getQuestionChoices() -> [String] {
        return quiz[questionNumber].choices
    }
    
    func getQuizLength() -> Int {
        return quiz.count
    }
    
    func getScore() -> Int {
        return correctAnswers
    }
    
    func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    mutating func reset() {
        questionNumber = 0
        correctAnswers = 0
    }
}
