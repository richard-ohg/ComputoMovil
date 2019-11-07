//
//  ViewController.swift
//  CM-addresses
//
//  Created by 2020-1 on 10/9/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self
        
        let startLocation =
            CLLocationCoordinate2D(latitude: 19.3272501, longitude: -99.1825469);
        let endLocation =
            CLLocationCoordinate2D(latitude: 19.3248272, longitude: -99.1847808);
        
        let startAnnotation = Address(title: "Anexo", subtitle: "De ingenieria", location: startLocation)
        let endAnnotation = Address(title: "Conta", subtitle: "FCA", location: endLocation)
        
        myMap.addAnnotation(startAnnotation)
        myMap.addAnnotation(endAnnotation)
        
        // Adding placemarks in order to create a route between placemarks
        
  
        let startPlacemark = MKPlacemark(coordinate: startLocation);
        let endPlacemark = MKPlacemark(coordinate: endLocation);
        
        let routeRequest = MKDirections.Request();
        routeRequest.source = MKMapItem(placemark: startPlacemark)
        routeRequest.destination = MKMapItem(placemark: endPlacemark)
        routeRequest.transportType = .walking
        
        let directions = MKDirections(request: routeRequest);
        
        directions.calculate { (response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let directionsResponse = response else {
                return
            }
            let route = directionsResponse.routes.first
            self.myMap.addOverlay(route!.polyline)
            
            // Create area between A and B point
            let area = route?.polyline.boundingMapRect
            self.myMap.setRegion(MKCoordinateRegion(area!), animated: true)
        }
   }
    
    // When an overlay is added (addOverlay()), this method is called
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let line = MKPolylineRenderer(overlay: overlay)
        line.strokeColor = .red
        line.lineWidth = 6.0
        return line
    }


}

