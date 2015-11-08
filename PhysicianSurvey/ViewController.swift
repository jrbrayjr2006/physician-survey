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
    
    // key to verify application is active
    var orgKey : String?
    
    var survey : Survey = Survey.sharedFavoriteList;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.welcomeMessageLabel.numberOfLines = 0;
        self.welcomeMessageLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        self.welcomeMessageLabel.text = welcomeMessage;
        
        self.welcomeMessageLabel.sizeToFit();
        
        let appDefaults = Dictionary<String, AnyObject>()
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let organizationKey = NSUserDefaults.standardUserDefaults().valueForKey("organization") as AnyObject?;
        
        self.orgKey = organizationKey as? String;
        if(self.orgKey == nil) {
            showKeySetupMessage();
            return;
        }
        survey.orgKey = self.orgKey;
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
        alertView.message = "The emotional intelligence survey will now begin.  Select a score from 1 to 10. 1 indicates not satisfied at all and 10 indicates completely satisfied."
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

}

