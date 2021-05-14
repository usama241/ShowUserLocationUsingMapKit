//
//  ViewController.swift
//  MyLocation
//
//  Created by macbook on 14/05/2021.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate=self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations location: [CLLocation]) {
        if let location = location.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    func render(_ location: CLLocation)  {
        let cordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: cordinate, span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = cordinate
        mapView.addAnnotation(pin)
        
    }
}

