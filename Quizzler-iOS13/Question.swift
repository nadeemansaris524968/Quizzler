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
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
