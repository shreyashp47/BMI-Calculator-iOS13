//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSilderChanged(_ sender: UISlider) {
        heigthLabel.text = String( format: "%.2f", sender.value) + "mm"
    }
    
    @IBAction func weightSliderChnage(_ sender: UISlider) {
        weightLabel.text = String( format: "%.0f", sender.value) + "Kg"
    }
    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value

        calculatorBrain.calculateBmi(height: height,wieght: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let  destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiResult = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}

