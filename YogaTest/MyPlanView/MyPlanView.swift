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
        GeometryReader { geo in
            ZStack {
                backgroundImage
                
                VStack {
                    Spacer()
                    title
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<vm.sessions.count, id: \.self) { index in
                                SessionCardView(session: vm.sessions[index], sessionNumber: index + 1)
                                    .frame(width: geo.size.width * 0.8)
                                    .scrollTransition(axis: .horizontal) { content, phase in
                                        content.scaleEffect(
                                            x: phase.isIdentity ? 1 : 0.9,
                                            y: phase.isIdentity ? 1 : 0.9
                                        )
                                    }
                            }
                        }
                    }
                    .contentMargins(.horizontal, 20)
                    .scrollTargetBehavior(.paging)
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<vm.sessions.count, id: \.self) { index in
                                Text("\(index + 1)")
                                    .frame(width: 30)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.horizontal, geo.size.width / 2)
                    }
                    .frame(height: 50)
                    .background(.black)
                    .opacity(0.5)
                    .overlay {
                        Image("scroller_frame")
                            .foregroundStyle(.white)
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            vm.fetchSessions()
        }
        .alert("Title", isPresented: $vm.isShowingAlert) {
            Button("OK") { print("OK") }
            Button("Cancel") { print("Cancel") }
        } message: {
            Text("This is a message.")
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
        ZStack {
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
            Button {
                vm.isShowingAlert = true
            } label: {
                Image(.planInfo)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding()
    }
}
