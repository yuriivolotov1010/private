//
//  MapViewController.swift
//  TESTJOB
//
//  Created by Admin on 14/02/2017.
//  Copyright © 2017 Hans. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

  @IBOutlet weak var switchView: UISwitch!
  @IBOutlet weak var mapView: GMSMapView!
  var locationManager = CLLocationManager()
  
  let currentmarker = GMSMarker()
  var othermarker1 = GMSMarker()
  var othermarker2 = GMSMarker()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      self.mapView.isMyLocationEnabled = true
      self.mapView.isBuildingsEnabled = true
      self.mapView.delegate = self
      self.mapView.settings.compassButton = true
      
      //Location Manager code to fetch current location
//      locationManager.requestWhenInUseAuthorization()
      locationManager.delegate = self
      locationManager.startUpdatingLocation()
      locationManager.startUpdatingHeading()
      
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  //Location Manager delegates
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let location = locations.last
    let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom:12.0)
    self.mapView.animate(to: camera)
    //Finally stop updating location otherwise it will come again and again in this delegate
    self.locationManager.stopUpdatingLocation()
  
    currentmarker.position = camera.target
    currentmarker.snippet = "Current Location"
    currentmarker.appearAnimation = kGMSMarkerAnimationPop
    currentmarker.map = mapView
    
    
    let position1 = CLLocationCoordinate2D(latitude: location!.coordinate.latitude - 0.02 , longitude: location!.coordinate.longitude - 0.04)
    othermarker1 = GMSMarker(position: position1)
    othermarker1.snippet = "other user1"
    othermarker1.appearAnimation = kGMSMarkerAnimationPop
    othermarker1.icon = GMSMarker.markerImage(with: .blue)
    othermarker1.map = mapView
    
    let position2 = CLLocationCoordinate2D(latitude: location!.coordinate.latitude + 0.01 , longitude: location!.coordinate.longitude + 0.01)
    othermarker2 = GMSMarker(position: position2)
    othermarker2.snippet = "other user 2"
    othermarker2.appearAnimation = kGMSMarkerAnimationPop
    othermarker2.icon = GMSMarker.markerImage(with: .green)
    othermarker2.map = mapView
    
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    self.mapView.animate(toBearing: newHeading.trueHeading)
    self.mapView.settings.scrollGestures = true
    self.mapView.settings.zoomGestures = true
    self.mapView.settings.rotateGestures = true
  }

  // MARK: MAPVIEW DELEGATE METHOD
  
  func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
    self.locationManager.startUpdatingHeading()
  }
  
  func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
    self.locationManager.stopUpdatingHeading()
  }
  
  // Switch
  @IBAction func valueChanged(_ sender: Any) {
    if switchView.isOn {
      
      othermarker1.map = mapView
      othermarker2.map = mapView
    }else{
      mapView.clear()
      currentmarker.map = mapView
    }
  }
  
}
