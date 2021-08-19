//
//  EventsHandler.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation
import RxSwift
import CoreLocation

//showEventDetail

struct ListOfEventsHandler {
    private let apiCalling = EventAPICalling()
    private let apiRequest = APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events", method: .GET)
    
    func getListOfEvents() -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getListOfEvents(apiRequest: apiRequest)
        
        return result
    }
    
}

protocol EventDetailHandlerDelegate {
    func didGetAddressFromLatLon(city: String)
}

struct EventDetailHandler {
    
    static var event: EventModel?
    var delegate: EventDetailHandlerDelegate?
    
    private let apiCalling = EventAPICalling()
    
    func getApiRequest() -> APIRequest {
        return APIRequest(stringURL: "http://5f5a8f24d44d640016169133.mockapi.io/api/events/"+EventDetailHandler.event!.id, method: .GET)
    }

    func getEventDetail() -> Observable<[EventModel]>{
        let result: Observable<[EventModel]> = self.apiCalling.getEvent(apiRequest: getApiRequest())
        
        return result
    }
    
    func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()

        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = pdblLatitude
        center.longitude = pdblLongitude

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)

        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]

                if pm.count > 0 {
                    let result = placemarks![0].locality
                    
                    delegate!.didGetAddressFromLatLon(city: result ?? "")
                }
            })
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
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
