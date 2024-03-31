//
//  MobileNumberView.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 30/03/24.
//

import SwiftUI

struct MobileNumberView: View {
    @EnvironmentObject var facebookLoginService: FacebookLoginService
    var body: some View {
        Text(facebookLoginService.facbookUser?.name ?? "Unknown")
    }
}

