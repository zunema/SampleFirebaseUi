//
//  ContentView.swift
//  SampleFirebaseUi
//
//  Created by 飯尾悠也 on 2023/08/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var authStateManager = FirebaseAuthStateManager()
    @State var isShowSheet = false
    
    var body: some View {
        VStack {
            if authStateManager.signInState == false {
                // Sign-Out状態なのでSign-Inボタンを表示する
                Button(action: {
                    self.isShowSheet.toggle()
                }) {
                    Text("Sign-In")
                }
            } else {
                // Sign-In状態なのでSign-Outボタンを表示する
                Button(action: {
                    authStateManager.signOut()
                }) {
                    Text("Sign-Out")
                }
            }
        }
        .sheet(isPresented: $isShowSheet) {
            FirebaseUIView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
