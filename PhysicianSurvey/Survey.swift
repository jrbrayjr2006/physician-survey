//
//  Survey.swift
//  PhysicianSurvey
//
//  Created by JAMES BRAY on 8/20/15.
//  Copyright (c) 2015 Jaydot2 LLC. All rights reserved.
//

import Foundation
import UIKit

class Survey: NSObject {
    
    var score : Int?;
    var whyFeeling : String?;
    var operation : String?;
    var comments : String?;
    
    class var sharedFavoriteList : Survey {
        struct Singleton {
            static let instance = Survey();
        }
        return Singleton.instance;
    }
   
}
