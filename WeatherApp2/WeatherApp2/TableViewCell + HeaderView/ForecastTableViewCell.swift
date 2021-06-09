//
//  ForecastTableViewCell.swift
//  WeatherApp2
//
//  Created by Decagon on 3.5.21.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let identifier = "ForecastTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ForecastTableViewCell", bundle: nil)
    }
    
    public func configure(with day: String, imageName: String, temperature: String){
        weekdayLabel.text = day
        iconImage.image = UIImage(named: imageName)
        temperatureLabel.text = temperature
        self.iconImage.tintColor = .black
        self.iconImage.contentMode = .scaleAspectFit
    }
    
    @IBOutlet var weekdayLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var temperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
