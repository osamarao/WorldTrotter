//
//  File.swift
//  WorldTrotter
//
//  Created by ablah on 7/8/16.
//  Copyright © 2016 osama. All rights reserved.
//

import UIKit


class CalculationController : UIViewController, UITextFieldDelegate{
    
    @IBOutlet var farenheitField : UITextField?
    @IBOutlet var celsiusLabel : UILabel?
    
    let numberFormatter : NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        
        return nf
    }()
    
    var farenheitValue : Double?{
        didSet{
            updateCelsiusValue()
        }
    }
    
    var celsiusValue : Double?{
        if let value = farenheitValue{
            return(value - 32) * ( 5 / 9 )
        } else {
            return nil
        }
    }
    
    
    
    @IBAction func farenheitFieldEditingChanged(textfield : UITextField){
        
        if let text = textfield.text, value = Double(text){
            farenheitValue = value
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender : AnyObject){
        farenheitField?.resignFirstResponder()
    }
    
    func updateCelsiusValue(){
        if let value = celsiusValue{
            celsiusLabel?.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel?.text = "???"
        }
        
    }
    
    
    
    
    
       
}
