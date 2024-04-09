//
//  ContentView.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 09/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var facebookLoginService: FacebookLoginService = FacebookLoginService()
    var body: some View {
        VStack {
            if let _ = facebookLoginService.facbookUser {
                MobileNumberView()
            } else {
                Button(action: {
                    facebookLoginService.login()
                }, label: {
                    Text("Continue with facebook")
                })
                .padding()
            }
        }
        .onAppear {
            facebookLoginService.setUserData()
        }
        .environmentObject(facebookLoginService)
    }
}
