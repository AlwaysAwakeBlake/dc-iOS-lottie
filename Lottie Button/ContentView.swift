//
//  ContentView.swift
//  Lottie Button
//
//  Created by Blake Pastrana on 9/8/24.
//

import SwiftUI
import Lottie

struct ContentView: View {
    
    @State private var liked = false
    
    var body: some View {
        VStack {
            
            // Profile Row
            HStack {
                Image("headshot")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("AlwaysAwakeBlake")
                        .font(.headline)
                    Text("Washington DC")
                        .font(.footnote)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .padding(.trailing)
            }
            .padding(.leading)
            
            // Body Row
            Image("picture")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
            
            // Action Buttons
            HStack (alignment: .center) {
//                LottieButton(animation: .named("TwitterHeartButton")) {
//                    print("Lottie Heart Button")
//                    liked = !liked
//                }
                LottieButton(animation: .named("TwitterHeartButton")) {
                    print("Lottie Heart Button")
                    liked = !liked
                }

                .animate(fromMarker: "touchDownStart", toMarker: "touchDownEnd", on: .touchDown)
                
                .animate(fromMarker: "touchDownEnd", toMarker: "touchUpCancel", on: .touchUpOutside)
                .animate(fromMarker: "touchDownEnd", toMarker: liked ? "touchUpCancel" : "touchUpEnd", on: .touchUpInside)
                .configure { lottieAnimationView in
                    lottieAnimationView.animationView.logHierarchyKeypaths()
                }
//                .valueProvider(ColorValueProvider(LottieColor(r: 0.0, g: 0.0, b: 1.0, a: 1.0)), for: AnimationKeypath(keypath: "H1.Shape 1.Fill 1.Color"))
                .frame(width: 30, height: 30)

                Text("100")
       
                Button("96", systemImage:"bubble.right") {
                    print("Bubble Button")
                }
                .imageScale(.large)
                
                Button("", systemImage:"paperplane") {
                    print("Share Button")
                }
                .imageScale(.large)
                
                Spacer()
                
                Button("", systemImage:"bookmark") {
                    print("Bookmark Button")
                }
                .imageScale(.large)
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .foregroundColor(.primary)
        }
    }
}

#Preview {
    ContentView()
}
