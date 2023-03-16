//
//  MessageManager.swift
//  MySchoolAssistant
//
//  Created by Mira-Louise Paquin on 2023-02-24.
//

import SwiftUI

func validateUser(username: String, password: String) -> Bool {
    var users: [Any]
    
    func getUsers() -> [Any] {
        people = [{
            "mail":"admin@test.com",
            "password":"Test123!",
            "code":9731
        }]
        return people
    }
    
    users = getUsers()
    
    for user in users {
        if user.mail == username && user.password == password {
            return true
        }
    }
    return false
}
