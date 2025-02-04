//
//  DetailViewController.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 04.02.2025.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailArtistView()
    private let artists: [Artist] = []
    
//    MARK: - LifeCycle
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        detailView.setDelegate(vc: self)
    }
    
//    MARK: - Methods
    private func setUI() {
        view.addSubview(detailView)
    }
    
}

// MARK: - Extensions UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
    
}

// MARK: - Extensions UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else {
            print("ошибка получения ячейки")
            return UITableViewCell()
        }
        cell.configure(with: artists[indexPath.row])
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 20
        cell.layer.borderColor = UIColor.red.cgColor
        
        return UITableViewCell()
    }
    
    
}
