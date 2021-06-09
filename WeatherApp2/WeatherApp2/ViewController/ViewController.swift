//
//  ViewController.swift
//  WeatherApp2
//
//  Created by Decagon on 2.5.21.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    @IBOutlet var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        viewModel.setUpRequest()
        viewModel.requestCompletion = {
            [weak self] in
            self?.weatherTableView.reloadData()
        }
    }
    
    fileprivate func setUpTableView(){
        weatherTableView.register(ForecastTableViewCell.nib(), forCellReuseIdentifier: ForecastTableViewCell.identifier)
        weatherTableView.tableFooterView = UIView()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
}



//MARK:- UITableViewDataSource methods
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastTemps.count/8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as! ForecastTableViewCell
        
        cell.configure(with: viewModel.dates[indexPath.row], imageName: "rain", temperature: "\(viewModel.self.forecastTemps[(indexPath.row * 8)])º")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}



//MARK:- UITableViewDelegate methods
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if !viewModel.headerTemp.isEmpty{
            let headerView = WeatherHeaderView()
            headerView.configure(with: "\(viewModel.self.headerTemp[2])º", minTemp: "\(viewModel.self.headerTemp[1])º", currentTemp: "\(viewModel.self.headerTemp[0])º", currentTemperature: "\(viewModel.self.headerTemp[0])º")
            return headerView
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 431
    }
    
}




