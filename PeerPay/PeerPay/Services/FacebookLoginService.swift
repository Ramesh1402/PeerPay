//
//  FacebookLoginService.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 22/03/24.
//

import Foundation
import FacebookLogin

class FacebookLoginService: ObservableObject {
    private let loginManager = LoginManager()
    @Published var facbookUser: FacebookUser?
    
    func login() {
        let loginConfiguration = LoginConfiguration(permissions:  ["public_profile"], tracking: .enabled)
        loginManager.logIn(configuration: loginConfiguration) { loginResult in
            switch loginResult {
            case .failed:
                print("Login Failed")
            case .cancelled:
                print("User Cancelled")
            case .success(let grantedPermission, let declinedPermission, let accessToken):
                print("Granted Permission: \(grantedPermission)")
                print("Declined Permission: \(declinedPermission)")
                print("access Token \(String(describing: accessToken))")
                self.fetchUserData()
            }
        }
    }
    
    func fetchUserData() {
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name"]).start { connection, result, error in
            if (error == nil){
                if let fbDetails = result as? [String : Any], let userName = fbDetails["name"] as? String, let id = fbDetails["id"] as? String {
                    DispatchQueue.main.async {
                        self.facbookUser = FacebookUser(name: userName, id: id)
                    }
                }
            }
        }
    }
    
    func setUserData() {
        if AccessToken.isCurrentAccessTokenActive {
            fetchUserData()
        }
    }
}
