//
//  SplashScreen.swift
//  Lottie Button
//
//  Created by Blake Pastrana on 9/9/24.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    
    @State var animationComplete = false
    @State var loggedIn = false
    @State var hideLottie = false

    var body: some View {
        ZStack {
            VStack {
                if !hideLottie {
                    LottieView(animation: .named("camera"))
                        .playing(loopMode: .playOnce)
                        .animationDidFinish { completed in
                            withAnimation(.easeInOut) {
                                self.animationComplete = true
                                self.hideLottie = self.loggedIn
                            }
                        }
                        .frame(width: 200, height: 200)
                        .transition(.moveAndFade)
                }
                if self.animationComplete {
                    if loggedIn {
                        ContentView()
                            .transition(.move(edge: .bottom))
                    } else {
                        VStack {
                            Spacer()
                            Text("PlaceHolder Login")
                            Spacer()
                        }.transition(.move(edge: .bottom))

                    }
                }
            }
        }
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

#Preview {
    SplashScreen()
}
