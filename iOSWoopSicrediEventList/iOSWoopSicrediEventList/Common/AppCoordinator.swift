//
//  AppCoordinator.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 16/08/21.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let viewController = EventsTableViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
