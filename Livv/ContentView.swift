//
//  ContentView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var page: Pages
    
    var body: some View {
        VStack {
            switch(page) {
            case Pages.HOME:
                HomeView()
            }
            
            HStack(alignment: VerticalAlignment.bottom) {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(page: Pages.HOME)
    }
}

enum Pages {
case HOME
}
