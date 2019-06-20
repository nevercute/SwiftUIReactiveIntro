//
//  ContentView.swift
//  SwiftUIReactiveIntro
//
//  Created by NEVERCUTE on 19/06/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var users = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Group {
                        TextField($firstName, placeholder: Text("First Name")).padding(12)
                        TextField($lastName, placeholder: Text("Last Name")).padding(12)
                        }.shadow(radius: 5).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 5))
                    HStack {
                        Button(action: {
                            self.users.append("\(self.firstName) \(self.lastName)")
                            self.firstName = ""
                            self.lastName = ""
                        }) {
                            Group {
                                Text("CREATE USER")
                                    .color(.white).padding(12)
                                
                                }.background(firstName.count + lastName.count == 0 ? Color.blue.opacity(0.5) : Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .shadow(radius: 5)
                            
                            
                        }.disabled(firstName.count + lastName.count == 0)
                        Button(action: {
                            self.users.removeAll()
                        }) {
                            Group {
                                Text("DELETE USERS")
                                    .color(.white).padding(12)
                                
                                }.background(users.count == 0 ? Color.red.opacity(0.5) : Color.red)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                                .shadow(radius: 5)
                            
                        }.disabled(users.count == 0)
                    }.padding(.trailing, 20)
                    
                    }.padding(12)
                
                
                }.navigationBarTitle(Text("Credit Card Form"))
                .navigationBarItems(leading: HStack {
                    Text("First name:")
                    Text(firstName).color(.orange)
                    Text("Last name:")
                    Text(lastName).color(.orange)
                })
                .background(Color.gray)
            VStack (alignment: .leading) {
                Text("All users").font(.subheadline)
                .padding(.bottom, -10)
                List (users.identified(by: \.self)) {
                    Text($0)
                }
            }
            .padding(.leading, 10)
            
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif





