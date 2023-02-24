//
//  APIManager.swift
//  MySchoolAssistant
//
//  Created by EdwImac03 on 2023-02-17.
//

import SwiftUI

// Create Date
let date = Date()

// Create Date Formatter
let dateFormatter = DateFormatter()

//GET, POST, PUT, DELETE, etc...
func createPOSTLogs(text: String) {
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    // Prepare URL
    let url = URL(string: "http://51.222.158.139:3001/api/logs")
    guard let requestUrl = url else {
        print("Invalid URL")
        return }
    // Methode, body, header
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyHashable] = [
        "date":  dateFormatter.string(from: date),
        "description": text
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    // Perform HTTP Request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data, error == nil else {
            print("guard error")
            return
        }
        do{
            let response = try JSONDecoder().decode(Response.self, from: data)
            print("Success: \(response)")
        }
        catch {
            print(error)
        }
    }
    task.resume()
    
    struct Response: Codable{
        let date: String
        let description: String
    }
}
