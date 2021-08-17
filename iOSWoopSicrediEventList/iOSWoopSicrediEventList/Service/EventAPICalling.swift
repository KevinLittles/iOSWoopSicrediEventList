//
//  EventAPICalling.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation
import RxSwift

class APICalling {

    func getListOfEvents<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        
        return Observable<T>.create { observer in
            let request = apiRequest.request()
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: ListOfEventsModel = try JSONDecoder().decode(ListOfEventsModel.self, from: data ?? Data())
                    observer.onNext( model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func getEvent<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request()
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: EventModel = try JSONDecoder().decode(EventModel.self, from: data ?? Data())
                    observer.onNext( model as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func postCheckin<T: Codable>(apiRequest: APIRequest, checkinModel: CheckinModel) -> Observable<T> {
        
        return Observable<T>.create { observer in
            var request = apiRequest.request()
            
            do {
                let encoder = JSONEncoder()
                let checkinModelEncoded = try encoder.encode(checkinModel)
                
                let jsonData = try JSONSerialization.data(withJSONObject: checkinModelEncoded)
                
                request.httpBody = jsonData
            } catch {
                print(error)
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                do {
                    if let safeData = data {
                        let responseJson = try JSONSerialization.jsonObject(with: safeData, options: [])
                        
                        print(responseJson)
                        observer.onNext(responseJson as! T)
                    }
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }


       }
}
