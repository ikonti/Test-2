//
//  DeadlinesViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/12/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit

class DeadlinesViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var dateModelPicker: DateModelPicker!
    var timeModelPicker: TimeModelPicker!
    
    var rotationAngle: CGFloat!
    
    var dateText = "Любой день"
    var timeText = "Любое время"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pickerChanged), name: .pickersChanged, object: nil)
        
        // ротация
        rotationAngle = -90 * (.pi/180)
        
        // получение базы
        dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Data2.getData()
        
        timeModelPicker = TimeModelPicker()
        timeModelPicker.modelTime = Time.getTime()
        
        // настройки отображении и размещении
        datelabel.frame = CGRect(x: 187.5, y: 180, width: view.frame.width, height: 20)
        timeLabel.frame = CGRect(x: 181, y: 260, width: view.frame.width, height: 20)
        
        dayPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        dayPicker.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        dayPicker.delegate = dateModelPicker
        dayPicker.dataSource = dateModelPicker
        
        timePicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        timePicker.frame = CGRect(x: 0, y: 280, width: view.frame.width, height: 50)
        timePicker.delegate = timeModelPicker
        timePicker.dataSource = timeModelPicker
        
        saveButton.layer.cornerRadius = 8
        saveButton.layer.masksToBounds = true
        
    }
    
    // Выбор и передача данных picker
    @objc func pickerChanged() {
        let date = dayPicker.selectedRow(inComponent: 0)
        let time = timePicker.selectedRow(inComponent: 0)
        
        let selectedDates = dateModelPicker.modelData[date]
        print(selectedDates.date)
        dateText = selectedDates.date
        
        let selectedTimes = timeModelPicker.modelTime[time]
        print(selectedTimes.time)
        timeText = selectedTimes.time
    }
}

