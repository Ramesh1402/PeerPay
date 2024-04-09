//
//  MobileNumberView.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 30/03/24.
//

import SwiftUI

struct MobileNumberView: View {
    @EnvironmentObject var facebookLoginService: FacebookLoginService
    @StateObject var mobileNumberViewModel = MobileNumberViewModel()
    
    var body: some View {
        VStack {
            if mobileNumberViewModel.canShowDashboard {
                DashboardView()
            } else {
                if let userName = facebookLoginService.facbookUser?.name {
                    Text("Hello, \(userName)")
                        .font(.title)
                }
                EditTextFieldView(editTextField: $mobileNumberViewModel.mobileNumberNameField)
                EditTextFieldView(editTextField: $mobileNumberViewModel.confirmMobileNumberNameField)
                Button("Confirm") {
                    mobileNumberViewModel.confirm()
                }
            }
        }
        .padding()
    }
}

