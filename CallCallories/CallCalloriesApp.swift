//
//  CallCalloriesApp.swift
//  CallCallories
//
//  Created by Irvan P. Saragi on 07/08/23.
//

import SwiftUI

@main
struct CallCalloriesApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
