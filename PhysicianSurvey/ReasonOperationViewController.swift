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
    
    // default dummy data
    private var reasons : [String] = ["reason1", "reason2"];
    
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
        switch(section) {
        case 0:
            return reasons.count;
        case 1:
            return 1;
        default:
            return reasons.count;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIndentifier : String = "reasonOperationTableViewCell";
        //let otherCellIdentifier : String = "otherOperationTableViewCell";
        var cell : ReasonOperationTableViewCell = self.reasonOperationTableView.dequeueReusableCellWithIdentifier(cellIndentifier) as! ReasonOperationTableViewCell;
        
        let strReason : String = String(reasons[indexPath.row]) as String;
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
        
        survey.reason = "TBD"; // reason!;
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
