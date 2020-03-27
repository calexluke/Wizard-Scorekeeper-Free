//
//  SetupViewController.swift
//  Wizard Scorekeeper Free
//
//  Created by Alex Luke on 3/26/20.
//  Copyright © 2020 Alex Luke. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    
    
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    var players = [String]()
    var playerCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = confirmButton.frame.size.height / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        playerCount = Int(sender.value)
        playerNumberLabel.text = String(playerCount)
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        
        // pop up UI Alert. define alert's title and action, textfield
        var textField = UITextField() // defines empty textfield in scope of addButtonPressed IBAction
        let alert = UIAlertController(title: "Set Player Name", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Confirm", style: .default) { (action) in
           
            // what will happen when user clicks "Add Item" button. Adds new item to array. Could add conditional statement to deal with empty textfield.
            if textField.text == "" {
                switch self.players.count {
                    case 0:
                        let player = "Player 1"
                        self.players.append(player)
                    case 1:
                        let player = "Player 2"
                        self.players.append(player)
                    case 2:
                        let player = "Player 3"
                        self.players.append(player)
                    case 3:
                        let player = "Player 4"
                        self.players.append(player)
                    case 4:
                        let player = "Player 5"
                        self.players.append(player)
                    case 5:
                        let player = "Player 6"
                        self.players.append(player)
                    default:
                        let player = "Player"
                        self.players.append(player)
                }
            } else {
                let player = textField.text!
                self.players.append(player)
            }

            print("Current players are:")
            for player in self.players {
                print(player)
            }
            print(" ")
            
            if self.players.count == self.playerCount {
                self.confirmButton.setTitle("Start Game!", for: .normal)
            }
        }
        
        // add textfield and action to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Player 1" // greyed-out placeholder text
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
