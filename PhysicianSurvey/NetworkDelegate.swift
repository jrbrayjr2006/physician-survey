//
//  NetworkDelegate.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/23/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import UIKit

class NetworkDelegate: NSObject {
    
    let serviceUrl : String = "http://54.88.113.204:8080";
    let urlContext : String = "/spring-survey-1.0.0-BUILD-SNAPSHOT";
    
    public func submitSurvey(survey : Survey) {
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
        
    }
   
}
