//Use this for basic coreData CRUD Operations

import Foundation
import CoreData

class CoreData {
    static let shared = CoreData()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func reminderSave(sec : Double,title : String){
        
        let context = persistentContainer.viewContext
        let reminder = ReminderTimeData(context: context)
        
        
        reminder.seconds = sec
        reminder.title = title
        
        //FIXME: error throws
        try! context.save()
    }
    
    func fetchReminder() -> [ReminderTimeData] {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<ReminderTimeData>(entityName: "ReminderTimeData")
        
        //FIXME: error throws
       return  try! context.fetch(request)
    }
    
    func reminderDelete(reminder:ReminderTimeData){
        let context = persistentContainer.viewContext
        context.delete(reminder)
        try! context.save()
    }
    
    
}
