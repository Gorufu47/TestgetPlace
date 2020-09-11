//
//  ViewController.swift
//  getPlacesTest
//
//  Created by CSMJU Studio on 10/9/2563 BE.
//  Copyright © 2563 CSMJU Studio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, CLLocationManagerDelegate
//    , PlacesDelegate, UITableViewDelegate
{
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?
    var isLocationInitialized = false

    @IBOutlet weak var tableView: UITableView!
    
    let places = Places()
    var venues = [Venue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        places.getPlace()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return places.venues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Basiccell", for: indexPath) as UITableViewCell
        let venue = places.venues[(indexPath as NSIndexPath).row]

        // Configure the cell...
        cell.textLabel?.text = venue.name
        cell.detailTextLabel?.text = venue.location.address
//        cell.imageView?.sd_cancelCurrentAnimationImagesLoad()
//
//        var categoryIconURL: URL? = nil
//        if let categories = venue.categories {
//            if !categories.isEmpty {
//                categoryIconURL = URL(string: categories[0].icon.categoryIconUrl)
//            }
//        }
//        cell.imageView?.sd_setImage(with: categoryIconURL, placeholderImage: UIImage(named: "none"))

        return cell
    }
}
