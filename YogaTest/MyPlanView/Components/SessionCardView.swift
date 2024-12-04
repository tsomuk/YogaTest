//
//  SessionCardView.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import SwiftUI

struct SessionCardView: View {
    
    let session: Session
    let sessionNumber: Int
    
    var body: some View {
        VStack(spacing: 0) {
            titleWithIcon
            
            separationLine
                .padding(.vertical, 15)
            
            HStack(spacing: 20) {
                Label("\(session.length) min", image: "session_duration")
                Label("\(session.difficulty.rawValue)", image: session.difficulty.imageName)
            }
            
            quoteBlock
                .padding(.top, 30)
            
            Button {
                print("did it")
            } label: {
                didItButtonLabel
            }
            .padding(.top, 25)
        }
        .padding(.horizontal, 20)
        .frame(height: 300)
        .background(.white.opacity(0.9))
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    ZStack {
        Image(.chapter1Bg).resizable().ignoresSafeArea().scaledToFill()
        SessionCardView(session: Session.mockSession, sessionNumber: 3)
            .frame(maxHeight: 300)
    }
}

extension SessionCardView {
    var titleWithIcon: some View {
        ZStack {
            Text("Session \(sessionNumber)")
                .font(.system(size: 23, weight: .semibold))
            Image(systemName: "crown.fill")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundStyle(.gray.opacity(0.6))
        }
    }
    
    var separationLine: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
            .opacity(0.2)
    }
    
    var quoteBlock: some View {
        VStack(spacing: 0) {
            Text("\"\(session.quote)\"")
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Text("\(session.quoteAuthor)")
                .padding(.top, 10)
        }
    }
    
    var didItButtonLabel: some View {
        Text("Did it")
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .padding(.vertical, 15)
            .padding(.horizontal, 70)
            .background(.yogaCyan)
            .clipShape(.rect(cornerRadius: 40))
    }
}
