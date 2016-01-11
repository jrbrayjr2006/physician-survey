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
    
    @IBOutlet weak var otherMessageLabel: UILabel!
    var welcomeMessage : String = "You will need to follow the prompts to complete the survey. The survey should take less than 2 minutes during your day.";
    
    var otherText : String = "We value your input. Please, click on the bottom of the screen to begin your survey.";
    
    var startSurveyText : String = "We value your input. Please, click on the bottom of the screen to begin your survey.";
    
    // key to verify application is active
    var orgKey : String?
    
    var survey : Survey = Survey.sharedFavoriteList;
    
    var welcomeAlertController : UIAlertController = UIAlertController(title: "Introduction", message: "", preferredStyle: .Alert);
    
    // Create the actions
    var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
        UIAlertAction in NSLog("OK Pressed");
        //swapText();
    };
    var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
        UIAlertAction in
        NSLog("Cancel Pressed");
    };

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.welcomeMessageLabel.numberOfLines = 0;
        self.welcomeMessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        self.welcomeMessageLabel.text = welcomeMessage;
        
        self.welcomeMessageLabel.sizeToFit();
        
        self.otherMessageLabel.numberOfLines = 0;
        self.otherMessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        self.otherMessageLabel.text = otherText;
        self.otherMessageLabel.sizeToFit();
        
        let appDefaults = Dictionary<String, AnyObject>()
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let organizationKey = NSUserDefaults.standardUserDefaults().valueForKey("organization") as AnyObject?;
        
        showInstructions();
        self.orgKey = organizationKey as? String;
        if(self.orgKey == nil) {
            showKeySetupMessage();
            return;
        }
        survey.orgKey = self.orgKey;
        
        welcomeAlertController.addAction(okAction);
        welcomeAlertController.addAction(cancelAction);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goToSurveyOnTouchUp(sender: UIButton) {
        print("Button tapped!");
        
        let emotionalIntelligenceViewController = self.storyboard?.instantiateViewControllerWithIdentifier("emotionalIntelligenceViewController") as! EmotionalIntelligenceViewController;
        var emotionalIntelligenceNavController = UINavigationController(rootViewController: emotionalIntelligenceViewController);
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        //print(self.orgKey!);
        showMessage();
    }
    
    private func showMessage() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Proceed to Survey"
        alertView.message = "The physician survey will now begin.  Select a score from 1 to 10. 1 indicates not satisfied at all and 10 indicates completely satisfied."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
    
    private func showInstructions() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Introduction";
        alertView.message = "Welcome to the Physician Satisfaction Survey. As Leaders in Hospital Medicine, our goal is to provide you (the valued Hospitalist) with support in order to achieve success. To ensure that we are satisfying your needs and expectations, we would appreciate your help by taking a few moments each day to complete this survey. Your feedback will help us assess your needs, meet your job expectations and help create an atmosphere of transparency.  Please be assured that your responses will be completely anonymous.";
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
    
    private func showKeySetupMessage() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Go To Settings"
        alertView.message = "You must have a key to use this survey app.  Go to Settings and select the Physician Survey app.  Enter your organization key in the Organization field."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
    
    private func swapText() -> Void {
        return;
    }

}

