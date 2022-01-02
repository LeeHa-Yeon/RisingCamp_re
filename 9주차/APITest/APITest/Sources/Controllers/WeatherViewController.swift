//
//  WeatherViewController.swift
//  APITest
//
//  Created by 이하연 on 2022/01/02.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    var weather: Weather?
    var main: Main?
    var name: String?
    
    let lng: String
    let lat: String
    
    init?(coder: NSCoder, lng: String, lat: String){
        self.lng = lng
        self.lat = lat
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("힝 \(lng), \(lat)")
        // data fetch
        WeatherService().getWeather(longitude: lng, latitude: lat){ result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.setWeatherUI()
                    self.titleLabel.text = "\(weatherResponse.name)'s weather?"
                    self.weatherLabel.text = weatherResponse.weather[0].description
                    self.humidityLabel.text =  "\(weatherResponse.main.humidity)%"
                    self.tempLabel.text = "\(weatherResponse.main.temp)º"
                    self.tempMaxLabel.text = "\(weatherResponse.main.temp_max)º"
                    self.tempMinLabel.text = "\(weatherResponse.main.temp_min)º"
                    print("결과\(weatherResponse.weather[0].description)")
                }
            case .failure(_ ):
                print("error22")
            }
        }
    }
    
    //MARK: - 원래 날씨 아이콘을 받아오는 방식 ( 아이콘이 맘에 안들어서 난 다시 만듬 )
    private func setWeatherUI() {
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            weatherImg.image = UIImage(data: data)
            
        }
        
    }
}
