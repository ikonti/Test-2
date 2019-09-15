//
//  CitiesTableViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/13/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import DLRadioButton

class CitiesTableViewController: UITableViewController {
    
    
    var modelCity: [CityModel]!
    
    var tableViewCellDelegate: TableViewCellDelegate?
    
    var cityText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Получение с базы
        modelCity = City.getCity()
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelCity.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let city = modelCity[indexPath.row]
        cell.configureCitiesCell(city: city)
        
        return cell
    }
    
    // Передача текста 
    @IBAction func cityButtonPressed(_ sender: DLRadioButton) {
        var text = ""
        text = sender.currentTitle!
        tableViewCellDelegate?.getCity(text)
    }
}
