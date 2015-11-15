//
//  IssueDetailController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 11/7/15.
//  Copyright © 2015 Jaydot2 LLC. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailController: UIViewController, UITextViewDelegate {
    
    var survey : Survey = Survey.sharedFavoriteList;
    
    let detailInstructions : String = "What issues contributed to job dissatisfaction?  Touch anywhere outside of the text area to dismiss the keypad once you have entered your answer.";
    
    @IBOutlet weak var detailInstructionsLabel: UILabel!
    
    @IBOutlet weak var reasonDetailTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view.
        detailInstructionsLabel.numberOfLines = 0;
        detailInstructionsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        detailInstructionsLabel.sizeToFit();
        detailInstructionsLabel.text = detailInstructions;
        
        reasonDetailTextField.layer.cornerRadius = 5;
        reasonDetailTextField.layer.borderWidth = 1;
        reasonDetailTextField.layer.borderColor = UIColor.blueColor().CGColor;
        
        self.reasonDetailTextField.delegate = self;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true);
        reasonDetailTextField.resignFirstResponder();
        return true;
    }
    
    
    @IBAction func completeDissatisfactionReason(sender: UIButton) {
        survey.reason = reasonDetailTextField?.text;
        survey.comments = reasonDetailTextField?.text;
        
        print("The reason is " + survey.reason!);
    }
    
}