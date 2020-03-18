//
//  TableViewCell.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/7/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var handCountView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        handCountView.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
