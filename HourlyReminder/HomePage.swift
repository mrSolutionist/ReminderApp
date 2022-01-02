//
//  HomePage.swift
//  HourlyReminder
//
//  Created by  Robin George  on 30/12/21.
//

import UIKit
import CloudKit

class HomePage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var timeDisplay: UILabel!
    @IBOutlet weak var todoTable: UITableView!
    var reminderData : [ReminderTimeData] = [] {
        didSet{
            DispatchQueue.main.async {
                
                self.todoTable.reloadData()
            }
        }
    }
    
    var timer : Timer?
    var currentTime : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTable.dataSource = self
        todoTable.delegate = self
        
        
    }
    
    func timerCall(curretTime : Double){
        currentTime = curretTime
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: curretTime, repeats: true)
    }
    
    @objc func step(){
        if currentTime! > 0 {
            currentTime! -= 1
            timeDisplay.text = "\(currentTime!)"
           
        }
        else {
            alarmTrigger()
            currentTime = timer?.userInfo as? Double
            timeDisplay.text = ""
            timer?.invalidate()
           
        }
        
    }
    
    func alarmTrigger(){
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        
        content.title = "Time Up"
        content.body = "body"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger )
        center.add(request) { error in
            if error != nil{
                print("\(String(describing: error?.localizedDescription))")
            }
            
        }
    }
    
   
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        reminderData = CoreData.shared.fetchReminder()
    }
    
    
    @IBAction func addReminder(_ sender: Any) {
        
        
    }
    
    
    
}



extension HomePage {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        
        cell.cellCongig(title: reminderData[indexPath.row].title!,sec: reminderData[indexPath.row].seconds)
        
        return cell
    }
}

extension HomePage{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            CoreData.shared.reminderDelete(reminder: self.reminderData[indexPath.row])
            self.reminderData =  CoreData.shared.fetchReminder()
            
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        timerCall(curretTime: reminderData[indexPath.row].seconds)
    
        
    }
    
   
   
    
    
}
