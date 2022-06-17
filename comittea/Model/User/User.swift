//
//  User.swift
//  comittea
//
//  Created by Atyanta Awesa Pambharu on 16/06/22.
//

import Foundation

class User: Codable {
    
    var name: String = ""
    var isNewUser: Bool = true
    var stories: [Story] = [Story]()
    let userDefaults: UserDefaults = UserDefaults.standard
    let USER_KEY = "user_key"
    
    func save() -> Bool {
        do {
            let user = self
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            self.userDefaults.set(data, forKey: self.USER_KEY)
            return true
        }
        catch {

        }
        return false
    }
    
    func reset() {
        self.userDefaults.removeObject(forKey: self.USER_KEY)
    }
    
    func loadSavedUserData() -> Bool {
        if let data = self.userDefaults.data(forKey: self.USER_KEY) {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                self.name = user.name
                self.isNewUser = false
                self.stories = user.stories
                save()
                return true
            }
            catch {
                
            }
        }
        return false
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case isNewUser
        case stories
    }
    
}
