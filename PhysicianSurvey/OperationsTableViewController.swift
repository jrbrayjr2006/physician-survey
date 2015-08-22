//
//  OperationsTableViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class OperationsTableViewController: UITableViewController {
    
    var hospitalOperationsArray : [String] = ["Nursing", "Consultants", "Operator", "Paging", "Dictation", "Queries", "Rapid Response/Codes", "PCP’s", "Case Managers"];
    var soundOperationsArray : [String] = ["Leadership", "Sound Connect", "Fellow Hospitalists"];
    var survey :Survey = Survey.sharedFavoriteList;
    var selectedFeeling : String?;
    
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
            println(operations!);
        }
        else {
            operations = String(soundOperationsArray[indexPath.row]) as String;
            println(operations!);
        }
        
        //var operations : String = String(soundOperationsArray[indexPath.row]) as String;
        
        //cell.accessoryType = UITableViewCellAccessoryType.DetailButton;
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        //cell.operationsCellLabel!.description = "";
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
