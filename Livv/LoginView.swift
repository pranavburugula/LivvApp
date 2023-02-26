//
//  LoginView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/26/23.
//

import SwiftUI
import OAuthSwift

struct LoginView: View {
    @State private var isAuthorized = false
        
    let oauthswift = OAuth2Swift(
        consumerKey: "YOUR_CLIENT_ID",
        consumerSecret: "YOUR_CLIENT_SECRET",
        authorizeUrl: "AUTHORIZATION_SERVER_URL",
        accessTokenUrl: "TOKEN_SERVER_URL",
        responseType: "code"
    )
    
    var body: some View {
        VStack {
                    if isAuthorized {
                        Text("You are authorized!")
                    } else {
                        Button(action: {
                            self.oauthswift.authorizeURLHandler = SafariURLHandler(viewController: UIApplication.shared.windows.first!.rootViewController!, oauthSwift: oauthswift)
                            let _ = self.oauthswift.authorize(
                                withCallbackURL: URL(string: "YOUR_CALLBACK_URL")!,
                                scope: "SCOPE",
                                state: "STATE",
                                success: { credential, response, parameters in
                                    self.isAuthorized = true
                                },
                                failure: { error in
                                    print(error.localizedDescription)
                                }, completionHandler: <#OAuth2Swift.TokenCompletionHandler#>
                            )
                        }) {
                            Text("Authenticate")
                        }
                    }
                }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
