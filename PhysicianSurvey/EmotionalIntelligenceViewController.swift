//
//  EmotionalIntelligenceViewController.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class EmotionalIntelligenceViewController: UIViewController {
    
    var feelings : [Int] = [1,2,3,4,5,6,7,8,9,10];
    
    var strFeeling : String?;
    
    var selectedValue : Int = 1;
    
    var survey : Survey = Survey.sharedFavoriteList;

    @IBOutlet weak var feelingPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return feelings.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        strFeeling = String(feelings[row]) as String;
        var selectedValue : Int = feelings[row];
        
        //survey.score = selectedValue;
        return strFeeling;
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        strFeeling = String(feelings[row]) as String;
        selectedValue = feelings[row];
        
        survey.score = selectedValue;
    }
    

    @IBAction func provideDetailsOnTouchUp(sender: UIButton) {
        survey.score = selectedValue;
        println(strFeeling!);
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "emotionalIntelToWyFeelingSegue") {
            var svc = segue.destinationViewController as! WhyFeelingViewController;
        }
    }
    

}
