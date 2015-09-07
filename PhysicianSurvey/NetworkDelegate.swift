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
    
    let serviceUrl : String?  // = "http://54.88.113.204:8080";
    let urlContext : String = "/spring-survey-1.0.0-BUILD-SNAPSHOT/add";
    
    init(serviceUrl : NSString) {
        self.serviceUrl = serviceUrl as String;
    }
    
    /*
    func submitSurvey2(survey : Survey) {
        var postQueryParameters : NSString = "TBD";
        var surveyUrlString : String = String(self.serviceUrl) + String(self.urlContext) + "?" + String(postQueryParameters);
        
        var url: NSURL = NSURL(string: surveyUrlString)!;
        
        var postData:NSData = postQueryParameters.dataUsingEncoding(NSASCIIStringEncoding)!;
        var postLength: NSString = String(postData.length);
        
        // build the request
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "POST";
        request.HTTPBody = postData;
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        
        var responseError: NSError?;
        var response: NSURLResponse?;
        //TODO
    }
    */
    
    
    func submitSurvey(survey : Survey) -> String {
        //var tmpUrl: String = "\(self.serviceUrl)?username=\(username)&password=\(password)";
        
        if(survey.orgKey == nil) {
            invalidKeyMessage();
            return "611";
        }
        var rating : Int = survey.score!;
        var why_feeling : String = survey.whyFeeling!;
        var work_dissatisfaction : String = survey.operation!;
        var answer_matrix : String = survey.reason!;
        var comments : String = survey.comments!;
        var orgKey : String = survey.orgKey!;
        //add?rating=5&why_feeling=lousy&work_dissatisfaction=survey&answer_matrix=1,2,3&comments=These-comments
        var postQueryParameters : NSString = "rating=\(rating)&why_feeling=\(why_feeling)&work_dissatisfaction=\(work_dissatisfaction)&answer_matrix=\(answer_matrix)&comments=\(comments)&orgKey=\(orgKey)";
        //var post :NSString = "username=\(username)&password=\(password)";
        var newUrlString = String(self.serviceUrl!);
        NSLog("This is the url:  %@", newUrlString);
        
        let url: NSURL = NSURL(string : newUrlString)!;
        
        // http://54.88.113.204:8080/spring-survey-1.0.0-BUILD-SNAPSHOT/add?rating=1&why_feeling=Hospital Operations&work_dissatisfaction=Nursing&answer_matrix=Dismissive&comments=test"
        NSLog("PostData: %@", postQueryParameters);
        
        //postQueryParameters = postQueryParameters.stringByReplacingOccurrencesOfString("\'", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil);
        //var newPostQueryParameters = postQueryParameters.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "'"));
        NSLog("PostData: %@", postQueryParameters);
        
        var postData:NSData = postQueryParameters.dataUsingEncoding(NSASCIIStringEncoding)!;
        var postLength: NSString = String(postData.length);
        
        
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url);
        request.HTTPMethod = "POST";
        request.HTTPBody = postData;
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.setValue("application/json", forHTTPHeaderField: "Accept");
        
        var responseError: NSError?;
        var response: NSURLResponse?;
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&responseError);
        
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
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "FAILURE"
                alertView.message = "Survey submission failed!";
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                
        }
        
        return String(responseData!);  //TODO
    }
    
    private func invalidKeyMessage() -> Void {
        var alertView:UIAlertView = UIAlertView();
        alertView.title = "Invalid Organization Key"
        alertView.message = "You must have a key to use this survey app.  Go to Settings and select the Physician Survey app.  Enter your organization key in the Organization field."
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
        return;
    }
   
}
