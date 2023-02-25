//
//  HomeView.swift
//  Livv
//
//  Created by Pranav Burugula on 2/25/23.
//

import SwiftUI

struct HomeView: View {
    @State var curGroupName: String
    let allGroupNames: [GroupName]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Menu("Change Home") {
                        ForEach(allGroupNames) { groupName in
                            Button(groupName.name) {
                                curGroupName = groupName.name
                            }
                        }
                    }
                    
                    Grid {
                        
                        GridRow {
                            GroupBox {
                                Text("Chores").font(.title).multilineTextAlignment(.leading)
                                
                            }.frame(width: geometry.size.width * 0.5, alignment: .center)
                                .backgroundStyle(Color("ChoresAccentColor").opacity(0.3))
                            
                            GroupBox {
                                Text("Chores").font(.title).multilineTextAlignment(.leading)
                                
                            }.frame(width: geometry.size.width * 0.5, alignment: .center)
                                .backgroundStyle(Color("ChoresAccentColor").opacity(0.3))
                        }
                        
                    }
                    .navigationBarTitle(curGroupName)
                }.padding(.horizontal, geometry.size.width * 0.05)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(curGroupName: "My Home", allGroupNames: GroupName.sample)
    }
}

struct GroupName: Identifiable {
    let id = UUID()
    let name: String
}

extension GroupName {
    static var sample: [GroupName] {
        [GroupName(name:"My Home"), GroupName(name:"Home 2")]
    }
}
