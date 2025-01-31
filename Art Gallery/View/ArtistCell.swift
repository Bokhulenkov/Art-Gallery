//
//  ArtistCell.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 29.01.2025.
//

import UIKit

class ArtistCell: UITableViewCell {
    //    MARK: - Properties
    static let identifier = ArtistCell.description()
    
    //    MARK: - Private Properties
    private let networkService = NetworkService()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let imageArtist: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func configure(with artist: Artist) {
        titleLabel.text = artist.name
        bioLabel.text = artist.bio
        imageArtist.image = UIImage(named: artist.image)
    }
    
    //    MARK: - Private Methods
    private func setUI() {
        contentView.addSubview(imageArtist)
        contentView.addSubview(vStack)
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(bioLabel)
    }
}

// MARK: - Extensions Constraints
extension ArtistCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageArtist.heightAnchor.constraint(equalToConstant: 96),
            imageArtist.widthAnchor.constraint(equalToConstant: 96),
            imageArtist.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageArtist.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            imageArtist.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            vStack.leadingAnchor.constraint(equalTo: imageArtist.trailingAnchor, constant: 5),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}
