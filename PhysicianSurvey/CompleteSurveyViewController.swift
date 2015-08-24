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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func completeSurveyOnTouchUp(sender: UIButton) {
        println("Survey Complete!");
        
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
        var alertView:UIAlertView = UIAlertView();
        alertView.title = "Survey Complete"
        alertView.message = "You have completed the survey.  You may now close the application."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }

}
