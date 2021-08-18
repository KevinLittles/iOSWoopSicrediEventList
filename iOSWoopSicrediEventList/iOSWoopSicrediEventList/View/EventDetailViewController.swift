//
//  EventDetailViewController.swift
//  iOSWoopSicrediEventList
//
//  Created by Kevin Ribeiro on 17/08/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    var eventDetailHandler: EventDetailHandler?
    
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
        eventImageView.image = UIImage()
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
        setupEventPriceTextView()
        setupEventDateTextView()
        
        func setupEventTitleLabel() {
            eventTitleLabel.text = "título"
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
            setupEventDataLabel()
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
            
            func setupEventDataLabel() {
                eventDataLabel.text = "data"
                eventDataLabel.sizeToFit()
                eventDataLabel.textColor = UIColor.white
                eventDataLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventDataLabel)
                
            }
            func setupEventPriceLabel() {
                eventPriceLabel.text = "price"
                eventPriceLabel.sizeToFit()
                eventPriceLabel.textColor = UIColor.white
                eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventPriceLabel)
                
            }
            func setupEventLocalLabel() {
                eventLocalLabel.text = "local"
                eventLocalLabel.sizeToFit()
                eventLocalLabel.textColor = UIColor.white
                eventLocalLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventLocalLabel)
                
            }
        }
        
        func setupEventDescriptionLabel() {
            eventDescriptionLabel.text = "descrição"
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
        func setupEventPriceTextView() {
            
        }
        func setupEventDateTextView() {
            
        }
    }
    
    func setupTableView() {
        contentView.addSubview(tableView)
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