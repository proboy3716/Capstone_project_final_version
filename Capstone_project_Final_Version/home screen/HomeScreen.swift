//
//  HomeScreen.swift
//  Capstone-Features
//
//  Created by DPI Student 005 on 7/25/26.
//

import SwiftUI

// Home screen
struct homeScreen: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack() {
            Image("back2")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                Image("2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 16)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 100)
                    .shadow(radius:10)
                
                Text("Login")
                    .font(.custom("Silkscreen-Bold", size: 27))
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
                    .padding([.bottom], 30)
                
                VStack (alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 30)
                        .frame(height: 50)
                        .cornerRadius(20)

                    SecureField("Password", text:self.$password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 30)
                        .frame(height: 50)
                        .cornerRadius(20)

                    
                }
                
                Button(action: {}) {
                    Text("Sign In")
                        .font(.custom("Silkscreen-Bold", size: 27))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.red)
                        .cornerRadius(15.0)
                    
                }
                HStack(spacing: 15) {
                    Button(action: {}) {
                        Text("Don't have an account? Register here")
                            .font(.custom("Pixelbasel", size: 20))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                }
            }
        }
    }
}
