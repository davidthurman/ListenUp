//
//  ViewController.swift
//  ListenUp
//
//  Created by David Thurman on 2/28/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButton(_ sender: AnyObject) {
        myUtterance = AVSpeechUtterance(string: "This is a test")
        myUtterance.rate = 0.3
        synth.speak(myUtterance)
    }

}

