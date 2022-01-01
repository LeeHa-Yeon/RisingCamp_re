//
//  MapViewController.swift
//  APITest
//
//  Created by 이하연 on 2022/01/01.
//

import UIKit
import NMapsMap
import Then
import PanModal

class MapViewController: UIViewController {
    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    var mapView: NMFMapView {
        return naverMapView.mapView
    }
    var defaultLat = String()
    var defaultLng = String()
    var markInfo : [CategoryDocument] = []
    let infoWindow = NMFInfoWindow()
    let dataSource = NMFInfoWindowDefaultTextSource.data()
    
    @IBOutlet weak var bottomContainerMargin: NSLayoutConstraint!
    private var originalBottomMargin: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(naverMapView)
        originalBottomMargin = self.bottomContainerMargin.constant
        mapView.moveCamera(NMFCameraUpdate(position: mapPosition(lat: defaultLat, lng: defaultLng)))
        for i in 0..<markInfo.count {
            markerOnMap(lat: markInfo[i].y, lng: markInfo[i].x, name: markInfo[i].place_name, phone: markInfo[i].phone , address: markInfo[i].address_name, url: markInfo[i].place_url)
        }
    }
    
    func mapPosition(lat: String, lng: String) -> NMFCameraPosition{
        let latDouble: Double = Double(lat) ?? 37.5666102
        let lngDouble: Double = Double(lng) ?? 126.9783881
        let DEFAULT_CAMERA_POSITION = NMFCameraPosition(NMGLatLng(lat: latDouble, lng: lngDouble), zoom: 14, tilt: 0, heading: 0)
        
        return DEFAULT_CAMERA_POSITION
    }
    
    func markerOnMap(lat:String,lng:String,name: String, phone: String, address: String, url: String){
        let latDouble: Double = Double(lat) ?? 37.5666102
        let lngDouble: Double = Double(lng) ?? 126.9783881
        let marker = NMFMarker()
        infoWindow.dataSource = dataSource
        let handler = { [weak self] (overlay: NMFOverlay) -> Bool in
            if let marker = overlay as? NMFMarker {
                if marker.infoWindow == nil {
                    // 현재 마커에 정보 창이 열려있지 않을 경우 엶
                    self?.mapView.moveCamera(NMFCameraUpdate(position: (self?.mapPosition(lat: lat, lng: lng))!))
                    self?.dataSource.title = marker.userInfo["tag"] as! String
                    self?.infoWindow.open(with: marker)
//                    self?.bottomContainerMargin.constant = 300
                    self?.upModal(place: name, placeNumber: phone, placeAddress: address)
                } else {
                    // 이미 현재 마커에 정보 창이 열려있을 경우 닫음
//                    self?.bottomContainerMargin.constant = self!.originalBottomMargin
                    self?.infoWindow.close()
                }
            }
            return true
        };
        marker.position = NMGLatLng(lat: latDouble, lng: lngDouble)
        marker.mapView = mapView
        marker.userInfo = ["tag":"\(name)"]
        marker.touchHandler = handler
    }
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        print("잇닝?")
    }
    
    func upModal(place: String, placeNumber: String, placeAddress: String ){
        let storyboard = UIStoryboard(name: "MeetPlaceSearch", bundle: nil)
        let ModalVC = storyboard.instantiateViewController(withIdentifier: "ModalSB") as! ModalViewController
        ModalVC.nameValue = place
        ModalVC.phoneValue = placeNumber
        ModalVC.addressValue = placeAddress
        self.presentPanModal(ModalVC)
    }
}
