//
//  EventsHandler.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation
import RxSwift

struct ListOfEventsHandler {
    private let apiCalling = EventAPICalling()
    private let disposeBag = DisposeBag()
    private let apiRequest = APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events", method: .GET)
    
    func getListOfEvents() -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getListOfEvents(apiRequest: apiRequest)
        
        return result
    }
    
}

struct EventDetailHandler {
    private let apiCalling = EventAPICalling()
    private let disposeBag = DisposeBag()
    
    func getApiRequest(id: String) -> APIRequest {
        return APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events/"+id, method: .GET)
    }

    func getEventDetail(id: String) -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getEvent(apiRequest: getApiRequest(id: id))
        
        return result
    }
}

struct CheckinHandler {
    private let apiCalling = EventAPICalling()
    private let disposeBag = DisposeBag()
    private let apiRequest = APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin", method: .POST)
    
    func postCheckin(checkin: CheckinModel) -> Observable<[CheckinModel]>{
        let result: Observable<[CheckinModel]> = self.apiCalling.postCheckin(apiRequest: apiRequest, checkinModel: checkin)
        
        return result
    }
}
