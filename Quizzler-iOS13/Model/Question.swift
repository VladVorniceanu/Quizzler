//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Vlad Vorniceanu on 16.02.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctA: String
    init(q: String, a: [String], correctAnswer: String) {
        text = q;
        answers = a;
        correctA = correctAnswer;
    }
}
