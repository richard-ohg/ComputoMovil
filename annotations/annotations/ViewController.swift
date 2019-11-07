//
//  ViewController.swift
//  annotations
//
//  Created by 2020-1 on 10/7/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

// Protocols delegated in order to access map, get location and add markers
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    let locationMgr = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationMgr.delegate = self;
        myMap.delegate = self;
        
        locationMgr.requestAlwaysAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr.distanceFilter = kCLDistanceFilterNone
        
        locationMgr.startUpdatingLocation()
        
        myMap.showsUserLocation = true;
        
    }
    
    // Location was updated
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        // Updating zoom
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.009));
        myMap.setRegion(region, animated: true);
    }
    
    @IBAction func addMarker(_ sender: UIButton){
        let myAnnotation = CustomAnnotation();
        myAnnotation.coordinate = CLLocationCoordinate2D(latitude: 19.35738, longitude: -99.0671)
        myAnnotation.title = "Iztapalapa"
        myAnnotation.subtitle = "Te filetean"
        myAnnotation.imageURL = "like1"
//        myAnnotation.latitud = "18471948.2883"
        
        let myAnnotation2 = CustomAnnotation();
        myAnnotation2.coordinate = CLLocationCoordinate2D(latitude: 19.3275628, longitude: -99.1821295)
        myAnnotation2.title = "Instituto de "
        myAnnotation2.subtitle = "Quimica"
        myAnnotation2.imageURL = "like1"
//        myAnnotation2.latitud = "18471948.2883"
        myMap.addAnnotation(myAnnotation)
        myMap.addAnnotation(myAnnotation2)
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        var pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "PinAnnotationView")
        
        if pinAnnotationView == nil {
            pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "PinAnnotationView")
            
            // Callout is a popover above the pin
            pinAnnotationView?.canShowCallout = true
            
        } else {
            // Reusing from recycled annotations
            pinAnnotationView?.annotation = annotation
        }
        
        if let pinAnnotation = annotation as? CustomAnnotation {
            pinAnnotationView?.image = UIImage(named: pinAnnotation.imageURL)
        }
        
        return pinAnnotationView
        
    }
    
    
}

