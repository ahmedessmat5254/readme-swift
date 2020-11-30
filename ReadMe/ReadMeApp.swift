//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by daria on 25/11/2020.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Library())
        }
    }
}
