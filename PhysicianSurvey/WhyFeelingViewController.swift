//
//  WhyFeelingViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class WhyFeelingViewController: UITableViewController {
    
    private var whyFeelingArray : [String] = ["Hospital Operations", "Sound Operations"];
    
    var selectedFeelingToPass : String = "Test";
    
    var survey : Survey = Survey.sharedFavoriteList;

    @IBOutlet var whyFeelingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.whyFeelingTableView.registerClass(WhyFeelingTableViewCell.self, forCellReuseIdentifier: "whyFeelingCell");
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
        return whyFeelingArray.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "whyFeelingTableViewCell";
        let cell: WhyFeelingTableViewCell = self.whyFeelingTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WhyFeelingTableViewCell;
        
        // Configure the cell...
        var strWhyFeeling : String = String(whyFeelingArray[indexPath.row]) as String;
        //cell.accessoryType = UITableViewCellAccessoryType.DetailButton;
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        cell.whyFeelingLabel!.text = strWhyFeeling;
        return cell
    }
    
    /*
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow();
        
        let currentCell : WhyFeelingTableViewCell = tableView.cellForRowAtIndexPath(indexPath!) as! WhyFeelingTableViewCell!;
        self.selectedFeelingToPass = currentCell.whyFeelingLabel.text!;
        println("You selected cell #\(self.selectedFeelingToPass)!")
    }
    */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow();
        
        let currentCell : WhyFeelingTableViewCell = tableView.cellForRowAtIndexPath(indexPath!) as! WhyFeelingTableViewCell!;
        self.selectedFeelingToPass = currentCell.whyFeelingLabel.text!;
        survey.whyFeeling = self.selectedFeelingToPass;
        println("You selected cell #\(self.selectedFeelingToPass)!")
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.     whyFeelToOperationsSegue
        if(segue.identifier == "whyFeelToOperationsSegue") {
            var svc = segue.destinationViewController as! OperationsTableViewController;
            println("prepareForSegue:  You selected cell #\(self.selectedFeelingToPass)!")
            //svc.selectedFeeling = self.selectedFeelingToPass;
        }
    }


}
