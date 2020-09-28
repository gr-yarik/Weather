//
//  CurrentWeatherData.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import Foundation


struct CurrentWeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}


// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}



// MARK: - Weather
struct Weather: Codable {
    let id: Int
}
