//
//  IssueDetailController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 11/7/15.
//  Copyright © 2015 Jaydot2 LLC. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailController: UIViewController {
    
    var survey : Survey = Survey.sharedFavoriteList;
    
    let detailInstructions : String = "What issues contributed to job dissatisfaction?";
    
    @IBOutlet weak var detailInstructionsLabel: UILabel!
    
    @IBOutlet weak var reasonDetailTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailInstructionsLabel.text = detailInstructions;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func completeDissatisfactionReason(sender: UIButton) {
        survey.reason = reasonDetailTextField?.text;
        survey.comments = reasonDetailTextField?.text;
        
        print("The reason is " + survey.reason!);
    }
    
}