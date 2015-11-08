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
    private var leadershipArray : [String] = ["I am Frustrated With The Chief", "The Chief Is Not Listening To My Concerns", "The Chief Is Not Seeing Enough Patients"];
    private var soundConnectArray : [String] = ["Poor Log On Time", "Too Many Hard Stops", "Too Complicated", "Cannot Find Codes", "Not Capturing Data", "Poor Facesheet Capture"];
    private var hospitalistsArray : [String] = ["Dumping", "Poor Signouts", "Illegible Notes To Follow", "Leaving Billing Gaps"];
    private var nursingArray : [String] = ["Dismissive", "Too many pages", "Ganging up on me", "Confused who is following specific patients"];
    private var consultantsArray : [String] = ["Dismissive", "Not responding to my request", "I cannot understand the consultant plan of care", "Consultant asked me to discharge the patient they admitted", "Consultant discharged the patient I admitted without speaking with me"];
    private var operatorArray : [String] = ["Does not know who is on call", "Does not know who is covering patient on our service", "Calling the wrong pagers", "Not answering the phone"];
    private var pagingArray : [String] = ["My pager is not working", "This pager will not stop beeping", "I picked up the wrong pager", "Nurses are paging the wrong pager"];
    private var dictationArray : [String] = ["My dictation was not transcribed", "My dictation was lost", "Dictation was transcribed improperly"];
    private var queriesArray : [String] = ["Query people are bothering me", "I cannot understand what the request is", "I have too many queries", "I disagree with many of the requests", "I am getting queries that belong to other departments"];
    private var rrCodesArray : [String] = ["Poor communication between team members", "Equipment slow to arrive", "No pharmacist at codes", "Too many docs trying to run the code"];
    private var pcpsArray : [String] = ["Disagreeing with the care provider", "Demanding prolonged stay for additional testing", "Not accepting their patient back"];
    private var caseManagersArray : [String] = ["Not communicating barriers to DC", "SNFs not setup in a timely fashion", "Cannot find case manager notes"];
    
    // default dummy data
    private var reasons : [String] = ["reason1", "reason2"];
    
    var options : [String]?;
    
    var reason : String?;
    
    var commentTextField : UITextField?;
    
    var nextLabel : UILabel?;
    
    var testLabel : UILabel?;
    
    var nextButton : UIButton?;
    
    let instructionsText : String = "In order to keep your response anonymous, please keep subjects down to 1-6 words.";
    
    @IBOutlet weak var reasonOperationTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.reasonOperationTableView.registerClass(ReasonOperationTableViewCell.self, forCellReuseIdentifier: "reasonOperationTableViewCell");
        self.title = survey.operation;
        showMessage();
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
            case "PCPs":
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
        let cell : ReasonOperationTableViewCell = self.reasonOperationTableView.dequeueReusableCellWithIdentifier(cellIndentifier) as! ReasonOperationTableViewCell;
        
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
            case "PCPs":
                options = pcpsArray;
                break;
            case "Case Managers":
                options = caseManagersArray;
                break;
            default:
                options = reasons;
            
        }
        
        let strReason : String = String(options![indexPath.row]) as String;
        
        //cell.reasonLabel?.text = "sample";
        //cell.reasonLabel?.text = strReason;
        //cell.reasonLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        //cell.reasonLabel?.sizeToFit();
        
        if(indexPath.section == 0) {
            testLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 280.00, height: 60.00));
            testLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping;
            testLabel?.text = strReason;
            //testLabel?.sizeToFit();
            testLabel?.numberOfLines = 0;
            cell.addSubview(testLabel!);
        }
        
        if(indexPath.section == 1) {
            cell.textLabel?.text = "Other";
            commentTextField = UITextField(frame: CGRect(x: 100, y: 10, width: 200.00, height: 30.00));
            commentTextField!.placeholder = "Enter Other Reason";
            commentTextField!.borderStyle = UITextBorderStyle.Line;
            
            commentTextField?.touchInside
            cell.addSubview(commentTextField!);
            
            nextLabel = UILabel(frame: CGRect(x: 310, y: 10, width: 20.00, height: 30.00));
            nextLabel?.text = ">";
            
            cell.addSubview(nextLabel!);
        } else {
            nextButton = UIButton(frame: CGRect(x: 310, y: 10, width: 50, height: 25));
            nextButton?.setTitle("Next", forState: UIControlState.Normal);
            nextButton?.titleLabel?.backgroundColor = UIColor.blackColor();
            nextButton?.backgroundColor = UIColor.grayColor();
            nextButton?.alpha = 0.5;
            nextButton?.addTarget(self, action: "nextButtonOnTouchUp:", forControlEvents: UIControlEvents.TouchUpInside);
            cell.addSubview(nextButton!);
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
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
        case "PCPs":
            options = pcpsArray;
            break;
        case "Case Managers":
            options = caseManagersArray;
            break;
        default:
            options = reasons;
            
        }
        
        //let strReason : String = String(options![indexPath.row]) as String;
        //let height:CGFloat = self.calculateHeightForString(strReason)
        let height:CGFloat = 20.0;
        return height + 70.0
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Selected row at index: \(indexPath.row)");
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected row at index: \(indexPath.row)");
        reason = String(options![indexPath.row]) as String;
        survey.comments = "";  // prevents error because value is nil;
        survey.reason = reason!;
        
        if((commentTextField != nil) && (commentTextField?.text != "")) {
            survey.comments = commentTextField?.text;
            survey.reason = commentTextField?.text;
            print(commentTextField?.text);
        }
        
        print("The reason is " + survey.reason!);
        self.performSegueWithIdentifier("reasonOperationToCompleteSegue", sender: self);
    }
    /*
    func calculateHeightForString(inString:String) -> CGFloat
    {
        let messageString: String = inString
        let attributes = [UIFont(): UIFont.systemFontOfSize(15.0)]
        let attrString:NSAttributedString? = NSAttributedString(string: messageString, attributes: attributes)
        //let testString:NSAttributedString? = NSAttributedString(string: messageString, attributes: <#T##[String : AnyObject]?#>)
        let rect:CGRect = attrString!.boundingRectWithSize(CGSizeMake(300.0,CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context:nil )//hear u will get nearer height not the exact value
        let requredSize:CGRect = rect
        return requredSize.height  //to include button's in your tableview
        
    }*/
    
    private func showMessage() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Instructions"
        alertView.message = "If you enter text in the Other option, in order to keep your response anonymous, please keep subjects down to 1-6 words."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
    
    // get the super view of the sender to get the index of the cell
    func nextButtonOnTouchUp(sender : UIButton!) {
        print("Button touched!");
        
        let clickedCell : UITableViewCell = sender.superview as! UITableViewCell;
        let indexPath : NSIndexPath! = self.reasonOperationTableView.indexPathForCell(clickedCell);
        
        print("Selected row at index: \(indexPath.row)");
        reason = String(options![indexPath.row]) as String;
        survey.comments = "";  // prevents error because value is nil;
        survey.reason = reason!;
        
        if((commentTextField != nil) && (commentTextField?.text != "")) {
            survey.comments = commentTextField?.text;
            survey.reason = commentTextField?.text;
            print(commentTextField?.text);
        }
        
        print("The reason is " + survey.reason!);
        
        self.performSegueWithIdentifier("reasonOperationToCompleteSegue", sender: self);
    }

}
