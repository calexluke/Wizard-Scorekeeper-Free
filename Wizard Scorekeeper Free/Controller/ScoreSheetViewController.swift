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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ScorecardCell", bundle: nil), forCellReuseIdentifier: "ScorecardCell")
    }


}

extension ScoreSheetViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScorecardCell", for: indexPath) as! ScorecardCell
        return cell
    }
}

