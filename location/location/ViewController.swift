//
//  ViewController.swift
//  location
//
//  Created by 2020-1 on 9/30/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
// In order to use GPS
import CoreLocation;
// Get map features manipulation
import MapKit;

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var miMapa: MKMapView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var lat: CLLocationDegrees!;
    var lng: CLLocationDegrees!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.allowsBackgroundLocationUpdates = true
        //delegating from protocol
        locationManager.delegate = self
        
        miMapa.delegate = self;
        
        locationManager.startUpdatingLocation();
        
        //miMapa.showsUserLocation = true
        
        
        // In order to make zoom
        
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations);
        
        if let location = locations.first {
            lat = location.coordinate.latitude
            lng = location.coordinate.longitude
            
            let point = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.1)
            
            let region =
                MKCoordinateRegion(center: point, span: span)
            
            miMapa.setRegion(region, animated: true)
            miMapa.showsUserLocation = true
            miMapa.mapType = .standard
        }
        
    }
    
    
    
}

