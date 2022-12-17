//
//  DataController.swift
//  CoreDataTutorial
//
//  Created by Arun_Skyraan on 17/09/22.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "FruitEntity")
    
    init(){
//        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { decsription, error in
            if let error = error {
                print("Core Data Failed to load \(error.localizedDescription)")
            }
            
        }
    }
}
