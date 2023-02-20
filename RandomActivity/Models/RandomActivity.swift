//
//  RandomActivity.swift
//  RandomActivity
//
//  Created by Olga Tegza on 26.12.2022.
//

struct RandomActivity: Codable {
    let activity, type: String
    let participants: Int
    let price: Double
    let link: String
    let accessibility: Double
    
    var description: String {
        """
    Your random activity: \(activity)
    With type: \(type)
    The amount of participants: \(participants)
    It will cost you: \(price)
    You should use the link: \(link)
    Accessibility: \(accessibility)
    """
    }
}

enum Link: String {
    case activityURL = "https://www.boredapi.com/api/activity"
}
