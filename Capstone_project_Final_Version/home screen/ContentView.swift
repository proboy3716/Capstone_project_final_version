//
//  ContentView.swift
//  home screen
//
//  Created by DPI Student 015 on 7/18/26.
//

import SwiftUI

struct ContentView: View {
    @State var goToMain = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color.red, Color.black],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("Welcome")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: {
                        goToMain = true
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
            }
            .navigationDestination(isPresented: $goToMain) {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
