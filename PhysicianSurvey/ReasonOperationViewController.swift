//
//  ReasonOperationViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/23/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class ReasonOperationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var survey :Survey = Survey.sharedFavoriteList;
    private var leadershipArray : [String] = ["I’m Frustrated With The Chief", "The Chief Is Not Listening To My Concerns", "The Chief Is Not Seeing Enough Patients"];
    private var soundConnectArray : [String] = ["Poor Log On Time", "Too Many Hard Stops", "Too Complicated", "Cannot Find Codes", "Not Capturing Data", "Poor Facesheet Capture"];
    private var hospitalistsArray : [String] = ["Dumping", "Poor Signouts", "Illegible Notes To Follow", "Leaving Billing Gaps"];
    private var nursingArray : [String] = ["Dismissive", "Too many pages", "Ganging up on me", "Confused who is following specific patients"];
    private var consultantsArray : [String] = ["Dismissive", "Not responding to my request", "I cannot understand the consultant’s plan of care", "Consultant asked me to discharge the patient they admitted", "Consultant discharged the patient I admitted without speaking with me"];
    private var operatorArray : [String] = ["Does not know who is on call", "Does not know who is covering patient’s on our service", "Calling the wrong pagers", "Not answering the phone"];
    private var pagingArray : [String] = ["My pager is not working", "This pager will not stop beeping", "I picked up the wrong pager", "Nurses are paging the wrong pager"];
    private var dictationArray : [String] = ["My dictation was not transcribed", "My dictation was lost", "Dictation was transcribed improperly"];
    private var queriesArray : [String] = ["Query people are bothering me", "I cannot understand what the request is", "I have too many queries", "I disagree with many of the requests", "I’m getting querie that belong to other departments"];
    private var rrCodesArray : [String] = ["Poor communication between team members", "Equipment slow to arrive", "No pharmacist at codes", "Too many docs trying to run the code"];
    private var pcpsArray : [String] = ["Disagreeing with the care provider", "Demanding prolonged stay for additional testing", "Not accepting their patient’s back"];
    private var caseManagersArray : [String] = ["Not communicating barriers to DC", "SNF’s not setup in a timely fashion", "Cannot find case manager notes"];
    
    // default dummy data
    private var reasons : [String] = ["reason1", "reason2"];
    
    var options : [String]?;
    
    var reason : String?;
    
    var commentTextField : UITextField?
    
    @IBOutlet weak var reasonOperationTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.reasonOperationTableView.registerClass(ReasonOperationTableViewCell.self, forCellReuseIdentifier: "reasonOperationTableViewCell");
        self.title = survey.operation;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(survey.operation!) {
            case "Leadership":
                options = leadershipArray;
                break;
            case "Sound Connect":
                options = soundConnectArray;
                break;
            case "Fellow Hospitalists":
                options = hospitalistsArray;
                break;
            case "Nursing":
                options = nursingArray;
                break;
            case "Consultants":
                options = consultantsArray;
                break;
            case "Operator":
                options = operatorArray;
                break;
            case "Paging":
                options = pagingArray;
                break;
            case "Dictation":
                options = dictationArray;
                break;
            case "Queries":
                options = queriesArray;
                break;
            case "Rapid Response/Codes":
                options = rrCodesArray;
                break;
            case "PCP’s":
                options = pcpsArray;
                break;
            case "Case Managers":
                options = caseManagersArray;
                break;
            default:
                options = reasons;
            
        }
        switch(section) {
        case 0:
            return options!.count;
        case 1:
            return 1;
        default:
            return options!.count;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndentifier : String = "reasonOperationTableViewCell";
        //let otherCellIdentifier : String = "otherOperationTableViewCell";
        var cell : ReasonOperationTableViewCell = self.reasonOperationTableView.dequeueReusableCellWithIdentifier(cellIndentifier) as! ReasonOperationTableViewCell;
        
        switch(survey.operation!) {
            case "Leadership":
                options = leadershipArray;
                break;
            case "Sound Connect":
                options = soundConnectArray;
                break;
            case "Fellow Hospitalists":
                options = hospitalistsArray;
                break;
            case "Nursing":
                options = nursingArray;
                break;
            case "Consultants":
                options = consultantsArray;
                break;
            case "Operator":
                options = operatorArray;
                break;
            case "Paging":
                options = pagingArray;
                break;
            case "Dictation":
                options = dictationArray;
                break;
            case "Queries":
                options = queriesArray;
                break;
            case "Rapid Response/Codes":
                options = rrCodesArray;
                break;
            case "PCP’s":
                options = pcpsArray;
                break;
            case "Case Managers":
                options = caseManagersArray;
                break;
            default:
                options = reasons;
            
        }
        
        let strReason : String = String(options![indexPath.row]) as String;
        cell.textLabel?.text = strReason;
        
        if(indexPath.section == 1) {
            cell.textLabel?.text = "Other";
            commentTextField = UITextField(frame: CGRect(x: 100, y: 10, width: 200.00, height: 30.00));
            commentTextField!.placeholder = "Enter Other Reason";
            commentTextField!.borderStyle = UITextBorderStyle.Line;
            
            cell.addSubview(commentTextField!);
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected row at index: \(indexPath.row)");
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected row at index: \(indexPath.row)");
        
        if(commentTextField != nil) {
            survey.comments = commentTextField?.text;
            println(commentTextField?.text);
        }
        
        reason = String(options![indexPath.row]) as String;
        
        survey.reason = reason!;
        println("The reason is " + reason!);
        self.performSegueWithIdentifier("reasonOperationToCompleteSegue", sender: self);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
