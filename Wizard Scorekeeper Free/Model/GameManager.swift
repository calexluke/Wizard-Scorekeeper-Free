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
    var hands: [Hand]
    
    var currentHandNumber = 1
    var cardsToDeal: Int {
        currentHandNumber
    }
    
    
    // array of dictionaries - scores for each hand. currentScores[handNumber - 1] = "Player Name": score after that hand
    var currentScores: [[String: Int]]
    
    
    //MARK: - Game Manager methods
    
    mutating func updateHandNumber() {
        if currentHandNumber == handCount {
            endGame()
        } else {
            currentHandNumber += 1
        }
    }
    
    func setupGame() {
    }
    func endGame() {
    }
    
    
    //MARK: - Hand update methods
    
    mutating func updateHands() {
        
        var newHand = Hand(number: currentHandNumber)
        
        for player in players {
            
            let bid = player.bids[currentHandNumber - 1]
            let tricks = player.tricksTaken[currentHandNumber - 1]
            
            newHand.bids.append(bid)
            newHand.tricksTaken.append(tricks)
        }
        
        newHand.currentScores = calculateHandScores(for: newHand)
        hands.append(newHand)
        updateHandNumber()
    }
    

    func calculateHandScores(for hand: Hand) -> [Int] {
        
        let changes = calculateScoreChanges(for: hand)
        var scores = [Int]()
        
        if currentHandNumber > 1 {
            
            let priorHand = hands[currentHandNumber - 2]
            for i in 0..<playerCount {
                scores[i] = priorHand.currentScores[i] + changes[i]
            }
        } else {
            scores = changes
        }
        return scores
    }
    
    func calculateScoreChanges(for hand: Hand) -> [Int] {
        
        var scoreChange: Int
        var changes = [Int]()
        
        for i in 0..<hand.bids.count {
            let bid = hand.bids[i]
            let tricks = hand.tricksTaken[i]
            
            if hand.madeBid[i] {
                scoreChange = 20 + (10 * bid)
            } else {
                scoreChange = -10 * (abs(bid - tricks))
            }
            changes.append(scoreChange)
        }
        return changes
    }
    
    //MARK: - Player update methods
    
    
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
             currentScores[currentHandNumber - 1][player.name] = totalScore
         }
     }
}
