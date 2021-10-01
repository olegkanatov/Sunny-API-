//
//  ViewController.swift
//  Sunny (API)
//
//  Created by Oleg Kanatov on 28.09.21.
//



import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var customView = View()
    var networkWeatherManager = NetworkWeatherManager()
    lazy var locationManager: CLLocationManager = {
       let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestAlwaysAuthorization()
        return lm
    }()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onComplition = { [weak self] currentWeather in     // Closure
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        customView.cityButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        
        //delegate        networkWeatherManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
    }
    
    @objc func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
            
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async { [self] in
            customView.cityLabel.text = weather.cityName
            customView.temperatureLabel.text = "\(weather.temperatureString)°C"
            customView.feelsLikeTemperatureLabel.text = "\(weather.feelsLikeTemperatureString)°C"
            customView.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}


//extension ViewController: NetworkWeatherManagerDelegate {
//    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {         DELEGATE
//        print(currentWeather.cityName)
//    }
//}


//-------------------------------------------------
// MARK: - CLLocationManagerDelegate
//-------------------------------------------------

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
