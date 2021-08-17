//
//  EventsModel.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 16/08/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let event = try? newJSONDecoder().decode(Event.self, from: jsonData)

import Foundation

// MARK: - Event
struct EventModel: Codable {
    let people: [Person]
    let date: Int
    let eventDescription: String
    let image: String
    let longitude, latitude, price: Double
    let title, id: String

    enum CodingKeys: String, CodingKey {
        case people, date
        case eventDescription = "description"
        case image, longitude, latitude, price, title, id
    }
}

// MARK: - Person
struct Person: Codable {
    let id, eventID, name, picture: String

    enum CodingKeys: String, CodingKey {
        case id
        case eventID = "eventId"
        case name, picture
    }
}
