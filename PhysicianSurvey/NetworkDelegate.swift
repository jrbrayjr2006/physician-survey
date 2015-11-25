//
//  NetworkDelegate.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/23/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit
import Foundation

class NetworkDelegate: NSObject {
    
    let serviceUrl : String? // = "http://www.jaydot2.com:8080";// "http://docsurvey.com:8080";
    let urlContext : String = "/spring-survey-1.0.0-BUILD-SNAPSHOT/add";
    
    init(serviceUrl : NSString) {
        self.serviceUrl = serviceUrl as String;
    }
    
    
    func submitSurvey(survey : Survey) -> String {
        //var tmpUrl: String = "\(self.serviceUrl)?username=\(username)&password=\(password)";
        
        if(survey.orgKey == nil) {
            invalidKeyMessage();
            return "611";
        }
        let rating : Int = survey.score!;
        let why_feeling : String = survey.whyFeeling!;
        let work_dissatisfaction : String = survey.operation!;
        let answer_matrix : String = survey.reason!;
        let comments : String = survey.comments!;
        let orgKey : String = survey.orgKey!;
        //add?rating=5&why_feeling=lousy&work_dissatisfaction=survey&answer_matrix=1,2,3&comments=These-comments
        let postQueryParameters : NSString = "rating=\(rating)&why_feeling=\(why_feeling)&work_dissatisfaction=\(work_dissatisfaction)&answer_matrix=\(answer_matrix)&comments=\(comments)&organization_key=\(orgKey)";
        //var post :NSString = "username=\(username)&password=\(password)";
        let newUrlString = String(self.serviceUrl!);
        NSLog("This is the url:  %@", newUrlString);
        
        let url: NSURL = NSURL(string : newUrlString)!;
        
        // http://54.88.113.204:8080/spring-survey-1.0.0-BUILD-SNAPSHOT/add?rating=1&why_feeling=Hospital Operations&work_dissatisfaction=Nursing&answer_matrix=Dismissive&comments=test"
        NSLog("PostData: %@", postQueryParameters);
        
        //postQueryParameters = postQueryParameters.stringByReplacingOccurrencesOfString("\'", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil);
        //var newPostQueryParameters = postQueryParameters.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "'"));
        NSLog("PostData: %@", postQueryParameters);
        
        let postData:NSData = postQueryParameters.dataUsingEncoding(NSASCIIStringEncoding)!;
        let postLength: NSString = String(postData.length);
        
        
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "POST";
        request.HTTPBody = postData;
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        
        var responseError: NSError?;
        var response: NSURLResponse?;
        
        var urlData: NSData?
        do {
            urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
        } catch let error as NSError {
            responseError = error
            urlData = nil
        };
        
        if urlData == nil {
            NSLog("No data returned from request...");
        } else {
            NSLog("Data returned!");
        }
        
        let res = response as! NSHTTPURLResponse!;
        
        NSLog("Response code: %ld", res.statusCode);
        
        //self.status = String(res.statusCode);
        
        //var tmp:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
        //NSLog("The data is %s", tmp);
        
        
        var responseData:NSString?
        
        if (res.statusCode >= 200 && res.statusCode < 300)
        {
            responseData = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
            
            NSLog("Response ==> %@", responseData!);
            
            
        } else {
            NSLog("Bad response");
            responseData = NSString(UTF8String: "FAILURE");
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "FAILURE"
                alertView.message = "Survey submission failed!";
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
        }
        
        return String(responseData!);  //TODO
    }
    
    private func invalidKeyMessage() -> Void {
        let alertView:UIAlertView = UIAlertView();
        alertView.title = "Invalid Organization Key"
        alertView.message = "You must have a key to use this survey app.  Go to Settings and select the Physician Survey app.  Enter your organization key in the Organization field."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
   
}
