//
//  ReminderTimeData+CoreDataProperties.swift
//  HourlyReminder
//
//  Created by  Robin George  on 31/12/21.
//
//

import Foundation
import CoreData


extension ReminderTimeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderTimeData> {
        return NSFetchRequest<ReminderTimeData>(entityName: "ReminderTimeData")
    }

    @NSManaged public var seconds: Double
    @NSManaged public var title: String?

}

extension ReminderTimeData : Identifiable {

}
