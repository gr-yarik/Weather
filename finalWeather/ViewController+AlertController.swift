//
//  ViewController+AlertController.swift
//  finalWeather
//
//  Created by Yaroslav Hrytsun on 27.09.2020.
//

import Foundation
import UIKit

extension ViewController {
    
    func showSearchAlertController(){
        
        let alertController = UIAlertController(title: "Enter city name", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            guard let cityName = text?.split(separator: " ").joined(separator: "%20") else { return }
            self.networkWeatherManager.getWeather(by: .city(cityName: cityName))
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
}
