//
//  View.swift
//  Sunny (API)
//
//  Created by Oleg Kanatov on 28.09.21.
//

import UIKit


class View: UIView {
    
    private var backgroundImageView = UIImageView()
    private var weatherStack = UIStackView()
    var weatherIconImageView = UIImageView()
    var temperatureLabel = UILabel()
    private var feelsLikeStack = UIStackView()
    private var feelsLikeLabel = UILabel()
    var feelsLikeTemperatureLabel = UILabel()
    var cityStack = UIStackView()
    var cityLabel = UILabel()
    var cityButton = UIButton()
    
    //-------------------------------------------------
    // MARK: - Init/deinit
    //-------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
    
    //-------------------------------------------------
    // MARK: - Methods
    //-------------------------------------------------
    
    private func viewSetup() {
        backgroundImageViewSetup()
        weatherStackSetup()
        weatherIconImageViewSetup()
        temperatureLabelSetup()
        feelsLikeStackSetup()
        feelsLikeLabelSetup()
        feelsLikeTemperatureLabelSetup()
        cityStackSetup()
        cityLabelSetup()
        cityButtonSetup()
    }
    
    private func backgroundImageViewSetup() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func weatherStackSetup() {
        weatherStack.axis = .vertical
        weatherStack.spacing = 20
        weatherStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weatherStack)
        weatherStack.addArrangedSubview(weatherIconImageView)
        weatherStack.addArrangedSubview(temperatureLabel)
        NSLayoutConstraint.activate([
            weatherStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            weatherStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func weatherIconImageViewSetup() {
        weatherIconImageView.contentMode = .scaleAspectFit
        weatherIconImageView.tintColor = UIColor(named: "infoColor")
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIconImageView.topAnchor.constraint(equalTo: weatherStack.topAnchor),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 170),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    private func temperatureLabelSetup() {
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = UIColor(named: "infoColor")
        temperatureLabel.font = UIFont(name: "Helvetica", size: 70)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: weatherStack.centerXAnchor),
        ])
    }
    
    private func feelsLikeStackSetup() {
        feelsLikeStack.axis = .horizontal
        feelsLikeStack.spacing = 10
        feelsLikeStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(feelsLikeStack)
        feelsLikeStack.addArrangedSubview(feelsLikeLabel)
        feelsLikeStack.addArrangedSubview(feelsLikeTemperatureLabel)
        NSLayoutConstraint.activate([
            feelsLikeStack.topAnchor.constraint(equalTo: weatherStack.bottomAnchor),
            feelsLikeStack.centerXAnchor.constraint(equalTo: weatherStack.centerXAnchor),
        ])
    }
    
    private func feelsLikeLabelSetup() {
        feelsLikeLabel.text = "Feels like"
        feelsLikeLabel.textColor = UIColor(named: "infoColor")
        feelsLikeLabel.font = UIFont(name: "Helvetica", size: 16)
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func feelsLikeTemperatureLabelSetup() {
        feelsLikeTemperatureLabel.textColor = UIColor(named: "infoColor")
        feelsLikeTemperatureLabel.font = UIFont(name: "Helvetica", size: 16)
        feelsLikeTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func cityStackSetup() {
        cityStack.axis = .horizontal
        cityStack.spacing = 8
        cityStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cityStack)
        cityStack.addArrangedSubview(cityLabel)
        cityStack.addArrangedSubview(cityButton)
        NSLayoutConstraint.activate([
            cityStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            cityStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func cityLabelSetup() {
        cityLabel.textColor = UIColor(named: "infoColor")
        cityLabel.font = UIFont(name: "Helvetica", size: 28)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func cityButtonSetup() {
        let image = UIImage(systemName: "magnifyingglass.circle.fill")
        cityButton.setBackgroundImage(image, for: .normal)
        cityButton.tintColor = UIColor(named: "infoColor")
        cityButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityButton.heightAnchor.constraint(equalToConstant: 30),
            cityButton.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
}


