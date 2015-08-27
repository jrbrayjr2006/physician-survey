//
//  ViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/2/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    var welcomeMessage : String = "Welcome to the Sound Physicians Job Satisfaction App.  Please take time once a day to monitor your job satisfaction.";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.welcomeMessageLabel.numberOfLines = 0;
        self.welcomeMessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        self.welcomeMessageLabel.text = welcomeMessage;
        
        self.welcomeMessageLabel.sizeToFit();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToSurveyOnTouchUp(sender: UIButton) {
        println("Button tapped!");
        
        var emotionalIntelligenceViewController = self.storyboard?.instantiateViewControllerWithIdentifier("emotionalIntelligenceViewController") as! EmotionalIntelligenceViewController;
        var emotionalIntelligenceNavController = UINavigationController(rootViewController: emotionalIntelligenceViewController);
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        showMessage();
    }
    
    private func showMessage() -> Void {
        var alertView:UIAlertView = UIAlertView();
        alertView.title = "Proceed to Survey"
        alertView.message = "The emotional intelligence survey will now begin.  Select a score from 1 to 10. 1 indicates not satisfied at all and 10 indicates completely satisfied."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }

}

