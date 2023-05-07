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
    
    @State private var currentTab: Tab = tabs_[0]
    @State private var tabs: [Tab] = tabs_
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            ForEach(tabs) { tab in
                GeometryReader {
                    let size = $0.size
                    
                    Image(tab.title)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                    
                }
                .clipped()
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .overlay(alignment: .top, content: {
            TabView()
        })
        .preferredColorScheme(.dark)
        
        @ViewBuilder
        func TabView () -> some View {
            
            HStack(spacing: 0) {
                ForEach(tabs) { tab in
                    
                }
            }
        }
    }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
