//
//  WeatherHeaderView.swift
//  WeatherApp2
//
//  Created by Decagon on 3.5.21.
//

import UIKit

final class WeatherHeaderView: UIView {
    
    
    public func configure(with maxTemp: String, minTemp: String, currentTemp: String, currentTemperature: String){
        maxTempLabel.text = maxTemp
        minTempLabel.text = minTemp
        currentTempLabel.text = currentTemp
        currentTemperatureLabel.text = currentTemperature
    }
    @IBOutlet var contentView: UIView!
    @IBOutlet var minTempLabel: UILabel!
    @IBOutlet var maxTempLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var currentTemperatureLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required init?  (coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        loadFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func loadFromNib(){
        Bundle.main.loadNibNamed("WeatherHeaderView", owner: self, options: nil)
        addSubview(contentView)
    }
}
