//
//  ViewController.swift
//  weather app
//
//  Created by pedro santilli on 14/01/25.
//

import UIKit

class ViewController: UIViewController {
    private lazy var backgroundView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var headerView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "contrastColor")
        view.layer.cornerRadius = 20
        return view
    }()
    private lazy var  citylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Marilia"
        label.textAlignment = .center
        label.textColor = UIColor(named: "primaryColor")
        return label
    }()
    private lazy var  temperaturelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight:.bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor(named: "primaryColor")
        return label
    }()
    private lazy var weatherIcon: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "weatherIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var humidityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.text = "Umidade"
        label.textAlignment = .center
        label.textColor = UIColor(named: "contrastColor")
        return label
    }()
    private lazy var humidityvalueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.text = "80%"
        label.textAlignment = .center
        label.textColor = UIColor(named: "contrastColor")
        return label
    }()
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel,humidityvalueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var windLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.text = "Vento"
        label.textAlignment = .center
        label.textColor = UIColor(named: "contrastColor")
        return label
    }()
    private lazy var windvalueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        label.text = "10km/hr"
        label.textAlignment = .center
        label.textColor = UIColor(named: "contrastColor")
        return label
    }()
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel,windvalueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView,windStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: "statstackColor")
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    private func setupViews() {
        view.backgroundColor = UIColor.red
        setHierarchy()
        setConstraints()
    }
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        headerView.addSubview(citylabel)
        headerView.addSubview(temperaturelabel)
        headerView.addSubview(weatherIcon)
        
    }
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        NSLayoutConstraint.activate([
            citylabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            citylabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15 ),
            citylabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15 ),
            citylabel.heightAnchor.constraint(equalToConstant: 20),     temperaturelabel.topAnchor.constraint(equalTo: citylabel.bottomAnchor, constant: 21),
            temperaturelabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperaturelabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperaturelabel.trailingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),            humidityStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor )
        ])
    }
}

