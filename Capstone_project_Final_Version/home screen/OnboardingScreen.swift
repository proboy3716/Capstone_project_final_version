import SwiftUI

struct OnboardContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        if currentPage > totalPages {
            homeScreen()
        }
        
        else{
            OnboardingScreen()
        }
    }
}
struct OnboardContentView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardContentView()
    }
}
                
var totalPages = 3


// on boarding pg
struct OnboardingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Image("back2")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            HStack {

                Spacer()
            }
            
            if currentPage == 1 {
                ScreenView(image: "gaming", title: "Modify Your Console", details: "Modifying consoles from your PS1 to the wiiU, made easier for your convenience")
                
            }; if currentPage == 2 {
                ScreenView(image: "chatting", title: "Chat With Gamers", details: "Chat with gamers who share similar interests, experiences, and consoles!")
            }; if currentPage == 3 {
                ScreenView(image: "sites", title: "Find Resources", details: "Have you ever struggled on where to find Youtubers and websites to modify your consoles? We have them all!")
                
            }
            
        }
    }
}

import SwiftUI

// Home screen
struct HomeScreen: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @Binding var path: MainTabView
    
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
                    
                    HStack() {
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
                                .ignoresSafeArea()
                            
                            
                        }
                    }
                    
                    Button("Sign In") {
                        path = MainTabView()
                            .font(.custom("Silkscreen-Bold", size: 27))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.red)
                            .cornerRadius(15)
                        
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

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    @Environment(\.displayScale) private var displayScale
    @State private var goToHome = false
    let totalPages = 3
    
    var image: String
    var title: String
    var details: String
    
    var body: some View {
        
        VStack{
            HStack {
                
                if currentPage == 1 {
                    Text("ModThat")
                        .font(.custom("Audex-Regular", size: 23))
                        .kerning(1.2)
                        .foregroundColor(.white)
                    
                }
                
                // adding hello to screen 1 only
                else {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.gray)
                            .opacity(0.4)
                            .cornerRadius(10)
                    })
                }
                
                
                
                Spacer()
                
                
                // button to skip to home screen
                Button(action: {
                    
                    currentPage = 4
                    
                }, label: {
                    Text("SKIP")
                        .font(.custom("Audex-Regular", size: 23))
                        .kerning(1.2)
                        .foregroundColor(.red)
                })
            }.padding()
                .foregroundColor(Color.black)
            
            // image
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength:80)
            
            Text(title)
                .font(.custom("Silkscreen-Bold", size: 23))
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(Color.white)
            
            
            Text(details)
                .font(.custom("Pixelbasel", size: 27))
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            
            Spacer(minLength:0)
            
            
            HStack {
                
                
                if currentPage == 1 {
                    // make lines thin + colors them. lets user know what page they're on
                    
                    Color.white.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    Color.gray.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    Color.gray.frame(height: 8 / displayScale)
                    
                        .padding(.bottom,80)
                    
                    
                    
                }
                
                else if currentPage == 2 {
                    Color.gray.frame(height: 8 / displayScale)                        .padding(.bottom,80)
                    
                    Color.white.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    Color.gray.frame(height: 8 / displayScale)
                    
                        .padding(.bottom,80)
                    
                }
                
                else if currentPage == 3 {
                    Color.gray.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    Color.gray.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    Color.white.frame(height: 8 / displayScale)
                        .padding(.bottom,80)
                    
                    
                }
                
            }
        }
        
        // bottom bars displayed for when user changes screen
        
        Button(action: {
            if currentPage <= totalPages {
                currentPage += 1
            } else {
                goToHome = true
            }
        }, label: {
            
            Button(action: {
                if currentPage <= totalPages {
                    currentPage += 1
                }
                
                else {
                    currentPage = 1
                    
                }
            }, label: {
                
                if currentPage == 3 {
                    Text("Get Started")
                        .font(.custom("Silkscreen-bold", size: 15))
                        .frame(minWidth:0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.main)
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                }
                else {
                    Text("Next")
                        .font(.custom("Silkscreen-bold", size: 15))
                        .frame(minWidth:0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.main)
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                    
                }
                
            })
            
        })
        .fullScreenCover(isPresented: $goToHome) {
            homeScreen()
    }
}

        }
