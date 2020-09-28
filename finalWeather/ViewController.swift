//
//  ViewController.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var networkWeatherManager = NetworkWeatherManager()
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        return lm
    }()
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    @IBOutlet weak var weatherFeelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        showSearchAlertController()
    }
    
    func updateUI(with weather: CurrentWeather){
        DispatchQueue.main.async {
            self.weatherImageView.image = UIImage(systemName: weather.icon)
            self.weatherTemperatureLabel.text = weather.tempString
            self.weatherFeelsLikeTemperatureLabel.text = weather.feelsLikeTempString
            self.cityLabel.text = weather.cityName
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.delegate = self
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
        
        // Do any additional setup after loading the view.
    }


}


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let longtitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        networkWeatherManager.getWeather(by: .coordinates(longtitude: longtitude, latitude: latitude))
    }
 
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
