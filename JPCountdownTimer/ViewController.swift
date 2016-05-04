//
//  ViewController.swift
//  JPCountdownTimer
//
//  Created by James on 5/4/16.
//  Copyright © 2016 James Perlman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countdownTimer: JPCountdownTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startCountdown(sender: AnyObject) {
        countdownTimer.hidden = false
        countdownTimer.countdown(["Ready!", "Set!", "Go!"], completion: { [unowned self] in
            // do something when countdown completes
            self.countdownTimer.hidden = true
        })
    }

}

