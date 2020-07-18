//
//  WeatherView.swift
//  SwiftWeatherTemplate
//
//  Created by Florian on 17.07.20.
//  Copyright © 2020 Florian. All rights reserved.
//

import UIKit
import SnapKit

final class WeatherView: UIView {
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let generalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.distribution = .fillEqually
        return stackView
    }()
    let cityLabel = UILabel()
    let dayLabel = UILabel()
    let degreeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 5.0
        stackView.distribution = .fillEqually
        return stackView
    }()
    let degreeLabel = UILabel()
    let degreeSwitch = UISwitch()
    let weatherInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 5.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    let temperatureLabel = UILabel()
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunny")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    convenience init() {
        self.init(frame: .zero)
        addSubview(backgroundImageView)
        addSubview(generalInfoStackView)
        generalInfoStackView.addArrangedSubview(cityLabel)
        generalInfoStackView.addArrangedSubview(dayLabel)
        generalInfoStackView.addArrangedSubview(degreeStackView)
        degreeStackView.addArrangedSubview(degreeLabel)
        degreeStackView.addArrangedSubview(degreeSwitch)
        addSubview(weatherInfoStackView)
        weatherInfoStackView.addArrangedSubview(temperatureLabel)
        weatherInfoStackView.addArrangedSubview(weatherImageView)

        degreeLabel.text = "C0"
        cityLabel.text = "MOSOCW"
        dayLabel.text = "TODAY"
        temperatureLabel.text = "34C"

        makeConstraints()
    }
}

extension WeatherView: ViewProtocol {
    func makeConstraints() {
        backgroundImageView.snp.makeConstraints { (maker) in
            maker.left.top.right.bottom.equalToSuperview()
        }
        generalInfoStackView.snp.makeConstraints { (maker) in
            maker.left.top.right.equalTo(layoutMarginsGuide).inset(5)
            maker.height.equalToSuperview().dividedBy(3.0)
        }
        weatherInfoStackView.snp.makeConstraints { (maker) in
            maker.top.equalTo(generalInfoStackView.snp.bottom)
            maker.left.right.bottom.equalTo(layoutMarginsGuide).inset(5)
        }
    }
}
