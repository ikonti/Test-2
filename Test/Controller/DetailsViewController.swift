//
//  DetailsViewController.swift
//  Test
//
//  Created by Kanat Kuanyshbek on 9/12/19.
//  Copyright © 2019 Kanat Kuanyshbek. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var text: String?
    let placeholder = "Добавьте краткий комментарий если это необходимо для понимания задачи"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 8
        saveButton.layer.masksToBounds = true
        saveButton.isEnabled = false
        
        detailsTextView.delegate = self
        
        detailsTextView.text = placeholder
        detailsTextView.textColor = .lightGray
        
        if text != nil {
            detailsTextView.text = text
            detailsTextView.textColor = .black
            saveButton.isEnabled = true
        }
    }
}

// Настройки textView
extension DetailsViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if detailsTextView.textColor == .lightGray {
            detailsTextView.text = nil
            detailsTextView.textColor = .black
            saveButton.isEnabled = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(detailsTextView.text.count)"
        return detailsTextView.text.count + (text.count - range.length) <= 300
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

