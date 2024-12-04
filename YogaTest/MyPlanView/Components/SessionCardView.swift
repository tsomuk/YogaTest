//
//  SessionCardView.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import SwiftUI

struct SessionCardView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Session 4")
                .font(.system(size: 23, weight: .semibold))
                
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.4)
                .opacity(0.2)
                .padding(.vertical, 15)
            
            HStack(spacing: 20) {
                Label("13 min", image: "session_duration")
                Label("Medium", image: "intensity_2_dark")
            }
            
            Text("\"He who says he can, and he who says he can't are both correct\"")                .multilineTextAlignment(.center)
                .padding(.top, 30)
                
            Text("Confucius")
                .padding(.top, 10)
            
            Button {
                print("start")
            } label: {
              Text("Start")
                    .foregroundStyle(.black)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 70)
                    .background(.yogaCyan)
                    .clipShape(.rect(cornerRadius: 40))
            }
            .padding(.top, 25)
        }
        .padding(.horizontal)
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SessionCardView()
            .padding(40)
    }
    
        
}

