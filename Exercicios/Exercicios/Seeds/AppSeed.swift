//
//  AppSeed.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation

struct AppSeed {
    private static let items = [
        App(appName: "Employees", description: "Employees List Lorem Ipsum Blah Blah Blah"),
        App(appName: "Cars", description: "Cars List Lorem Ipsum Blah Blah Blah"),
        App(appName: "Animals", description: "Animals List Lorem Ipsum Blah Blah Blah"),
        App(appName: "Composers", description: "Composers List Lorem Ipsum Blah Blah Blah"),
        App(appName: "Developers", description: "Segmented Control and URLSession examples")
    ]
    
    static func seed() -> [App] {
        return items
    }
}
