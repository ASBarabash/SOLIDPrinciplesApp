//
//  ViewController.swift
//  SOLIDPrinciplesApp
//
//  Created by Alexandr Barabash on 25.05.2022.
//

import UIKit

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}

class ViewController: UIViewController {
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    // Внешние зависимости
    var networkService = NetworkService()
    let dataStore = DataStore()
    
    
    // Элементы пользовательского интерфейса
    @IBOutlet var myTextField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var saveButton: UIButton!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2

        networkService.dataFetcher(urlString: urlString)
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

