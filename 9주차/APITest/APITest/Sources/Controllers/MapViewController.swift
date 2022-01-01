//
//  MapViewController.swift
//  APITest
//
//  Created by 이하연 on 2022/01/01.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {

    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var defaultLat = String()
    var defaultLng = String()
    var markInfo : [CategoryDocument] = []
    var mapView: NMFMapView {
        return naverMapView.mapView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(naverMapView)
        mapView.moveCamera(NMFCameraUpdate(position: mapPosition(lat: defaultLat, lng: defaultLng)))
    }
    
    func mapPosition(lat: String, lng: String) -> NMFCameraPosition{
        let latDouble: Double = Double(lat) ?? 37.5666102
        let lngDouble: Double = Double(lng) ?? 126.9783881
        let DEFAULT_CAMERA_POSITION = NMFCameraPosition(NMGLatLng(lat: latDouble, lng: lngDouble), zoom: 14, tilt: 0, heading: 0)
        
        return DEFAULT_CAMERA_POSITION
    }
    
}


