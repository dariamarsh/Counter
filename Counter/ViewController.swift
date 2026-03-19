//
//  ViewController.swift
//  Counter
//
//  Created by Daria Marshunina on 18.03.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
        historyTextView.showsVerticalScrollIndicator = true
        
    }
    
    private var counter: Int = 0
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateTimeString = dateFormatter.string(from: Date())
        return dateTimeString
    }
    
    
    @IBAction func plusAction(_ sender: Any) {
        counter += 1
        countLabel.text = "Значение счетчика: " + String(counter)
        historyTextView.text += "\n\(getDate()): значение изменено на +1"
    }
    
    @IBAction func minusAction(_ sender: Any) {
        if counter - 1 < 0 {
            counter = 0
            historyTextView.text += "\n\(getDate()): попытка уменьшить значение счетчика ниже 0"
        }
        else {
            counter -= 1
            historyTextView.text += "\n\(getDate()): значение изменено на -1"
        }
        countLabel.text = "Значение счетчика: " + String(counter)
        
    }
    
    @IBAction func clearAction(_ sender: Any) {
        counter = 0
        countLabel.text = "Значение счетчика: " + String(counter)
        historyTextView.text += "\n\(getDate()): значение сброшено"
    }
    
}

