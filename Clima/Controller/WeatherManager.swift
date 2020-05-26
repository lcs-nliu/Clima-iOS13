//
//  WeatherManager.swift
//  Clima
//
//  Created by Liu, Bojun on 2020-05-26.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?units=metric&appid=62d67335b71f0077852794fb1ad2224a#"

func fetchWeather(cityName: String){
    let urlString = "\(weatherURL)&q=\(cityName)"
}
}
