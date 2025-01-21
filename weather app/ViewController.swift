//
//  ViewController.swift
//  weather app
//
//  Created by pedro santilli on 14/01/25.
//

import UIKit

class ViewController: UIViewController{
    
    
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
        view.backgroundColor = UIColor.contrastColor
        view.layer.cornerRadius = 20
        return view
    }()
    private lazy var  citylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Marilia"
        label.textAlignment = .center
        label.textColor = UIColor.primaryColor
        return label
    }()
    private lazy var  temperaturelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight:.bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor.primaryColor
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
        label.font = UIFont.systemFont(ofSize: 15,weight: .semibold)
        label.text = "Umidade"
        label.textAlignment = .left
        label.textColor = UIColor.contrastColor
        return label
    }()
    private lazy var humidityvalueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15,weight: .semibold)
        label.text = "80%"
        label.textAlignment = .right
        label.textColor = UIColor.contrastColor
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
        label.font = UIFont.systemFont(ofSize: 15,weight: .semibold)
        label.text = "Vento"
        label.textAlignment = .left
        label.textColor = UIColor.contrastColor
        return label
    }()
    private lazy var windvalueLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15,weight: .semibold)
        label.text = "10km/hr"
        label.textAlignment = .right
        label.textColor = UIColor.contrastColor
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
        stackView.backgroundColor = UIColor.softgrayColor
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()
    private lazy var previsionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        label.text = "Previsão por Hora"
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        return label
    }()
    private lazy var previsionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.indentiifier)
        return collectionView
    }()
    private lazy var dailyLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16,weight: .semibold)
        label.text = "PROXIMOS DIAS"
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        return label
    }()
    private lazy var dailytableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(dailyTableViewCell.self, forCellReuseIdentifier: dailyTableViewCell.indentiifier)
        tableView.separatorColor = UIColor.contrastColor
        return tableView
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
        view.addSubview(previsionLabel)
        view.addSubview(previsionCollectionView)
        view.addSubview(dailyLabel)
        view.addSubview(dailytableView)
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
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
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
        NSLayoutConstraint.activate([
            previsionLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            previsionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            previsionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            previsionCollectionView.topAnchor.constraint(equalTo: previsionLabel.bottomAnchor, constant: 22),
            previsionCollectionView.heightAnchor.constraint(equalToConstant: 84),
            previsionCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previsionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            dailyLabel.topAnchor.constraint(equalTo: previsionCollectionView.bottomAnchor, constant: 29),
            dailyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            dailyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            dailytableView.topAnchor.constraint(equalTo: dailyLabel.bottomAnchor, constant: 30),
            dailytableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dailytableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dailytableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.indentiifier, for: indexPath)
        return cell
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dailyTableViewCell.indentiifier, for: indexPath)
        return cell
    }
}
