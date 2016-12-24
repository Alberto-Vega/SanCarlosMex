//
//  Review.swift
//  Expedia
//
//  Created by Alberto Vega Gonzalez on 8/25/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class Review {
    var title: String?
    var reviewText: String?
    var ratingOverall: Int?
    var userNickName: String?
    var date: String?

    
    init(userNickName: String, title:String, reviewText: String, ratingOverall: Int, date: String) {
        self.userNickName = userNickName
        self.title = title
        self.reviewText = reviewText
        self.ratingOverall = ratingOverall
        self.date = date
    }
    
    init?(initWithIdDictionary IdDictionary:[String: AnyObject]) {

        guard let userNick = IdDictionary["userNickname"] as? String else { print("Review initWithDicionary failed at userNick");return }

        guard let title = IdDictionary["title"] as? String else { print("Review initWithDicionary failed at title");return }
        
        guard let reviewText = IdDictionary["reviewText"] as? String else { print("Review initWithDicionary failed at reviewText");return }
        
        guard let ratingOverall = IdDictionary["ratingOverall"] as? Int else { print("Review initWithDicionary failed at ratingOverall");return }
        
        guard let date = IdDictionary["reviewSubmissionTime"] as? String else { print("Review initWithDicionary failed at reviewSubmissionTime");return }
        

        
        self.title = title
        self.reviewText = reviewText
        self.ratingOverall = ratingOverall
        self.userNickName = userNick
        self.date = date
        }
}
