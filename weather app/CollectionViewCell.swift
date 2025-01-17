//
//  CollectionViewCell.swift
//  weather app
//
//  Created by pedro santilli on 16/01/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let indentiifier: String = "CollectionViewCell"
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [hourlabel,iconimageview, temeperaturelabel])
        stackview.axis = .vertical
        stackview.spacing = 4
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.layer.borderWidth = 1
        stackview.layer.borderColor = UIColor.contrastColor?.cgColor
        stackview.layer.cornerRadius = 20
        return stackview
    }()
    
    private lazy var hourlabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:00"
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temeperaturelabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°C"
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconimageview: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "weatherIcon")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        sethierarchy()
        setconstraints()
    }
    private func sethierarchy(){
        contentView.addSubview(stackview)
    }
    private func setconstraints (){
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconimageview.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
