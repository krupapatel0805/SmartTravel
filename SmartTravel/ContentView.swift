//
//  ContentView.swift
//  SmartTravel
//
//  Created by Sam 77 on 2023-09-16.
//

import SwiftUI
import CoreData
import Firebase
import FirebaseFirestore

struct ContentView: View {
    private let splashDuration: Double = 2.0
    @State private var showMainScreen = false

    var body: some View {
        NavigationView {
            ZStack {
                if showMainScreen {
                            NavigationView {
                                VStack() {
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 350, height: 250)
                                        .background(
                                            Image("Logo.png")
                                        )

                                    Text("make your travel easy")
                                        .font(Font.custom("Roboto", size: 24).weight(.medium))
                                        .foregroundColor(Color(red: 0.39, green: 0.56, blue: 0.89))
                                        .padding(10)
                                    
                                    NavigationLink(destination: SignInScreen()) {
                                        Text("Sign in")
                                            .font(Font.custom("Roboto", size: 14).weight(.bold))
                                            .foregroundColor(.white)
                                            .frame(width: 200, height: 35)
                                            .background(Color(red: 0.39, green: 0.67, blue: 1))
                                            .cornerRadius(20)
                                            .shadow(
                                                color: Color(red: 0.27, green: 0.57, blue: 0.85, opacity: 0.25), radius: 7, y: 4
                                            )
                                    }
                                    
                                    NavigationLink(destination: SignUpScreen()) {
                                        Text("Sign up")
                                            .font(Font.custom("Roboto", size: 14).weight(.bold))
                                            .foregroundColor(.white)
                                            .frame(width: 200, height: 35)
                                            .background(Color(red: 0.39, green: 0.56, blue: 0.90))
                                            .cornerRadius(20)
                                            .shadow(
                                                color: Color(red: 0.27, green: 0.57, blue: 0.85, opacity: 0.25), radius: 7, y: 4
                                            )
                                    }
                                    
                                }
                                .frame(width: 414, height: 736)
                                .background(.white)
                                .shadow(
                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                                )
                            }

                                }
                else {
                    Image("Logo.png")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: splashDuration, repeats: false) { _ in
                                withAnimation {
                                    self.showMainScreen = true
                                }
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
