//
//  EventsHandler.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation
import RxSwift

//showEventDetail

struct ListOfEventsHandler {
    private let apiCalling = EventAPICalling()
    private let apiRequest = APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events", method: .GET)
    
    func getListOfEvents() -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getListOfEvents(apiRequest: apiRequest)
        
        return result
    }
    
}

struct EventDetailHandler {
    
    static var event: EventModel?
    
    private let apiCalling = EventAPICalling()
    
    func getApiRequest() -> APIRequest {
        return APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events/"+EventDetailHandler.event!.id, method: .GET)
    }

    func getEventDetail() -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getEvent(apiRequest: getApiRequest())
        
        return result
    }
}

struct CheckinHandler {
    private let apiCalling = EventAPICalling()
    private let apiRequest = APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin", method: .POST)
    
    func postCheckin(checkin: CheckinModel) -> Observable<[CheckinModel]>{
        let result: Observable<[CheckinModel]> = self.apiCalling.postCheckin(apiRequest: apiRequest, checkinModel: checkin)
        
        return result
    }
}
