//
//  WeatherManager.swift
//  Clima
//
//  Created by Liu, Bojun on 2020-05-26.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=62d67335b71f0077852794fb1ad2224a&units=metric"
    
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
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON (weatherData: Data) {
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))
        } catch {
            print (error)
        }
        
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
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

