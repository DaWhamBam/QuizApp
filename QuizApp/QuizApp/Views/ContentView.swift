//
//  ContentView.swift
//  QuizApp
//
//  Created by Martin Hegel on 04.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(tab: $selectedTab)
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)
            
            BoardView()
                .tabItem {
                    Label(TabItem.board.title, systemImage: TabItem.board.icon)
                }
                .tag(TabItem.board)
            
            SettingsView()
                .tabItem {
                    Label(TabItem.settings.title, systemImage: TabItem.settings.icon)
                }
                .tag(TabItem.settings)
        }
    }
    
    @State private var selectedTab: TabItem = .home
}

#Preview {
    ContentView()
}
