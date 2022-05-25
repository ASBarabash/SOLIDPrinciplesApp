//
//  ViewController.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import UIKit


class ViewController: UIViewController {
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    
    let urlNewMusic = "https://rss.applemarketingtools.com/api/v2/ru/music/most-played/10/albums.json"
    
    // Внешние зависимости
//    var networkService = NetworkService()
    var nerworkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()
    
    
    // Элементы пользовательского интерфейса
    @IBOutlet var myTextField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nerworkDataFetcher.fetchNewMusic(urlString: urlNewMusic) { newMusic in
            print(newMusic?.feed.results.first?.name)
        }
        
        nerworkDataFetcher.fetchFreeGames(urlString: urlFreeGames) { freeGames in
            print(freeGames?.feed.results.first?.name)
        }
        
        nerworkDataFetcher.fetchCountry(urlString: urlString) { countries in
            print(countries?.first?.Name)
        }
    }
    
    override func viewDidLayoutSubviews() {
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
    }
    // MARK: - Business logic
    
    // Обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        
        dataStore.savenameInCache(name: name)
    }
    
    //MARK: - User interface
    
    // Отображение интерфейса
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okey", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // по которому и происходит вся работа
    // Взаимодействие пользователя с интерфейсом
    @IBAction func changeLabel() {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped() {
    }
}

