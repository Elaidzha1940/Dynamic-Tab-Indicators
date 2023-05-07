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
            TabsView()
        })
        .preferredColorScheme(.dark)
    }
    @ViewBuilder
    func TabsView () -> some View {
        
        HStack(spacing: 0) {
            ForEach($tabs) { $tab in
                Text(tab.title)
                    .fontWeight(.semibold)
                
                if tabs.last != tab {
                    Spacer(minLength: 0)
                }
                
            }
        }
        .padding([.top, .horizontal], 15)
        .overlay(alignment: .bottomLeading, content: {
            Rectangle()
                .frame(height: 4)
                .offset(y: 10)
        })
        .foregroundColor(.white)
    }
}

struct Head_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
