//
//  TabbarView.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            MyPlanView()
                .tabItem { Label("My Plan", image: "tab_bar_myplan_unselected") }
            Text("Library")
                .tabItem { Label("Library", image: "tab_bar_library_unselected") }
            Text("Milestones")
                .tabItem { Label("Milestones", image: "tab_bar_achievements_unselected") }
            Text("More")
                .tabItem { Label("More", image: "tab_bar_more_unselected") }
        }
        .tint(.black)
    }
}

#Preview {
    TabbarView()
}
