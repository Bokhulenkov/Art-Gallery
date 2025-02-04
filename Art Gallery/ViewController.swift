//
//  ViewController.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 29.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var artists: [Artist] = []
    
    private let artistsView = MainArtistsView()
    
    override func loadView() {
        view = artistsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        artistsView.setDelegate(self)
        fetchData()
    }
    
    private func fetchData() {
        let networkService = NetworkService()
        networkService.getArtists { [weak self] result in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    strongSelf.artists = data.artists
                    strongSelf.artistsView.tableView.reloadData()
                case .failure(let error):
                    print("We have error: \(error.localizedDescription)")
                }
            }
        }
    }
}

// MARK: - Extensions TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - Extensions TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistCell.identifier, for: indexPath) as? ArtistCell
        guard let cell = cell else {
            print("ошибка создания ячейки")
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.configure(with: artists[indexPath.row])
        return cell
    }
}



/*
 Главный экран:

 Отображение списка художников с краткой биографией (имя, портрет, короткий текст).
 При нажатии на карточку художника происходит переход на детальный экран.
 Реализовать поиск по художникам.
 Результаты отображаются списком, который позволяет перейти на соответствующий экран.

 Детальный экран художника:
 Отображения фото художника, имя, биография.
 Отображение всех картин данного художника в виде списка (картинка + название)
 Просмотр картины:
 Картина отображается во всю ширину экрана
 Под картиной отображается название и описание.
 В низу кнопка "Развернуть". После нажатия на кнопку картина разворачивается на весь экран, снизу кнопку (х) - закрыть.
 
 
 Продвинутое задание

 Добавление данных:

 Реализовать форму добавления новых художников и их картин.
 Форма должна содержать поля для имени художника, биографии, фотографии, а также полей для добавления картин (название, изображение, описание).
 Данные сохраняются локально.
 
 https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json
 */
