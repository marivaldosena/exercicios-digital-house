//
//  WebUtils.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 09/10/20.
//

import Foundation
import UIKit

struct WebUtils {
    static func openURL(url: String) throws  {
        if let url = URL(string: url) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open the URL")
            }
        } else {
            print("URL instance not available")
        }
    }
    
    static func getNormalizeQueryParameters(queryParam: String) -> String {
        var allowedQueryParamAndKey = NSCharacterSet.urlQueryAllowed
        allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$, ")
        
        let normalizedQueryParam = queryParam.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey)
        
        return normalizedQueryParam ?? ""
    }
    
    static func getImage(imageUrl: String, fallbackImageName: String) -> UIImage? {
        var image: UIImage? = UIImage(named: fallbackImageName)
        let url = URL(string: imageUrl)
        let session = URLSession(configuration: .default)
        

        if let url = url {
            let downloadImageTask = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("Error: \(response.statusCode) status code.")
                    } else {
                        guard let data = data else {
                            print("Error on loading image")
                            return
                        }
                        
                        image = UIImage(data: data)
                    }
                }
            }
            
            downloadImageTask.resume()
        }
        
        return image
    }
}
