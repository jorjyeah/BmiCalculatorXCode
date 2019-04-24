//
//  ViewController.swift
//  Basic_240419_BMICalculator
//
//  Created by George Joseph Kristian on 24/04/19.
//  Copyright © 2019 George Joseph Kristian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var calculation: UILabel!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var bmiCalculationTitle: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    
    var tempHeight: Double! = 0
    var tempWeight: Double! = 0
    var tempCalculation: Double! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func printResult(){
        tempCalculation = tempWeight/pow(2,tempHeight)
        calculation.text = "\(String(format: "%.1f", tempCalculation)) kg/m2"

        if tempCalculation < 18.5{
            result.text = "Underweight"
            result.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        } else if tempCalculation >= 18.5 && tempCalculation < 24.9{
            result.text = "Normal"
            result.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else if tempCalculation >= 25 && tempCalculation < 29.9{
            result.text = "Overweight"
            result.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else if tempCalculation >= 30{
            result.text = "Obesity"
            result.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    func changeColor(color : UIColor){
        weight.textColor = color
        height.textColor = color
        calculation.textColor = color
        appTitle.textColor = color
        weightTitle.textColor = color
        heightTitle.textColor = color
        bmiCalculationTitle.textColor = color
    }
    
    @IBAction func modeSelector(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            changeColor(color: UIColor.black)
        case 1:
            self.view.backgroundColor = #colorLiteral(red: 0.1083906069, green: 0.093417041, blue: 0.1067530736, alpha: 1)
            changeColor(color: UIColor.white)
        default:
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            changeColor(color: UIColor.black)
        }
    }
    
    @IBAction func weightSlide(_ sender: UISlider) {
        weight.text = "\(String(format: "%.1f", sender.value)) kg"
        tempWeight = Double(sender.value)
        printResult()
    }
    
    @IBAction func heightSlide(_ sender: UISlider) {
        height.text = "\(String(format: "%.1f", sender.value)) m"
        tempHeight = Double(sender.value)
        printResult()
    }
}
