//
//  ViewController.swift
//  GoogleMapsTutorial
//
//  Created by Usaid Ather on 26/01/2020.
//  Copyright © 2020 Usaid Ather. All rights reserved.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils


class ViewController: UIViewController {
    private var heatmapLayer: GMUHeatmapTileLayer!
    
    @IBOutlet weak var mapView: GMSMapView!
    // Lati longi for karachi pakistan
    let latitude:Float = 24.8607
    let longitude:Float = 67.0011
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setUpHeatMap()
        // Do any additional setup after loading the view.
    }
    
    private func getDummyLocations() -> [Location] {
        let locationArray : [Location] = [
        Location(latitude:  24.86170245, longitude: 67.00310938),
        Location(latitude:  24.83170980, longitude: 67.00210948),
        Location(latitude:  24.83073537, longitude: 67.02129903),
        Location(latitude:  24.83073230, longitude: 67.10113298),
        Location(latitude:  24.83079990, longitude: 67.02939980),
        Location(latitude:  24.85072329, longitude: 67.02129803),
        Location(latitude:  24.84089002, longitude: 67.02122203),
        Location(latitude:  24.84064338, longitude: 67.03120900),
        Location(latitude:  24.84058890, longitude: 67.04114039),
        Location(latitude:  24.85059990, longitude: 67.04139399),
        Location(latitude:  24.85034563, longitude: 67.04111009),
        Location(latitude:  24.85022093, longitude: 67.04117889),
        ]
        
        return locationArray
    }
    
    private func addHeatMap(){
        var list = [GMUWeightedLatLng]()
        let locations = getDummyLocations()
        
        for location in locations {
            let lat = location.latitude
            let longi = location.longitude
            let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat, longi), intensity: 2.0)
            list.append(coords)
            print(list)
        }
        heatmapLayer.weightedData = list
    }
    
    private func setUpHeatMap(){
        heatmapLayer = GMUHeatmapTileLayer()
        addHeatMap()
        heatmapLayer.map = mapView
    }
    
    private func setupMap(){
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude), zoom: 3.0)
        mapView.camera = camera
    }


}

