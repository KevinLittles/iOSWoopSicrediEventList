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
    var checkinHandler = CheckinHandler()
    
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
    
    let checkinButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        eventDetailHandler.delegate = self
        self.title = EventDetailHandler.event?.title
        
        setupScrollView()
        setupEventImageView()
        setupTextViewsAndLabels()
        setupTableView()
        setupCheckinButton()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true;
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        setupContentView()

        func setupContentView() {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(contentView)
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

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
        eventImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
    func setupTextViewsAndLabels() {
        setupEventTitleLabel()
        setupHorizontalStackView()
        setupEventDescriptionLabel()
        
        func setupEventTitleLabel() {
            eventTitleLabel.text = EventDetailHandler.event?.title
            eventTitleLabel.numberOfLines = 0
            eventTitleLabel.sizeToFit()
            eventTitleLabel.textColor = UIColor.black
            eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventTitleLabel)
            
            eventTitleLabel.font = UIFont.systemFont(ofSize: 28)
            eventTitleLabel.frame = CGRect(x:0,y:0,width: eventTitleLabel.intrinsicContentSize.width,height: eventTitleLabel.intrinsicContentSize.height)
            
            eventTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
            eventTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
            eventTitleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 20).isActive = true
            
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
            
            horizontalStackView.frame = CGRect(x:0,y:0,width: eventLocalLabel.intrinsicContentSize.width,height: eventLocalLabel.intrinsicContentSize.height)
            
            horizontalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            horizontalStackView.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 20).isActive = true
            
            horizontalStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
            
            func setupEventPriceLabel() {
                eventPriceLabel.text = "\((EventDetailHandler.event?.price)!)" + " $"
                eventPriceLabel.font = UIFont.systemFont(ofSize: 16)
                eventPriceLabel.sizeToFit()
                eventPriceLabel.textColor = UIColor.black
                eventPriceLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventPriceLabel)
                
            }
            func setupEventLocalLabel() {

                eventDetailHandler.getAddressFromLatLon(pdblLatitude: EventDetailHandler.event!.latitude, withLongitude: EventDetailHandler.event!.longitude)
                eventLocalLabel.font = UIFont.systemFont(ofSize: 16)
                eventLocalLabel.sizeToFit()
                eventLocalLabel.textColor = UIColor.black
                eventLocalLabel.translatesAutoresizingMaskIntoConstraints = false
                horizontalStackView.addArrangedSubview(eventLocalLabel)
                
            }
        }
        
        func setupEventDescriptionLabel() {
            eventDescriptionLabel.text = EventDetailHandler.event?.eventDescription
            eventDescriptionLabel.numberOfLines = 0
            eventDescriptionLabel.sizeToFit()
            eventDescriptionLabel.textColor = UIColor.black
            eventDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventDescriptionLabel)
            
            eventDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
            eventDescriptionLabel.frame.size = CGSize(width: eventDescriptionLabel.intrinsicContentSize.width,height: eventDescriptionLabel.intrinsicContentSize.height)
            
            eventDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
            eventDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
            eventDescriptionLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 20).isActive = true
            
        }
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        print(tableView.contentSize.height)
        
      }
    
    override func viewDidLayoutSubviews(){
        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        print(tableView.contentSize.height)
        tableView.reloadData()
    }
    
    func setupCheckinButton() {
        checkinButton.backgroundColor = .blue
        checkinButton.setTitle("Checkin", for: .normal)
        checkinButton.addTarget(self, action: #selector(checkinButtonAction), for: .touchUpInside)
        checkinButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkinButton)
        
        checkinButton.layer.cornerRadius = 5
        
        checkinButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        checkinButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 100).isActive = true
        checkinButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -100).isActive = true
        checkinButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    @objc func checkinButtonAction(sender: UIButton!) {
        
        //Abaixo, deveria subir um popup para preencher os dados, seriam eles: eventId, name, email. Assim como o modelo "CheckinModel"
        
        //checkinHandler.postCheckin(checkin: <#T##CheckinModel#>) ---> Essa função faria o checkin do interessado, fazendo um POST com o objeto CheckinModel transformado em JSON
    }
    
}

extension EventDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (EventDetailHandler.event?.people.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = EventDetailHandler.event?.people[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Participantes"
    }
    
    
}

extension EventDetailViewController: EventDetailHandlerDelegate {
    
    func didGetAddressFromLatLon(city: String) {
        eventLocalLabel.text = city
    }
}

