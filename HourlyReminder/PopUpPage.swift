//
//  PopUpPage.swift
//  HourlyReminder
//
//  Created by  Robin George  on 30/12/21.
//

import UIKit

class PopUpPage: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var titleBox: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
      

      

        //date picker mode has enum values
        timePicker.datePickerMode = .countDownTimer
        
       
    }
    

    
    @IBAction func setButton(_ sender: Any) {
        let title = titleBox?.text!
        let setTime = timePicker.countDownDuration
        CoreData.shared.reminderSave(sec: setTime,title: title!)
       
     
    }
    
   
}
