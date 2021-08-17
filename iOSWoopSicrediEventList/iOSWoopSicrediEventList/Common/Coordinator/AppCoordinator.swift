//
//  AppCoordinator.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 16/08/21.
//

import Foundation
import UIKit
import RxSwift

protocol Coordinator: AnyObject {
    
    func start()
}
 
class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    
    init(window: UIWindow) {
       self.window = window
       self.rootViewController = UINavigationController()
    }
    
    func start() {
       window.rootViewController = rootViewController
       let viewController = EventsTableViewController(nibName: nil, bundle: nil)
       rootViewController.pushViewController(viewController, animated: true)
       window.makeKeyAndVisible()
        
        viewController.moveToNextScreenHandler = {

            viewController.moveToNextScreenHandler = {[weak self] in
                guard let rootViewController = self?.rootViewController else {
                  fatalError("rootViewController is nil")
                }
                let coordinator = EventDetailCoordinator(presentingViewController: rootViewController)
                coordinator.start()
            }
        }
    }
    
}
 
