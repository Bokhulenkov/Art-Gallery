//
//  ArtistsView.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 29.01.2025.
//

import UIKit

class ArtistsView: UIView {
    
    // MARK: - Private Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black //333647
        label.text = "Artists"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = .black //333647
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.searchBarStyle = .prominent
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
     let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.estimatedRowHeight = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
        setConstraints()
        tableView.register(ArtistCell.self, forCellReuseIdentifier: ArtistCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Methods
    func setDelegate(_ vc: ViewController) {
        tableView.delegate = vc
        tableView.dataSource = vc
    }
      
//    MARK: - Private Methods
    private func setUI() {
        self.addSubview(hStack)
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(addButton)
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
}

//  MARK: - Extensions Constraints
extension ArtistsView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            hStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            searchBar.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
