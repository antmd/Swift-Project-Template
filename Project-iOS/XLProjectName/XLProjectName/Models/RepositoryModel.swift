//
//  ExampleRepository.swift
//  XLProjectName
//
//  Created by XLAuthorName ( XLAuthorWebsite )
//  Copyright © 2016 XLOrganizationName. All rights reserved.
//

import Foundation
import SwiftDate
import RealmSwift
import Decodable
import Opera


final class Repository: Object {
    
    dynamic var id: Int = Int.min
    dynamic var name: String = ""
    dynamic var desc: String?
    dynamic var company: String?
    dynamic var language: String?
    dynamic var openIssues: Int = Int.min
    dynamic var stargazersCount: Int = Int.min
    dynamic var forksCount: Int = Int.min
    dynamic var urlString: String = ""
    dynamic var createdAt: NSDate = NSDate()

    // do not save this properties, notice that it is returned by ignoredProperties method
    dynamic var tempId: String = ""
    
    // computed properties
    var url: NSURL {
        return NSURL(string: self.urlString)!
    }
    
    /**
     Set the model primary key. 
     Declaring a primary key allows objects to be looked up and updated efficiently and enforces uniqueness for each value.
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
    /**
     Realm supports indexing for strings, integers, booleans and NSDate properties.
     Indexing a property will greatly speed up queries where the property is compared 
     for equality (i.e. the = and IN operators), at the cost of slower insertions.
     */
    override static func indexedProperties() -> [String] {
        return ["name", "language"]
    }
    
    
    /**
     Return property names that should be ignored by Realm. Realm will not persist these properties.
     */
    override static func ignoredProperties() -> [String] {
        return ["tempId"]
    }
    
    convenience init(id: Int, name: String, desc: String?, company: String?, language: String?, openIssues: Int, stargazersCount: Int, forksCount: Int, urlString: String, createdAt: NSDate) {
        self.init()
        self.id = id
        self.name = name
        self.desc = desc
        self.company = company
        self.language = language
        self.openIssues = openIssues
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.urlString = urlString
        self.createdAt = createdAt
    }
}

extension Repository: Decodable, OperaDecodable {


    static func decode(j: AnyObject) throws -> Repository {
        return try Repository(   id: j => "id",
                               name: j => "name",
                               desc: j =>? "description",
                            company: j =>? ["owner", "login"],
                           language: j =>? "language",
                         openIssues: j => "open_issues_count",
                    stargazersCount: j => "stargazers_count",
                         forksCount: j => "forks_count",
                          urlString: j => "name",
                          createdAt: j => "created_at")
    }
}
