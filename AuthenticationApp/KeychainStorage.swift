//
//  KeychainStorage.swift
//  AuthenticationApp
//
//  Created by Max Alva on 13/12/22.
//

import Foundation
import SwiftKeychainWrapper

enum KeychainStorage {
    static let key = "credentials"
    
    static func getCredentials() -> Credentials? {
        if let myCredentialsString = KeychainWrapper.standard.string(forKey: self.key) {
            return Credentials.decode(myCredentialsString)
        } else {
            return nil
        }
    }
    
    static func savedCredentials(_ credentials: Credentials) -> Bool {
        if (KeychainWrapper.standard.set(credentials.encoded(), forKey: self.key)) {
            return true
        } else {
            return false
        }
    }
    
    static func removedCredentials() -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: self.key)
    }
    
    func hasCredentials() -> Bool {
        return KeychainStorage.getCredentials() != nil
    }
    
    func removeCredentials() -> Bool {
        return KeychainStorage.removedCredentials()
    }
    
    
}
