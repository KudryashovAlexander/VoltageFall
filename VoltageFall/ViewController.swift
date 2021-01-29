//
//  ViewController.swift
//  VoltageFall
//
//  Created by Александр Кудряшов on 18.01.2021.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - Outhlets
    
    @IBOutlet weak var powerTextField: UITextField!
    @IBOutlet weak var cosTextField: UITextField!
    @IBOutlet weak var voltageSegmentControl: UISegmentedControl!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var sizePickerView: UIPickerView!
    @IBOutlet weak var valueLabel: UILabel!
    
    var selectSize = 1.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
    }

    @IBAction func voltageFall(_ sender: UIButton) {
        
        valueLabel.text = calculatevoltageFall(power: 2.0, cos: 0.9, voltage: voltageSegmentControl, length: 50, size: selectSize)
        
    }
    
    //Расчет падения напряжения
    func calculatevoltageFall(power: Double, cos: Double, voltage: UISegmentedControl, length: Int, size: Double) -> String {
        
        var voltageFall: Double
        let segment = voltage.selectedSegmentIndex
        
        switch segment {
        case 0:
            voltageFall = 2 * power/cos/0.23 * 0.0178 * Double(length)/size * 100.0/230.0
        case 1:
            voltageFall = power/cos/0.4 * 0.0178 * Double(length)/size * 100.0/400.0
        default:
            voltageFall = 0.0
        }
        
        let value = String(format:"%.2f", voltageFall)+" %"
        return value
        
        
    }
    
}
//MARK: - Extension UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(sizeArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectSize = sizeArray[row]
    }
    
}


