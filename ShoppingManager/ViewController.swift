//
//  ViewController.swift
//  ShoppingManager
//
//  Created by محمد عايض العتيبي on 19/01/1440 AH.
//  Copyright © 1440 code schoole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var trackStepper = 0
    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func stepper(_ sender: UIStepper) {
        var number = Int(stepper.value)
        trackStepper = number
        stepperValue.text = "\(number)"
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if trackStepper > 0 {
            if textField.text! == "" {
                alert(message: "Please Write Items")
            } else {
               addItems()
            }
        } else {
            if items.count == 0 {
                alert(message: "Please Add items")
            } else {
           performSegue(withIdentifier: "tableViewSegue", sender: self)
            emptyValue()
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        emptyValue()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ListTableViewController
        controller.items = items
    }
    
    func addItems() {
        items.append(textField.text!)
        textField.text! = ""
        trackStepper -= 1
        stepper.isEnabled = false
        if trackStepper == 0 {
            addButton.setTitle("Next", for: .normal)
            textField.isEnabled = false
        } else {
            addButton.setTitle("Add", for: .normal)
        }
    }
    
    
    func emptyValue(){
        stepperValue.text = "0"
        stepper.value = 0.0
        items = [String]()
        textField.isEnabled = true
        stepper.isEnabled = true
        trackStepper = 0
        addButton.setTitle("Add", for: .normal)
    }
    func alert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

