//
//  ReminderCell.swift
//  HourlyReminder
//
//  Created by  Robin George  on 31/12/21.
//

import UIKit

class ReminderCell: UITableViewCell {


    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var timeRemaining: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellCongig(title:String,sec: Double){
        self.backgroundColor = UIColor.orange
        cellTitle.text = title
        timeRemaining.text = "\(sec)"
    }

}
