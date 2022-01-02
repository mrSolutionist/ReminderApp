//
//  Button.swift
//  HourlyReminder
//
//  Created by  Robin George  on 30/12/21.
//

import UIKit
@IBDesignable
class Button: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
 
    
    

}
