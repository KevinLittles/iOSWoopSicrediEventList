//
//  CheckinModel.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation

struct CheckinModel: Codable {
    let eventID, name, email: String

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case name, email
    }
}

