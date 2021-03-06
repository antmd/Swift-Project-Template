//
//  Constants.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright (c) 2016 XLOrganizationName. All rights reserved.
//

import Foundation
import Opera
import XLSwiftKit

struct Constants {

	struct Network {
        static let baseUrl = NSURL(string: "https://api.github.com")!
        static let authToken = "________"
        static let authTokenName = "auth_token"
        static let statusCodeString = "statusCode"
        static let SuccessCode = 200
        static let successRange = 200..<300
        static let Unauthorized = 401
        static let NotFoundCode = 404
        static let ServerError = 500
    }
    
    struct Formatters {
        
        static let debugConsoleDateFormatter: NSDateFormatter = {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            formatter.timeZone = NSTimeZone(name: "UTC")!
            return formatter
        }()
        
    }
    
    struct Debug {
        static let crashlytics = false
        static let jsonResponse = false
    }
}

func DEBUGLog(message: String, file: String = #file, line: Int = #line, function: String = #function) {
#if DEBUG
    let fileURL = NSURL(fileURLWithPath: file)
    let fileName = fileURL.URLByDeletingPathExtension?.lastPathComponent ?? ""
    print("\(NSDate().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
#endif
    // Nothing to do if not debugging
}

func DEBUGJson(value: AnyObject) {
#if DEBUG
    if Constants.Debug.jsonResponse {
        print(JSONStringify(value))
    }
#endif
}
