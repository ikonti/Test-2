//
//  CommunicationMethodViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/11/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit
import DLRadioButton

class CommunicationMethodViewController: UIViewController {
    
    @IBOutlet weak var btn1: DLRadioButton!
    @IBOutlet weak var btn2: DLRadioButton!
    @IBOutlet weak var goButton: UIButton!
    
    var btn1IsSelected = false
    var btn2IsSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn1.isMultipleSelectionEnabled = true
        btn2.isMultipleSelectionEnabled = true
        
        btn1.setTitle("Написать мне в чат naimi.kz", for: .normal)
        btn2.setTitle("Позвонить мне на телефон", for: .normal)
        
        goButton.layer.cornerRadius = 8
        goButton.layer.masksToBounds = true
        
        if btn1IsSelected {
            btn1.isSelected = true
        }
        
        if btn2IsSelected {
            btn2.isSelected = true
        }
    }
}
