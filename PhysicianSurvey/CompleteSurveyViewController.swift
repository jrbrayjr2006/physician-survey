//
//  CompleteSurveyViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/23/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class CompleteSurveyViewController: UIViewController {
    
    var survey : Survey = Survey.sharedFavoriteList;
    
    //var network : NetworkDelegate? // = NetworkDelegate();
    
    let sUrl : NSString = "http://www.docsatisfaction.com:8080/spring-survey-1.0.0-BUILD-SNAPSHOT/add";
    //let sUrl : NSString = "http://www.jaydot2.com:8080/spring-survey-1.0.0-BUILD-SNAPSHOT/add";

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func completeSurveyOnTouchUp(sender: UIButton) {
        print("Survey Complete!");
        let network = NetworkDelegate(serviceUrl: sUrl);
        
        network.submitSurvey(survey);
        print("Survey submitted");
        print("Score: \(survey.score!)");
        print("Why Feeling: \(survey.whyFeeling!)");
        print("Operation: \(survey.operation!)");
        print("Reason: \(survey.reason!)");
        print("Comments: \(survey.comments!)");
        showMessage();
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func showMessage() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Survey Complete"
        alertView.message = "Thank you for completing the Survey. Your comments are appreciated and will help us to learn about what we are doing well and what we need to do better. Results will be shared with the team during the next team meeting to discuss how to increase job satisfaction in a team forum."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }

}
