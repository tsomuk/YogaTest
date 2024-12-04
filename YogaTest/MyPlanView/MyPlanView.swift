//
//  ContentView.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import SwiftUI

struct MyPlanView: View {
    
    @StateObject var vm = MyPlanViewModel()
    
    var body: some View {
        ZStack {
            backgroundImage
            
            VStack {
                Spacer()
                title
                Spacer()
                SessionCardView()
                    .padding(.horizontal, 40)
                Spacer()
                slider
                Spacer()
            }
            
        }
    }
}

#Preview {
    MyPlanView()
}

extension MyPlanView {
    var backgroundImage: some View {
        Image(.chapter1Bg)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
    }
    
    var title: some View {
        VStack(spacing: 8) {
            Text("My Plan".uppercased())
                .fontWeight(.semibold)
            Rectangle()
                .frame(maxWidth: 90, maxHeight: 1)
            Text("chapter 1".uppercased())
            
            Text("Sun Salutation Variation")
                .fontWeight(.semibold)
                .frame(maxWidth: 150)
                .multilineTextAlignment(.center)
        }
            
            .foregroundColor(.black)
            .padding()
    }
    
    var slider: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 40)
    }
}
