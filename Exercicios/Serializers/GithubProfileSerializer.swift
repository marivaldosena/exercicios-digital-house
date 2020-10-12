//
//  GithubProfileSerializer.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 12/10/20.
//

import Foundation
import SwiftSoup

struct GithubProfileSerializer {
    static func fromHTMLToDevelopers(html: Data?) -> [Developer] {
        var developers = [Developer]()
        
        if let htmlProfiles = parseHTMLDataToDeveloperProfiles(html: html) {
            for elem in htmlProfiles {
                if let developer = fromHTMLToDeveloper(html: elem) {
                    developers.append(developer)
                }
            }
        }
        
        return developers
    }
    
    private static func parseHTMLDataToDeveloperProfiles(html: Data?) -> Elements? {
        if let data = html {
            let htmlString = String(decoding: data, as: UTF8.self)
            
            do {
                let doc: Document = try SwiftSoup.parse(htmlString)
                let elements: Elements = try doc.select("table.users-list tbody tr")
                return elements
            } catch Exception.Error(let type, let message) {
                print("Error Type: \(type), Message: \(message)")
            } catch {
                print("Error: \(error)")
            }
        }
        
        return nil
    }
    
    static func fromHTMLToDeveloper(html: Element?) -> Developer? {
        var developer: Developer? = nil
        
        guard let elem = html else {
            return developer
        }
        
        do {
            let profileUrl = try elem.select("a").attr("href")
            let userName = try elem.select("a").text()
            let imageProfile = try elem.select("td.photo img").attr("src")
            
            developer = Developer(name: userName, imageName: imageProfile, profileUrl: profileUrl, projects: [])
        } catch Exception.Error(let type, let message) {
            print("Error Type: \(type), Message: \(message)")
        } catch {
            print("Error: \(error)")
        }
        
        return developer
    }
}
