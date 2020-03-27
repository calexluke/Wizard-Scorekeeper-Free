//
//  Hand.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/26/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import Foundation

struct Hand {
    
    var handNumber: Int
    var currentScores = [Int]() 
    var bids = [Int]()
    var tricksTaken = [Int]()
    var madeBid = [Bool]()
    
    init(number: Int) {
        handNumber = number
    }
    
}
