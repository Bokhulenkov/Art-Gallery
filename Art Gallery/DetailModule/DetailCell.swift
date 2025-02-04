//
//  DetailCell.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 04.02.2025.
//

import UIKit

final class DetailCell: UITableViewCell {
    //    MARK: - Properties
    static let identifier = DetailCell.description()
    
    //    MARK: - Private Properties
    private let titleLabel = LabelFactory.makeTitleLabel(text: "Works")
    
    private let imageWork: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleImageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Methods
    public func configure(with artist: Artist) {
        titleLabel.text = "Works"
        imageWork.image = UIImage(named: "Picasso3")
        titleImageLabel.text = "L'Homme aux cartes (Card Player)"
        print("значение артист есть \(artist)")
    }
    
    private func setUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageWork)
        contentView.addSubview(titleImageLabel)
    }
}

// MARK: - Extensions Constraints
extension DetailCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageWork.widthAnchor.constraint(equalToConstant: 336),
            imageWork.heightAnchor.constraint(equalToConstant: 150),
            imageWork.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageWork.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageWork.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            titleImageLabel.topAnchor.constraint(equalTo: imageWork.bottomAnchor, constant: 10),
            titleImageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleImageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
