//
//  EventsTableViewController.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 16/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class EventsTableViewController: UITableViewController {
    
    var moveToNextScreenHandler: (() -> Void)?
    
    
    let listOfEventsHandler = ListOfEventsHandler()
    let checkinHandler = CheckinHandler()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Eventos"
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        tableView.rx.setDelegate(self).disposed(by: bag)
        tableView.tableFooterView = UIView()
        
        bindTableView()

    }

    func bindTableView() {
        
        startAndLoadTableView()
        didSelectedItemOnTableView()
        
        func startAndLoadTableView() {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            listOfEventsHandler.getListOfEvents().bind(to: tableView.rx.items(cellIdentifier: "cell")) { ( row, model, cell) in
                cell.textLabel?.text = model.title
            }.disposed(by: bag)
        }
        
        func didSelectedItemOnTableView() {
            tableView.rx.modelSelected(EventModel.self).subscribe(onNext: { item in
                
                EventDetailHandler.event = item
                self.moveToNextScreenHandler?()
                
            }).disposed(by: bag)
        }
    }
    
}
