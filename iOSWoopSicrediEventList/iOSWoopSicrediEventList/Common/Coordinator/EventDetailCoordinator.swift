//
//  detail.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import Foundation
import UIKit

public class EventDetailCoordinator: Coordinator {
    
    private let presentingViewController: UINavigationController
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func start() {
        let detailsViewController = EventDetailViewController(nibName: nil, bundle: nil)
        presentingViewController.pushViewController(detailsViewController, animated: true)
    }
}
