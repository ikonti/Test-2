//
//  AdressViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/12/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import Foundation

class AdressViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField! // надо доработать выбор городов, чтобы входил список городов
    @IBOutlet weak var streetTextField: UITextField! // надо доработать
    
    var cityText = ""
    var streetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 8
        saveButton.layer.masksToBounds = true
       
        cityTextField.text = cityText
        streetTextField.text = streetText
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Seque city
        if let city = segue.destination as? CitiesTableViewController {
            city.tableViewCellDelegate = self
        }
        
        // Seque map
        guard let mapVC = segue.destination as? MapViewController else { return }
        mapVC.mapViewControllerDelegate = self
    }
    
    // cancel unwind seque
    @IBAction func saveCity(_ segue: UIStoryboardSegue) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// Получение адреса и города
extension AdressViewController: MapViewControllerDelegate {
    func getAddress(_ address: String?) {
        streetTextField.text = address
    }
}

extension AdressViewController: TableViewCellDelegate {
    func getCity(_ city: String?) {
        cityTextField.text = city
    }
}








