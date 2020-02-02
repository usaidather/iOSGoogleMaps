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
    // Lati longi for karachi pakistan
    let latitude:Float = 24.8607
    let longitude:Float = 67.0011
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleGoogleMaps()
        setupMap()
        // Do any additional setup after loading the view.
    }
    
    private func styleGoogleMaps(){
        do{
            if let styleUrl = Bundle.main.url(forResource: "style", withExtension: "json"){
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleUrl)
            }
            else{
                NSLog("unable to find style file")
            }
        } catch {
            NSLog("failed to load")
        }
        
    }
    
    private func setupMap(){
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude), zoom: 16.0)
        mapView.camera = camera
    }


}

