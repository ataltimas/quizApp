//
//  ViewController.swift
//  quizApp
//
//  Created by Alyssa Altimas on 7/24/20.
//  Copyright © 2020 Alyssa Altimas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = ["1 x 1 =", "2 x 2 =", "3 x 3 ="]
    let answers = [["1", "2", "0"], ["4", "2", "1"], ["9", "3", "6"]]
    
    // variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0;
    // label
    @IBOutlet weak var lbl: UILabel!
    //buttons
    @IBAction func action(_ sender: Any) {
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement)){
        print ("correct")
            points += 10
    }
        else {
            print ("wrong")
        }
        if (currentQuestion != questions.count) {
            newQuestion()
        }
        else if currentQuestion == questions.count {
            endquiz()
        }
        }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    // function that calls new question
    func newQuestion () {
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //create a button
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...3 {
            // create a button
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    func endquiz () {
        if points == 30 {
            performSegue(withIdentifier: "pass", sender: self)
        }
        else {
            performSegue(withIdentifier: "fail", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

