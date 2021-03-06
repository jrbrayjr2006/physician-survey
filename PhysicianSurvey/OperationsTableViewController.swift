//
//  OperationsTableViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class OperationsTableViewController: UITableViewController {
    
    var hospitalOperationsArray : [String] = ["Hospital Administration", "Staff Interactions", "Communications", "Documentation", "Other"];
    var soundOperationsArray : [String] = ["Physician Support", "Human Resources", "Technology", "Equipment", "Other"];
    var survey :Survey = Survey.sharedFavoriteList;
    var selectedFeeling : String?;
    var operation : String?;
    
    @IBOutlet var operationsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.operationsTableView.registerClass(OperationsTableViewCell.self, forCellReuseIdentifier: "operationsTableViewCell");
        self.selectedFeeling = survey.whyFeeling!;
        self.title = self.selectedFeeling;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        // add logic to select which array to use
        if selectedFeeling == "Hospital Operations" {
            return hospitalOperationsArray.count;
        }
        else {
            return soundOperationsArray.count;
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "operationsTableViewCell";
        let cell: OperationsTableViewCell = self.operationsTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! OperationsTableViewCell;
        
        var operations : String?;
        
        // Configure the cell...
        if selectedFeeling == "Hospital Operations"  {
            operations = String(hospitalOperationsArray[indexPath.row]) as String;
            //println(operations!);
        }
        else {
            operations = String(soundOperationsArray[indexPath.row]) as String;
            //println(operations!);
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        cell.textLabel?.text = operations!;
        survey.operation = operations!;
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow;
        if selectedFeeling == "Hospital Operations"  {
            operation = String(hospitalOperationsArray[indexPath!.row]) as String;
            print(operation!);
        }
        else {
            operation = String(soundOperationsArray[indexPath!.row]) as String;
            print(operation!);
        }
        survey.operation = operation!;
        self.performSegueWithIdentifier("operationsToIssueDetailSegue", sender: self);
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Prepare to show reason screen...");
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
