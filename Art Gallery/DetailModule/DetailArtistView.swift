//
//  DetailArtistView.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 04.02.2025.
//

import UIKit

final class DetailArtistView: UIView {
    
    // MARK: - Private Properties
    private lazy var imageArtist: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.opacity = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var careerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.opacity = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var bioLabel = LabelFactory.makeTitleLabel(text: "Biography")
    
    private lazy var workInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
#warning("header будет label или в таблицу добавить?")
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.estimatedRowHeight = 150
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
//    MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Methods
    public func setDelegate(vc: DetailViewController) {
        tableView.delegate = vc
        tableView.dataSource = vc
    }
    
    private func setUI() {
        addSubview(imageArtist)
        imageArtist.addSubview(titleLabel)
        imageArtist.addSubview(careerLabel)
        addSubview(vStack)
        vStack.addArrangedSubview(bioLabel)
        vStack.addArrangedSubview(workInfoLabel)
        addSubview(tableView)
    }
}

// MARK: - Extensions Constraints
extension DetailArtistView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageArtist.topAnchor.constraint(equalTo: topAnchor),
            imageArtist.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageArtist.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageArtist.heightAnchor.constraint(equalToConstant: 370),
            
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: imageArtist.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: imageArtist.leadingAnchor, constant: 20),
            
            careerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            careerLabel.leadingAnchor.constraint(equalTo: imageArtist.leadingAnchor, constant: 20),
            
            vStack.topAnchor.constraint(equalTo: imageArtist.bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: vStack.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
