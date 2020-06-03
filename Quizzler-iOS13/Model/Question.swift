//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nadeem Ansari on 6/3/20.
//  Copyright © 2020 Nadeem Ansari. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let correctAnswer: String
    let choices:[String]
    
    init(q: String, c: [String], a: String) {
        self.text = q
        self.choices = c
        self.correctAnswer = a
    }
}
