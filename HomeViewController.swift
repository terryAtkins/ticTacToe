//
//  HomeViewController.swift
//  ticTacToe
//
//  Created by terry atkins on 24/06/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var onePlayerButton: UIButton!
    @IBOutlet weak var twoPlayerButton: UIButton!
    
    @IBOutlet weak var watchPhonePlayButton: UIButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "onePlayer" {
            let onePlayer = segue.destinationViewController as! GameViewController
            onePlayer.isOnePlayer = true
            onePlayer.self.title = "One Player"
        } else if segue.identifier == "twoPlayer" {
            let twoPlayer = segue.destinationViewController as! GameViewController
            twoPlayer.isTwoPlayer = true
            twoPlayer.self.navigationItem.title = "Two Player"
        } else if segue.identifier == "phoneVsphone" {
            let phoneVsphone = segue.destinationViewController as! GameViewController
            phoneVsphone.isPhoneVsPhone = true
            phoneVsphone.self.navigationItem.title = "Phone vs Phone"
        }
    }
}


































