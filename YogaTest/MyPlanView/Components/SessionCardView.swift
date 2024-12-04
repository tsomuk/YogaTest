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
            
            separationLine
                .padding(.vertical, 15)
            
            HStack(spacing: 20) {
                Label("13 min", image: "session_duration")
                Label("Medium", image: "intensity_2_dark")
            }
            
            quoteBlock
                .padding(.top, 30)
            
            Button {
                print("start")
            } label: {
                didItButtonLabel
            }
            .padding(.top, 25)
        }
        .padding(.horizontal)
        .padding()
        .background(.white.opacity(0.9))
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    MyPlanView()
}

extension SessionCardView {
    var separationLine: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            .opacity(0.2)
    }
    
    var quoteBlock: some View {
        VStack(spacing: 0) {
            Text("\"He who says he can, and he who says he can't are both correct\"")
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("Confucius")
                .padding(.top, 10)
        }
    }
    
    var didItButtonLabel: some View {
        Text("Did it")
            .foregroundStyle(.black)
            .padding(.vertical, 20)
            .padding(.horizontal, 70)
            .background(.yogaCyan)
            .clipShape(.rect(cornerRadius: 40))
    }
}
