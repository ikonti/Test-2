//
//  CustomTableViewCell.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/13/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import DLRadioButton

protocol TableViewCellDelegate {
    func getCity(_ city: String?)
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var citiesButton: DLRadioButton!
    
    var currentCity: CitiesTableViewController!
    
    var tableViewCellDelegate: TableViewCellDelegate?
    
    func configureCitiesCell(city: CityModel) {
        
        citiesButton.setTitle(city.name, for: .normal)
        
    }
}
