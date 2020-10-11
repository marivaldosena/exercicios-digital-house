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
    
    static func getDownloadDataTask(url: String, downloadHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask? {
        let urlInstance = URL(string: url)
        let session = URLSession(configuration: .default)
        
        if let urlInstance = urlInstance {
            let downloadTask = session.dataTask(with: urlInstance, completionHandler: downloadHandler)
            
            return downloadTask
        }
        
        return nil
    }
    
    static func getContent(url: String) -> Data? {
        var downloadedData: Data? = nil
        
        func handleData(url: String) -> Data? {
            DispatchQueue.main.async {
                let downloadTask = getDownloadDataTask(url: url) { (data, response, error) in
                    handleErrors(error: error)
                    if getResponseInstance(response: response) != nil {
                        if let data = data {
                            downloadedData = data
                        }
                    }
                }
                downloadTask?.resume()
            }
            return downloadedData
        }
        
        downloadedData = handleData(url: url)
        
        return downloadedData
    }
    
    private static func handleErrors(error: Error?) {
        if let error = error {
            print("Error: \(error)")
        }
    }
    
    private static func getResponseInstance(response: URLResponse?) -> HTTPURLResponse? {
        guard let response = response as? HTTPURLResponse else {
            return nil
        }
        
        return response
    }
}
