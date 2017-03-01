//
//  ViewController.swift
//  mapApp
//
//  Created by Jason Zion on 18/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getLocation(sender: UIButton) {
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true

    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "Ze Colloseum"
        annotation.subtitle = "Rome, Italia!"
        
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    
    }

}







































