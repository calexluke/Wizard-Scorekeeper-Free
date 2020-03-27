//
//  TableViewCell.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/7/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import UIKit

class ScorecardCell: UITableViewCell {

    @IBOutlet weak var handCountView: UIView!
    @IBOutlet weak var player1View: UIView!
    @IBOutlet weak var player2View: UIView!
    @IBOutlet weak var player3View: UIView!
    @IBOutlet weak var player4View: UIView!
    @IBOutlet weak var player5View: UIView!
    @IBOutlet weak var player6View: UIView!
   
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    @IBOutlet weak var player3Score: UILabel!
    @IBOutlet weak var player4Score: UILabel!
    @IBOutlet weak var player5Score: UILabel!
    @IBOutlet weak var player6Score: UILabel!
    
    @IBOutlet weak var player1Bid: UILabel!
    @IBOutlet weak var player2Bid: UILabel!
    @IBOutlet weak var player3Bid: UILabel!
    @IBOutlet weak var player4Bid: UILabel!
    @IBOutlet weak var player5Bid: UILabel!
    @IBOutlet weak var player6Bid: UILabel!
    
    @IBOutlet weak var player1Circle: UIImageView!
    @IBOutlet weak var player2Circle: UIImageView!
    @IBOutlet weak var player3Circle: UIImageView!
    @IBOutlet weak var player4Circle: UIImageView!
    @IBOutlet weak var player5Circle: UIImageView!
    @IBOutlet weak var player6Circle: UIImageView!
    
    
    @IBOutlet weak var handNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        handCountView.layer.cornerRadius = handCountView.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
