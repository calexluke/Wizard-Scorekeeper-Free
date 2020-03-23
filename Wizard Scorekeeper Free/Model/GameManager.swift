//
//  GameManager.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/22/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import Foundation

struct GameManager {
    
    var playerCount: Int
    var handCount: Int {
        playerCount/60
    }
    var players: [Player]
    var currentHand = 1
    var cardsToDeal: Int {
        currentHand
    }
    
    // array of dictionaries - scores for each hand. currentScores[handNumber - 1] = "Player Name": score after that hand
    var currentScores: [[String: Int]]
    
    
    mutating func calculateHandScore(for player: inout Player, handNumber: Int) {
        var handScore: Int
        let bid = player.bids[handNumber - 1]
        let tricks = player.tricksTaken[handNumber - 1]
        
        if bid == tricks {
            handScore = 20 + (10 * bid)
        } else {
            handScore = -10 * (abs(bid - tricks))
        }
        player.handScores[handNumber - 1] = handScore
    }
    
    mutating func updateScores() {
        for player in players {
            var totalScore = 0
            for score in player.handScores {
                totalScore += score
            }
            currentScores[currentHand - 1][player.name] = totalScore
        }
    }
    
    mutating func updateHand() {
        if currentHand == handCount {
            endGame()
        } else {
            currentHand += 1
        }
    }
    
    func endGame() {
    }
    
    
    
}
