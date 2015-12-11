//
//  Utils.swift
//
//  Created by Augus on 11/10/15.
//  Copyright © 2015 iAugus. All rights reserved.
//

import Foundation


class Utils {
    
    class func documentPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }
    
    class func appGroupDocumentPath(appGroupId: String) -> String {
        let url = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(appGroupId)
        let path = url!.absoluteString.stringByReplacingOccurrencesOfString("file:", withString: "", options: .LiteralSearch, range: nil)
        return path

    }
    
}


// MARK: - GCD
var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}