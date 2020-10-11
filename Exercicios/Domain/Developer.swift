//
//  Developer.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 10/10/20.
//

import Foundation

//MARK: - Developer: Person
class Developer: Person {
    var projects: [Project] = []
    
    init(name: String, imageName: String, profileUrl: String, projects: [Project]) {
        self.projects = projects
        super.init(name: name, imageName: imageName, profileUrl: profileUrl)
    }
}

//MARK: - Developer
extension Developer {
    func addProject(project: Project) {
        self.projects.append(project)
    }
    
    func addProject(name: String, url: String, stars: Int) {
        let project = Project(name: name, url: url, stars: stars)
        
        self.projects.append(project)
    }
    
    func addProject(name: String, url: String) {
        self.addProject(name: name, url: url, stars: 0)
    }
}
