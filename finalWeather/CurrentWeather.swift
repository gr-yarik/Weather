//
//  CurrentWeather.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import Foundation

struct CurrentWeather {
    
    let temp: Double
    var tempString: String {
        return "\(Int(temp.rounded()))"
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return "\(Int(feelsLikeTemp.rounded()))"
    }
    
    let cityName: String
    let id: Int
    
    
    var icon: String {
        switch id {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.heavyrain.fill"
        case 600...622: return "cloud.snow.fill"
        case 700...781: return "cloud.fog.fill"
        case 800: return "sun.max.fill"
        case 801...802: return "cloud.sun.fill"
        case 803...804: return "cloud.fill"
        default: return "circle.dashed"
        }
    }
    
    init(currentWeatherData: CurrentWeatherData){
        temp = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feelsLike
        cityName = currentWeatherData.name
        id = currentWeatherData.weather[0].id
    }
    
}
