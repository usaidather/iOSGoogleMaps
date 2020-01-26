//
//  ViewController.swift
//  GoogleMapsTutorial
//
//  Created by Usaid Ather on 26/01/2020.
//  Copyright © 2020 Usaid Ather. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var slider: UISlider!
    
    // Lati longi for karachi pakistan
    let latitude:Float = 24.8607
    let longitude:Float = 67.0011
    var circle = GMSCircle()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupCircle()
        setupMarker()
    }
    
    //MARK:- Custom Functions
    
    private func setupMap(){
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude), zoom: 16.0)
        mapView.camera = camera
        
    }
    
    private func setupMarker(){
        let marker  = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
        marker.map = mapView
    }
    
    private func setupCircle(){
        let circleCenter = CLLocationCoordinate2DMake(CLLocationDegrees(latitude), CLLocationDegrees(longitude))
        circle.position = circleCenter
        circle.fillColor = UIColor(red: 0.35, green: 0, blue: 0, alpha:  0.05)
        circle.strokeColor = UIColor.red
        circle.strokeWidth = 1
        circle.map = mapView
        
        circle.radius = 200
    }
    
    private func updateCircle(value: Int){
        DispatchQueue.main.async {
            self.circle.radius = CLLocationDistance(value)
            let update = GMSCameraUpdate.fit(self.circle.bounds())
            self.mapView.animate(with: update)
        }
    }
    
    //MARK:- IBActions

    @IBAction func sliderValueChanged(_ slider: UISlider) {
        let currentValue = Int(slider.value)
        updateCircle(value: currentValue)
    }
    
}

// MARK:- Extensions
extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let location: CLLocation = CLLocation(latitude: position.target.latitude, longitude: position.target.longitude)
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        
    }
}

