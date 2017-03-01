//
//  MainGameViewController.swift
//  ListenUp
//
//  Created by David Thurman on 2/28/17.
//  Copyright © 2017 David Thurman. All rights reserved.
//

import UIKit
import AVFoundation

class MainGameViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    @IBOutlet var startLabel: UIButton!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var showLabel: UIButton!
    var currentAnswer = ""
    var currentSet: [String] = []
    var currentCategory = ""
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var answerChoices: [String : [String : [String]]] = [:]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        synth.delegate = self
        answerLabel.isHidden = false
        showLabel.isHidden = true
        setAnswers()
        print(answerChoices)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    optional func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer,
                                    didFinish utterance: AVSpeechUtterance){
        
    }
 */
    
    func setAnswers(){
        for category in Constants.selectedCategories {
            var temp: [String : [String]] = [:]
            for set in Constants.localAnswers[category]! {
                temp[set.key] = set.value
            }
            answerChoices[category] = temp
        }
    }
    
    func getAnswer(){
        let randomCategory = Int(arc4random_uniform(UInt32(Constants.selectedCategories.count)))
        let categoryName = (Constants.selectedCategories[randomCategory])
        if Array(answerChoices[categoryName]!.keys) == [] {
            setAnswers()
        }
        var temp = Array(answerChoices[categoryName]!.keys)
        let randomSetNum = Int(arc4random_uniform(UInt32(temp.count)))
        let randomSet = temp[randomSetNum]
        print(answerChoices[categoryName]![randomSet])
        print(randomSet)
        currentCategory = categoryName
        currentSet = answerChoices[categoryName]![randomSet]!
        currentAnswer = randomSet
        answerChoices[categoryName]!.removeValue(forKey: randomSet)
    }
    /*
    @IBAction func testButton(_ sender: AnyObject) {
        myUtterance = AVSpeechUtterance(string: "This is a test")
        myUtterance.rate = 0.3
        synth.speak(myUtterance)
    }
 */
    
    @IBAction func startStopAction(_ sender: AnyObject) {
        if showLabel.isHidden {
            showLabel.isHidden = false
        }
        //Start Action
        if startLabel.currentTitle == "Start"{
            count = 0
            answerLabel.isHidden = true
            showLabel.setTitle("Show", for: .normal)
            startLabel.setTitle("Stop", for: .normal)
            getAnswer()
            answerLabel.text = currentAnswer
            
            myUtterance = AVSpeechUtterance(string: "Category is " + currentCategory)
            myUtterance.rate = 0.3
            myUtterance.postUtteranceDelay = 1.0
            synth.speak(myUtterance)
            
            
            for x in currentSet {
                myUtterance = AVSpeechUtterance(string: x)
                myUtterance.rate = 0.3
                myUtterance.postUtteranceDelay = 2.0
                synth.speak(myUtterance)
                
            }
            myUtterance = AVSpeechUtterance(string: "Answer was " + currentAnswer)
            myUtterance.rate = 0.3
            myUtterance.postUtteranceDelay = 2.0
            synth.speak(myUtterance)
        }
            
        //Stop Action
        else {
            synth.stopSpeaking(at: AVSpeechBoundary.immediate)
            showLabel.isHidden = true
            answerLabel.isHidden = false
            startLabel.setTitle("Start", for: .normal)
            
        }
    }
    
    
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        count = count + 1
        if count == 9 {
            showLabel.isHidden = true
            answerLabel.isHidden = false
            startLabel.setTitle("Start", for: .normal)
        }
    }
    
    
    
    @IBAction func showHideAction(_ sender: AnyObject) {
        if answerLabel.isHidden{
            answerLabel.isHidden = false
            showLabel.setTitle("Hide", for: .normal)
        }
        else {
            answerLabel.isHidden = true
            showLabel.setTitle("Show", for: .normal)
        }
    }
    
}


