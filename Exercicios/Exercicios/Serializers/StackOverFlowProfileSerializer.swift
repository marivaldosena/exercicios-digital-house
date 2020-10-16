//
//  StackOverFlowProfileSerializer.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 11/10/20.
//

import Foundation
import SwiftSoup

struct StackOverFlowProfileSerializer {
    static func fromHTMLToPerson(html: Element?) -> Person? {
        var person: Person? = nil
        
        if let element = html {
            do {
                let userImageUrl = try element.select(".user-gravatar32 img.bar-sm").attr("src").trimmingCharacters(in: .whitespacesAndNewlines)
                let userProfileUrl = try element.select(".user-gravatar32 > a").attr("href").trimmingCharacters(in: .whitespacesAndNewlines)
                let userName = try element.select(".user-details > a").text().trimmingCharacters(in: .whitespacesAndNewlines)
                
                person = Person(name: userName, imageName: "\(K.API.Developers.stackOverFlowBaseUrl)\(userImageUrl)", profileUrl: "\(K.API.Developers.stackOverFlowBaseUrl)\(userProfileUrl)")
            } catch Exception.Error(let type, let message) {
                print("Error Type: \(type), Message: \(message)")
            } catch {
                print("Error: \(error)")
            }
        }
        
        return person
    }
    
    private static func parseStackOverFlowProfiles(html: Data?) -> Elements? {
        var result: Elements? = nil
        if let data = html {
            do {
                let htmlData = String(decoding: data, as: UTF8.self)
                let doc: Document = try SwiftSoup.parse(htmlData)
                let htmlStackOverFlowProfiles: Elements = try doc.select(".fs-body2.mb32 table.w100.mb32 tr.bb.bc-black-2 .user-info")
                
                result = htmlStackOverFlowProfiles
            } catch Exception.Error(let type, let message) {
                print("Error Type: \(type), Message: \(message)")
            } catch {
                print("Error: \(error)")
            }
        }
        
        return result
    }
    
    static func fromHTMLToPeople(html: Data?) -> [Person] {
        let htmlStackOverFlowProfiles = parseStackOverFlowProfiles(html: html)
        var people = [Person]()
        
        if let elements = htmlStackOverFlowProfiles {
            for elem in elements {
                if let person = fromHTMLToPerson(html: elem)  {
                    people.append(person)
                }
            }
        }
        
        
        return people
    }
}
