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
        performRequest(urlString: urlString)
    }
    func performRequest (urlString: String){
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2. Create a URL session
            
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
           let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // 4. Start the task
            
            task.resume()
    
            
        }
    }
    
    func handle (data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
