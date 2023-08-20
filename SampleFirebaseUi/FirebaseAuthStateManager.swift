//
//  FirebaseAuthStateManager.swift
//  SampleFirebaseUi
//
//  Created by 飯尾悠也 on 2023/08/20.
//

//import Foundation
import SwiftUI
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI

class FirebaseAuthStateManager: ObservableObject {
    @Published var signInState: Bool = false
    private var handle: AuthStateDidChangeListenerHandle!
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("Sign-in")
                self.signInState = true
            } else {
                print("Sign-out")
                self.signInState = false
            }
        }
    }
    
    deinit {
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error")
        }
    }
}
