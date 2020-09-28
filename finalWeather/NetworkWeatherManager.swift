//
//  NetworkWeatherManager.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import Foundation
import CoreLocation

protocol NetworkWeatherManagerProtocol {
    
    func presentWeather(_ : NetworkWeatherManager, with weather: CurrentWeather)
    
}

struct NetworkWeatherManager {
    
    var delegate: NetworkWeatherManagerProtocol?
    
    enum RequestType {
        case city (cityName: String)
        case coordinates (longtitude: CLLocationDegrees, latitude: CLLocationDegrees)
    }
    
    func getWeather(by requestType: RequestType){
//        print("im here")
        var urlString = ""
        switch requestType {
        case .city(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        case .coordinates(let longtitude, let latitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&lat=\(latitude)&lon=\(longtitude)&units=metric"
        }
        apiCall(urlString: urlString)
    }
    
    fileprivate func apiCall(urlString: String){
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let currentWeatherData = parseJSON(data: data) else { return }
            let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData)
            print(currentWeather.cityName)
            delegate?.presentWeather(self, with: currentWeather)
            
//            let weather = parseJSON(
        }
        task.resume()
        
    }
    
    fileprivate func parseJSON(data: Data) -> CurrentWeatherData? {
        
        
        let decoder = JSONDecoder()
        
        do {
            let weather = try decoder.decode(CurrentWeatherData.self, from: data)
            return weather
        } catch let error {
            print(error)
        }
        return nil
    
    }
    
    
    
}
