//
//  CoreDataManager.swift
//  CoreDataTutorial
//
//  Created by Arun_Skyraan on 08/09/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "DB")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    func savaDetails(name: String, email : String, id : Int, address :  String, payment : Bool ) {
        let employee = Employee(context: persistentContainer.viewContext)
        employee.name = name
//        employee.email = email
        employee.id = Int16(id)
//        employee.address = address
        employee.payment = payment
//        student.address = address
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }
    
    func getAllDetails() -> [Employee] {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return[]
        }
    }
}
