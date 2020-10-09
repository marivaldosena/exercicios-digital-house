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
    
    static func normalizeQueryParameters(queryParam: String) -> String {
        var allowedQueryParamAndKey = NSCharacterSet.urlQueryAllowed
        allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$, ")
        
        let normalizedQueryParam = queryParam.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey)
        
        return normalizedQueryParam ?? ""
    }
}
