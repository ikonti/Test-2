//
//  BudgetViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/11/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import DLRadioButton

class BudgetViewController: UIViewController {
    
    @IBOutlet weak var tengeLabel: UILabel!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var negotiableButton: DLRadioButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var btnIsSelected = false
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 8
        saveButton.layer.masksToBounds = true

        negotiableButton.isMultipleSelectionEnabled = true
        
        if btnIsSelected {
            negotiableButton.isSelected = true
            budgetTextField.isUserInteractionEnabled = false
            budgetTextField.textColor = .lightGray
            tengeLabel.textColor = .lightGray
        }
        
        if text != nil {
            budgetTextField.text = text
        }

    }
    
    @IBAction func negotiableButtonPressed(_ sender: DLRadioButton) {
        if negotiableButton.isSelected {
            budgetTextField.isUserInteractionEnabled = false
            budgetTextField.textColor = .lightGray
            tengeLabel.textColor = .lightGray
        } else {
            budgetTextField.isUserInteractionEnabled = true
            budgetTextField.textColor = .black
            tengeLabel.textColor = .black
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
