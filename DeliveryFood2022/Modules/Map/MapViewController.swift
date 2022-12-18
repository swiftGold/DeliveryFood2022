//
//  MapViewController.swift
//  DeliveryFood2022
//
//  Created by Сергей Золотухин on 15.12.2022.
//

import UIKit
import GoogleMaps
import MapKit

protocol MapViewControllerProtocol: AnyObject {
    var presenter: MapPresenterProtocol? { get set }
}

final class MapViewController: UIViewController {

    private var mapView: GMSMapView = {
        let mapView = GMSMapView()
        return mapView
    }()

    var presenter: MapPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        setupMapView()

        // Do any additional setup after loading the view.
               // Create a GMSCameraPosition that tells the map to display the
               // coordinate -33.86,151.20 at zoom level 6.
               let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
               let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
               self.view.addSubview(mapView)

               // Creates a marker in the center of the map.
               let marker = GMSMarker()
               marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
               marker.title = "Sydney"
               marker.snippet = "Australia"
               marker.map = mapView
    }

    func setupMapView() {
        view.addSubview(mapView)
        mapView.frame = view.bounds
    }
}

extension MapViewController: MapViewControllerProtocol {

}

//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last?.coordinate {
//            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
//            mapView.setRegion(region, animated: true)
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkAuthorization()
//    }
//}
//
//private extension MapViewController {
//    func setupMapView() {
//        view.addSubview(mapView)
//        mapView.frame = view.bounds
//    }
//
//    func checkLocationEnable() {
//        DispatchQueue.global().async { [weak self] in
//            if CLLocationManager.locationServicesEnabled() {
//                self?.setupLocationManager()
//                self?.checkAuthorization()
//            } else {
//                self?.showAlertLocation(title: "У вас отключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
//            }
//        }
//    }
//
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func checkAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            break
//        case .denied:
//            showAlertLocation(title: "Вы запретили определение местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
//        case .authorizedAlways:
//            break
//        case .authorizedWhenInUse:
//            mapView.showsUserLocation = true
//            locationManager.startUpdatingLocation()
//            break
//        @unknown default:
//            print("не выбран ни один из вариантов")
//        }
//    }
//
//    func showAlertLocation(title: String, message: String?, url: URL?) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
//            if let url = url {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        alert.addAction(settingsAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
//    }
//}



//protocol MapViewControllerProtocol: AnyObject {
//    var presenter: MapPresenterProtocol? { get set }
//}
//
//final class MapViewController: UIViewController {
//
//    private var mapView: MKMapView = {
//        let mapView = MKMapView()
//        return mapView
//    }()
//
//    private let locationManager = CLLocationManager()
//
//    var presenter: MapPresenterProtocol?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .red
//
//        setupMapView()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        checkLocationEnable()
//    }
//}
//
//extension MapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last?.coordinate {
//            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
//            mapView.setRegion(region, animated: true)
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkAuthorization()
//    }
//}
//
//extension MapViewController: MapViewControllerProtocol {
//
//}
//
//private extension MapViewController {
//    func setupMapView() {
//        view.addSubview(mapView)
//        mapView.frame = view.bounds
//    }
//
//    func checkLocationEnable() {
//        DispatchQueue.global().async { [weak self] in
//            if CLLocationManager.locationServicesEnabled() {
//                self?.setupLocationManager()
//                self?.checkAuthorization()
//            } else {
//                self?.showAlertLocation(title: "У вас отключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
//            }
//        }
//    }
//
//    func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    }
//
//    func checkAuthorization() {
//        switch CLLocationManager.authorizationStatus() {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            break
//        case .denied:
//            showAlertLocation(title: "Вы запретили определение местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
//        case .authorizedAlways:
//            break
//        case .authorizedWhenInUse:
//            mapView.showsUserLocation = true
//            locationManager.startUpdatingLocation()
//            break
//        @unknown default:
//            print("не выбран ни один из вариантов")
//        }
//    }
//
//    func showAlertLocation(title: String, message: String?, url: URL?) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
//            if let url = url {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        alert.addAction(settingsAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
//    }
//}






