//
//  TimeModelPicker.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/14/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit

// Модель времени
class TimeModelPicker: UIPickerView {
    var modelTime: [TimeModel]!
    let customWidth: CGFloat = 100
    let customHeight: CGFloat = 100

}

extension TimeModelPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelTime.count
    }
}

extension TimeModelPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // Добавление view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        // Добавление imageView, круглой формы
        let imageView = UIImageView(frame: CGRect(x: 25, y: 25, width: customWidth/2, height: customHeight/2))
        imageView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        view.addSubview(imageView)
        
        // Добавление label
        let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelTime[row].time
        middleLabel.textAlignment = .center
        middleLabel.textColor = .white
        middleLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        view.addSubview(middleLabel)
        
        // ротация view
        view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NotificationCenter.default.post(name: .pickersChanged, object: self)
        
    }
}
