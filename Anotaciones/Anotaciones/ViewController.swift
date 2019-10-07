//
//  ViewController.swift
//  Anotaciones
//
//  Created by Ricardo Hernandez D4 on 10/7/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManger = CLLocationManager()
    @IBOutlet weak var mapa: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        mapa.delegate = self
        
        locationManger.requestWhenInUseAuthorization()
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.distanceFilter = kCLDistanceFilterNone
        
        locationManger.startUpdatingLocation()
        
        mapa.showsUserLocation = true
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        
        mapa.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        var pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "PinAnnotationView")
        
        if pinAnnotationView == nil{
            pinAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "PinAnnotationView")
            
            pinAnnotationView?.canShowCallout = true
        }else{
            pinAnnotationView?.annotation = annotation
        }
        
        if let pinAnnotation = annotation as? PinAnnotation{
            pinAnnotationView?.image = UIImage(named: pinAnnotation.imageUrl)
        }
        
        return pinAnnotationView
    }
    
    @IBAction func agregarAnotacion(_ sender: UIButton) {
        let anotation = PinAnnotation()
        
        anotation.coordinate = CLLocationCoordinate2D(latitude: 19.35758, longitude: -99.0671)
        anotation.title = "iyos"
        anotation.subtitle = "Nice place to work"
        anotation.imageUrl = "imagen"
        
        mapa.addAnnotation(anotation)
    }

}

