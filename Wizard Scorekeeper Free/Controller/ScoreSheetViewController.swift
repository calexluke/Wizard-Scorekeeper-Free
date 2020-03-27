//
//  FirstViewController.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/7/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import UIKit

class ScoreSheetViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var player1Label: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var player3Label: UILabel!
    @IBOutlet weak var player4Label: UILabel!
    @IBOutlet weak var player5Label: UILabel!
    @IBOutlet weak var player6Label: UILabel!
 
    
    @IBOutlet weak var player4View: UIView!
    @IBOutlet weak var player5View: UIView!
    @IBOutlet weak var player6View: UIView!
    
    var manager = GameManager(playerCount: 4, players: [
        Player(id: 1, name: "Alex"),
        Player(id: 2, name: "Bethany"),
        Player(id: 3, name: "Echo"),
        Player(id: 4, name: "Cookie")
        ], hands: [
            Hand(number: 1),
            Hand(number: 2),
            Hand(number: 3),
            Hand(number: 4)
    ])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScorecardCell", bundle: nil), forCellReuseIdentifier: "ScorecardCell")
        
        
        for player in manager.players {
            switch player.id {
            case 1:
                player1Label.text = player.name
            case 2:
                player2Label.text = player.name
            case 3:
                player3Label.text = player.name
            case 4:
                player4Label.text = player.name
            case 5:
                player5Label.text = player.name
            case 6:
                player6Label.text = player.name
            default:
                return
            }
        }
        
        switch manager.playerCount {
            case 3:
                player4View.isHidden = true
                player5View.isHidden = true
                player6View.isHidden = true
            case 4:
                player4View.isHidden = false
                player5View.isHidden = true
                player6View.isHidden = true
            case 5:
                player4View.isHidden = false
                player5View.isHidden = false
                player6View.isHidden = true
            default:
                player4View.isHidden = false
                player5View.isHidden = false
                player6View.isHidden = false
            }
    }


}

//MARK: - Table View Methods

extension ScoreSheetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.hands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let hand1Bids = [0,1,0,0]
        let hand1Tricks = [0,1,0,0]
        
        let hand2Bids = [0,0,1,0]
        let hand2Tricks = [0,0,1,0]
        
        let hand3Bids = [1,1,1,0]
        let hand3Tricks = [0,2,0,0]
        
        let hand4Bids = [1,1,1,1]
        let hand4Tricks = [1,2,1,1]
        
        manager.hands[0].bids = hand1Bids
        manager.hands[1].bids = hand2Bids
        manager.hands[2].bids = hand3Bids
        manager.hands[3].bids = hand4Bids
        
        manager.hands[0].tricksTaken = hand1Tricks
        manager.hands[1].tricksTaken = hand2Tricks
        manager.hands[2].tricksTaken = hand3Tricks
        manager.hands[3].tricksTaken = hand4Tricks
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScorecardCell", for: indexPath) as! ScorecardCell
        
        
        var hand = manager.hands[indexPath.row]
        cell.handNumber.text = String(hand.handNumber)
        
        cell.player1Bid.text = String(hand.bids[0])
        cell.player2Bid.text = String(hand.bids[1])
        cell.player3Bid.text = String(hand.bids[2])
        cell.player4Bid.text = String(hand.bids[3])
        
        let circles = [
            cell.player1Circle,
            cell.player2Circle,
            cell.player3Circle,
            cell.player4Circle
        ]
        
        let scores = [
            cell.player1Score,
            cell.player2Score,
            cell.player3Score,
            cell.player4Score,
        ]
        
        manager.checkBids(for: &hand)
        hand.currentScores = manager.calculateHandScores(for: hand)
        manager.hands[indexPath.row] = hand
        
        for i in 0..<manager.playerCount {
            scores[i]!.text = String(hand.currentScores[i])
            
            if hand.madeBid[i] {
                circles[i]?.tintColor = UIColor.systemGreen
            } else {
                circles[i]?.tintColor = UIColor.systemRed
            }
        }
        
        switch manager.playerCount {
        case 3:
            cell.player4View.isHidden = true
            cell.player5View.isHidden = true
            cell.player6View.isHidden = true
        case 4:
            cell.player5View.isHidden = true
            cell.player6View.isHidden = true
        case 5:
            cell.player6View.isHidden = true
        default:
            return cell
        }
        return cell
    }
}

