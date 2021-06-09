//
//  WeatherStruct.swift
//  WeatherApp2
//
//  Created by Decagon on 3.5.21.
//

import Foundation

struct WeatherData:Codable {
     let list: [WeatherDetail]
}

struct WeatherDetail:Codable {
     let main: Temperature
}

struct Temperature:Codable {
     let temp: Double!
     let temp_min: Double!
     let temp_max: Double!
}
