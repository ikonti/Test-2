//
//  TableViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/11/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import DLRadioButton // радио кнопка

class TableViewController: UITableViewController {

    // MARK: Outlets
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var communicationLabel: UILabel!
    @IBOutlet weak var theDetailsLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var deadlinesLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var detailsChangedLabel: UILabel!
    @IBOutlet weak var deadlinesChangedLabel: UILabel!
    @IBOutlet weak var deadlinesBackgroundLabel: UILabel!
    @IBOutlet weak var detailsBackgroundLabel: UILabel!
    @IBOutlet weak var adressBackgroundLabel: UILabel!
    @IBOutlet weak var adressChangedLabel: UILabel!
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet var photoLabel: [UILabel]!
    
    var cityText: String?
    var adressText: String?
    var budgetText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings(adressLabel)
        hide(adressBackgroundLabel, adressChangedLabel)
        
        settings(theDetailsLabel)
        hide(detailsBackgroundLabel, detailsChangedLabel)
        
        settings(deadlinesLabel)
        hide(deadlinesBackgroundLabel, deadlinesChangedLabel)
        
        publishButton.layer.cornerRadius = 8
        publishButton.layer.masksToBounds = true
        
        layerSettings(labelOne)
        layerSettings(adressBackgroundLabel)
        layerSettings(detailsBackgroundLabel)
        layerSettings(deadlinesBackgroundLabel)
        layerSettings(communicationLabel)
        layerSettings(budgetLabel)
        
        for photo in photoLabel {
            settings(photo)
        }
    }
    
    // MARK: private func
    // настройки label
    private func layerSettings(_ label: UILabel) {
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
    }
    
    private func settings(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
    }
    
    private func hide(_ label: UILabel, _ label2: UILabel) {
        label.isHidden = true
        label2.isHidden = true
    }
    
    private func open(_ label: UILabel, _ label2: UILabel) {
        label.isHidden = false
        label2.isHidden = false
    }
    
    private func deleteLayer(_ label: UILabel) {
        label.layer.borderColor = nil
        label.layer.borderWidth = 0
        label.textColor = .black
    }
    
    // MARK: Prepare seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "communication":
            title = ""
            let CMVC = segue.destination as! CommunicationMethodViewController
            guard communicationLabel.text != nil else { return }
            if communicationLabel.text == "Написать мне в чат naimi.kz" {
                CMVC.btn1IsSelected = true
            } else if communicationLabel.text == "Позвонить мне на телефон" {
                CMVC.btn2IsSelected = true
            }
        case "budget":
            title = ""
            let budget = segue.destination as! BudgetViewController
            if budgetLabel.text == "Договорная" {
                budget.btnIsSelected = true
            } else {
                budget.text = budgetText
            }
        case "details":
            title = ""
            let details = segue.destination as! DetailsViewController
            if theDetailsLabel.text != "Добавить" {
                details.text = theDetailsLabel.text
            }
        case "adress":
            title = ""
            let adress = segue.destination as! AdressViewController
            if adressLabel.text != "Добавить" {
                adress.cityText = cityText!
                adress.streetText = adressText!
            } else {
                adress.cityText = "Нур-Султан"
            }
        default: break
        }
    }
    
    // MARK: Unwind seque
    @IBAction func cancel(_ segue: UIStoryboardSegue) { }

    @IBAction func saveWriteMe(_ segue: UIStoryboardSegue) {
        guard let CMVC = segue.source as? CommunicationMethodViewController else { return }
        communicationLabel.text = CMVC.btn1.titleLabel?.text
        tableView.reloadData()
    }
    
    @IBAction func saveCallMe(_ segue: UIStoryboardSegue) {
        guard let CMVC = segue.source as? CommunicationMethodViewController else { return }
        communicationLabel.text = CMVC.btn2.titleLabel?.text
        tableView.reloadData()
    }
    
    @IBAction func saveBudget(_ segue: UIStoryboardSegue) {
        guard let budget = segue.source as? BudgetViewController else { return }
        if budget.negotiableButton.isSelected {
            budgetLabel.text = budget.negotiableButton.titleLabel?.text
        } else {
            budgetText = budget.budgetTextField.text
            let text = "\(budgetText!) тг"
            budgetLabel.text = text
        }
        tableView.reloadData()
    }
    
    @IBAction func saveDetails(_ segue: UIStoryboardSegue) {
        guard let details = segue.source as? DetailsViewController else { return }
        theDetailsLabel.text = details.detailsTextView.text
        deleteLayer(theDetailsLabel)
        open(detailsBackgroundLabel, detailsChangedLabel)
        tableView.reloadData()
    }
    
    @IBAction func saveDeadlines(_ segue: UIStoryboardSegue) {
        guard let deadlines = segue.source as? DeadlinesViewController else { return }
        var text = ""
        if deadlines.timeText == "Любое" {
            deadlines.timeText = "Любое время"
        }
        switch deadlines.dateText {
        case "Любой день":
            text = "\(deadlines.dateText), \(deadlines.timeText.lowercased())"
        case "Любой":
            text = "\(deadlines.dateText) день, \(deadlines.timeText.lowercased())"
        default:
            text = "\(deadlines.dateText) сентября, \(deadlines.timeText.lowercased())"
        }
        deadlinesLabel.text = text
        deleteLayer(deadlinesLabel)
        open(deadlinesBackgroundLabel, deadlinesChangedLabel)
        tableView.reloadData()
    }
    
    @IBAction func saveAdress(_ segue: UIStoryboardSegue) {
        guard let adress = segue.source as? AdressViewController else { return }
        cityText = adress.cityTextField.text
        adressText = adress.streetTextField.text
        let text = "г. \(cityText!), \(adressText!)"
        adressLabel.text = text
        deleteLayer(adressLabel)
        open(adressBackgroundLabel, adressChangedLabel)
        tableView.reloadData()
    }
}
