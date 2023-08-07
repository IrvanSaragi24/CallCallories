//
//  DataController.swift
//  CallCallories
//
//  Created by Irvan P. Saragi on 07/08/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "FoodModel")
        
    init () {
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context : NSManagedObjectContext){
        
        do{
            try context.save()
            print("Nice , Data Saved")
        } catch{
            print("Data Not Saved")
        }
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext){
        let food = Food(context: context)
        
        food.id = UUID()
        food.name = name
        food.calories = calories
        food.date = Date()
        
        save(context: context)
    }
    
    func editFood(food : Food, name : String, calories : Double, context : NSManagedObjectContext){
        food.name = name
        food.calories = calories
        food.date = Date()
        
        save(context: context)
    }
}
