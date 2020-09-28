//
//  ViewController+NetworkWeatherManagerDelegate.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import Foundation

extension ViewController: NetworkWeatherManagerProtocol{
    
    func presentWeather(_: NetworkWeatherManager, with weather: CurrentWeather) {
        updateUI(with: weather)
    }

    
}
