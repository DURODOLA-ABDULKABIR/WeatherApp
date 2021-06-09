//
//  WeatherForecastStruct.swift
//  WeatherApp2
//
//  Created by Decagon on 3.5.21.
//

import Foundation


struct WeatherForecast:Codable {
    let list: [ForecastData]
}

struct ForecastData:Codable {
    let main: TemperatureForeCast
    let dt: Int
}

struct TemperatureForeCast:Codable {
    let temp: Double!
}
