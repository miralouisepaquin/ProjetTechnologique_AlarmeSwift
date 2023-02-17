//
//  APIManager.swift
//  MySchoolAssistant
//
//  Created by EdwImac03 on 2023-02-17.
//

import SwiftUI

//GET, POST, PUT, DELETE, etc...
func makePOSTRequest() {
    // Prepare URL
    let url = URL(string: "https://51.222.158.139:3001")
    guard let requestUrl = url else {
        print("Invalid URL")
        return }
    // Methode, body, header
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyHashable] = [
        "date": "2023-02-17",
        "description": "mouvement détecté à 14:37",
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    // Perform HTTP Request
    let session = URLSession.shared
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            return
        }
        do{
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("Success: \(response)")
        }
        catch {
            print(error)
        }
    }
    task.resume()
}