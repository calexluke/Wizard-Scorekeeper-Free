//
//  Player.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/22/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import Foundation

struct Player {
    
    var id: Int // player number 1 - 6
    var name: String
    var handScores = [Int]() // scores for each hand
    var bids = [Int]() // bids for each hand
    var tricksTaken = [Int]() // tricks taken each hand
    
    var gameHistory = [String: Player]() // game ID: player data
}
