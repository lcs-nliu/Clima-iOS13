//
//  WeatherModel.swift
//  Clima
//
//  Created by Liu, Bojun on 2020-05-31.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String (format: "%.1f", temperature)
    }
    

    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
            
        case 500...531:
            return "cloud.rain"
            
        case 600...622:
            return "cloud.snow"
            
        case 600...622:
            return "cloud.snow"
            
        case 701:
            return "wind"
            
        case 711:
            return "smoke"
            
        case 721:
            return "sun.haze"
            
        case 731:
            return "wind"
            
        case 741:
            return "cloud.fog"
            
        case 751:
            return "sun.dust"
            
        case 761:
            return "sun.dust"
            
        case 762:
            return "sun.dust"
            
        case 771:
            return "wind.snow"
            
        case 781:
            return "tornado"
            
        case 800:
            return "sun.max"
            
        case 801...804:
            return "cloud"
            
        default:
            return "sun.min"
        }
    }
    
    
}
