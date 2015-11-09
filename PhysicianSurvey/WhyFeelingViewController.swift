//
//  WhyFeelingViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class WhyFeelingViewController: UIViewController {
    
    private var whyFeelingArray : [String] = ["Hospital Operations", "Sound Operations"];
    
    var selectedFeelingToPass : String = "Test";
    
    var survey : Survey = Survey.sharedFavoriteList;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "What is contributing to this current level?";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Pass the selected object to the new view controller.     whyFeelToOperationsSegue
        if(segue.identifier == "whyFeelToOperationsSegue") {
            //var svc = segue.destinationViewController as! OperationsTableViewController;
            //print("prepareForSegue:  You selected cell #\(self.selectedFeelingToPass)!")
            //svc.selectedFeeling = self.selectedFeelingToPass;
        }
    }

    @IBAction func hospitalOperationOnTouchUp(sender: UIButton) {
        survey.whyFeeling = whyFeelingArray[0];
        print(survey.whyFeeling!);
    }

    @IBAction func soundOperationOnTouchUp(sender: UIButton) {
        survey.whyFeeling = whyFeelingArray[1];
        print(survey.whyFeeling!);
    }
}
