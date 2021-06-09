//
//  FetchWeatherData.swift
//  WeatherApp2
//
//  Created by Decagon on 3.5.21.
//

import Foundation
class ViewModel {
    
    var forecastTemps = [Double]()
    var headerTemp = [Double]()
    var dates = [String]()
    let apiKey = "6f53e0347f39f329c5c0524ef39e08c5"
    let city = "Ibadan"
    let unit = "metric"
    
    
    var requestCompletion: (() -> Void)?
    
    func setUpRequest(){
        func fetchTemperatureData<T: Decodable>(urlString: String, completionHandler: @escaping (T)  -> ()) {
            let url = URL(string: urlString)!
            let _: Void = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {return}
                
                do{
                    let weather = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(weather)
                }
                catch{
                    let error = error
                    print(error)
                }
            }.resume()
        }
        
        //Current weather
        fetchTemperatureData(urlString: "https://api.openweathermap.org/data/2.5/find?q=\(city)&units=\(unit)&appid=\(apiKey)") { (temperatures: WeatherData) in
            var currentTemperature = [Double]()
            for  temperature in temperatures.list{
                currentTemperature.append(temperature.main.temp)
                currentTemperature.append(temperature.main.temp_min)
                currentTemperature.append(temperature.main.temp_max)
            }
            self.headerTemp  = currentTemperature
        }
        
        //Forecast weather
        fetchTemperatureData(urlString: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=\(unit)&appid=\(apiKey)") { (forecastData: WeatherForecast ) in
            var temperatures = [Double]()
            var date = [Int]()
            for forecast in forecastData.list{
                temperatures.append(forecast.main.temp)
                date.append(forecast.dt)
            }
            self.forecastTemps = temperatures
            
            var j = 0
            for _ in 0..<5 where j <= 32{
                self.dates.append(self.getDayForDate(Date(timeIntervalSince1970:Double(date[j]))))
                j += 8
            }
            
            DispatchQueue.main.async{
                self.requestCompletion?()
            }
        }
        
    }
    
    //Formats the forecast date to the day of the week
    func getDayForDate(_ date:Date?)->String{
        guard let inputDate = date else{
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate )
    }
    
}

