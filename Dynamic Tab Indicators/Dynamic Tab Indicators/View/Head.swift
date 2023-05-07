//  /*
//
//  Project: Dynamic Tab Indicators
//  File: Head.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.05.2023
//
//  */

import SwiftUI

struct Head: View {
    
    @State private var currentTab: [Tab] = tabs_[0]
    @State private var tabs: [Tab] = tabs_
    
    var body: some View {
        
        TabView(selection: $currentTab)
        
    }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
