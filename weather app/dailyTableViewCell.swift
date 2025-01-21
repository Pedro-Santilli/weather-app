//
//  dailyTableViewCell.swift
//  weather app
//
//  Created by pedro santilli on 20/01/25.
//

import UIKit

class dailyTableViewCell: UITableViewCell {
    
    static let indentiifier: String = "dailyTableViewCell"
    
    private lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.text = "SEG"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    
    private lazy var mintemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.text = "min 25 C"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var maxtemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.contrastColor
        label.text = "max 25 C"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var iconimageview : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "cloudicon")
        return imageview
    }()
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [weekdayLabel,iconimageview,mintemperatureLabel,maxtemperatureLabel])
        stackview.axis = .horizontal
        stackview.spacing = 15
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.directionalLayoutMargins = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupviews()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupviews(){
        backgroundColor = .clear
        selectionStyle = .none
        sethierarchy()
        setconstraints()
    }
    private func sethierarchy(){
            contentView.addSubview(stackview)
    }
    private func setconstraints(){
        NSLayoutConstraint.activate([
            weekdayLabel.widthAnchor.constraint(equalToConstant: 50),
            stackview.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
