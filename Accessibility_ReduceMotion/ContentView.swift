//
//  ContentView.swift
//  Accessibility_ReduceMotion
//
//  Created by Luiz Araujo on 24/08/22.
//
// https://lnkd.in/dx_r84Kf
import SwiftUI

struct ContentView: View {
    @State private var isRotating = false
    @State private var isHidden = false
    
    let subtleFeel = Animation.easeInOut
    let bouncyFeel = Animation.interpolatingSpring(stiffness: 300, damping: 15)
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var body: some View {
        VStack(spacing: 14) {
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 48 : 0), anchor: .leading)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing : .leading)
                .opacity(isHidden ? 0 : 1)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? -48 : 0), anchor: .leading)
        }
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
        .accessibilityLabel("Hamburger Menu")
        .onTapGesture {
            withAnimation(reduceMotion ? subtleFeel : bouncyFeel) {
                isRotating.toggle()
                isHidden.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
