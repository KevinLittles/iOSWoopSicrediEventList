//
//  EventDetailViewController.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController {

    var eventDetailHandler = EventDetailHandler()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    var tableView = UITableView()
    
    var eventImageView = UIImageView()
    var eventTitleLabel = UILabel()
    var eventDataLabel = UILabel()
    var eventPriceLabel = UILabel()
    var eventLocalLabel = UILabel()
    var eventDescriptionLabel = UILabel()
    var eventPriceTextView = UITextView()
    var eventDateTextView = UITextView()
    let horizontalStackView = UIStackView()
    
    let shareButton = UIButton()
    let checkinButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventDetailHandler.delegate = self
        tableView.dataSource = self
        
        setupScrollView()
        setupEventImageView()
        setupTextViewsAndLabels()
        setupTableView()
        setupButtons()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

        setupContentView()

        func setupContentView() {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(contentView)
            
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
            
        }
    }
    
    func setupEventImageView() {
        if let image = URL(string: EventDetailHandler.event!.image) {
            eventImageView.load(url: image)
        }
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImageView)
        
        eventImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        eventImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        eventImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 4/10).isActive = true
    }
    
    func setupTextViewsAndLabels() {
        setupEventTitleLabel()
        setupHorizontalStackView()
        setupEventDescriptionLabel()
        
        func setupEventTitleLabel() {
            eventTitleLabel.text = EventDetailHandler.event?.title
            eventTitleLabel.numberOfLines = 0
            eventTitleLabel.sizeToFit()
            eventTitleLabel.textColor = UIColor.white
            eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventTitleLabel)
            
            eventTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            eventTitleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
            
            eventTitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            eventTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/6).isActive = true
        }
        
        func setupHorizontalStackView() {
            setupEventPriceLabel()
            setupEventLocalLabel()
            
            horizontalStackView.axis = .horizontal
            horizontalStackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
            horizontalStackView.distribution = .fillEqually // .fillEqually .fillProportionally .equalSpacing .equalCentering
            horizontalStackView.spacing = 5
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(horizontalStackView)
            
            //horizontalStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            horizontalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            horizontalStackView.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor).isActive = true
            
            horizontalStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            horizontalStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/8).isActive = true
            
            
            func setupEventPriceLabel() {
                eventPriceLabel.text = "\((EventDetailHandler.event?.price)!)" + " $"
                eventPriceLabel.sizeToFit()
                eventPriceLabel.textColor = UIColor.white
                eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventPriceLabel)
                
            }
            func setupEventLocalLabel() {

                eventDetailHandler.getAddressFromLatLon(pdblLatitude: EventDetailHandler.event!.latitude, withLongitude: EventDetailHandler.event!.longitude)
                eventLocalLabel.sizeToFit()
                eventLocalLabel.textColor = UIColor.white
                eventLocalLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventLocalLabel)
                
            }
        }
        
        func setupEventDescriptionLabel() {
            eventDescriptionLabel.text = EventDetailHandler.event?.eventDescription
            eventDescriptionLabel.numberOfLines = 0
            eventDescriptionLabel.sizeToFit()
            eventDescriptionLabel.textColor = UIColor.white
            eventDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventDescriptionLabel)
            
            eventDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            eventDescriptionLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 25).isActive = true
            
            eventDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            eventDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/6).isActive = true
            
        }
    }
    
    func setupTableView() {
        contentView.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
      }
    
    func setupButtons() {
        setupShareButton()
        setupCheckinButton()
        
        func setupShareButton() {
            
        }
        func setupCheckinButton() {
            
        }
    }
    
}

extension EventDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (EventDetailHandler.event?.people.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = EventDetailHandler.event?.people[indexPath.row].name
        
        return cell
    }
    
    
}

extension EventDetailViewController: EventDetailHandlerDelegate {
    
    func didGetAddressFromLatLon(city: String) {
        eventLocalLabel.text = city
    }
}

