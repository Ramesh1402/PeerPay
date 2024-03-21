//
//  SceneDelegate.swift
//  PeerPay
//
//  Created by Ramesh Shanmugam on 21/03/24.
//

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate is connected")
    }
}
