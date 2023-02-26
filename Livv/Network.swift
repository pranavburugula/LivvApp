//
//  Network.swift
//  Livv
//
//  Created by Pranav Burugula on 2/26/23.
//

import Foundation
import SwiftUI
import OAuthSwift

class Network: ObservableObject {
    private var oauthswift: OAuthSwift
    
    init() {
        // create an instance and retain it
        oauthswift = OAuth2Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )
    }
    
    func auth() {
        let handle = oauthswift.authorize(
            withCallbackURL: "oauth-swift://oauth-callback/instagram",
            scope: "likes+comments", state:"INSTAGRAM") { result in
            switch result {
            case .success(let (credential, response, parameters)):
              print(credential.oauthToken)
              // Do your request
            case .failure(let error):
              print(error.localizedDescription)
            }
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey  : Any] = [:]) -> Bool {
      if url.host == "oauth-callback" {
        OAuthSwift.handle(url: url)
      }
      return true
    }
}
