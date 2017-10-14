//
//  MapViewController.swift
//  Lotyn
//
//  Created by Feiko Ritsema on 14/10/2017.
//  Copyright © 2017 JSF. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    struct Place {
        let id: Int
        let name: String
        let lat: CLLocationDegrees
        let lng: CLLocationDegrees
        let icon: String
    }
    
    @IBOutlet weak var mapView: GMSMapView!
    var markerDict: [Int: GMSMarker] = [:]
    
    var zoom: Float = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.1381168, longitude: -118.3555723, zoom: zoom)
        self.mapView.camera = camera
        
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        let places = [
            Place(id: 0, name: "MrMins", lat: 34.1331168, lng: -118.3550723, icon: "i01"),
            ]
        
        for place in places {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lng)
            marker.title = place.name
            marker.snippet = "Custom snipet message \(place.name)"
            //marker.appearAnimation = GMSMarkerAnimationPop
            //marker.icon = self.imageWithImage(image: UIImage(named: place.icon)!, scaledToSize: CGSize(width: 35.0, height: 35.0))
            marker.map = self.mapView
            
            markerDict[place.id] = marker
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnZoomIn(_ sender: Any) {
        zoom = zoom + 1
        self.mapView.animate(toZoom: zoom)
    }
    
    @IBAction func btnZoomOut(_ sender: Any) {
        zoom = zoom - 1
        self.mapView.animate(toZoom: zoom)
    }
    
    
}
