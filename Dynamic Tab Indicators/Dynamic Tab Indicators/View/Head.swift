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
    @State private var contentOffset: CGFloat = 0
    @State private var IndicatorWidth: CGFloat = 0
    @State private var IndicatorPosition: CGFloat = 0
    
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
                .offsetX { rect in
                    if currentTab == tab {
                        contentOffset = rect.minX - (rect.width * CGFloat(index(of: tab)))
                    }
                }
                .tag(tab)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .overlay(alignment: .top, content: {
            TabsView()
        })
        .preferredColorScheme(.dark)
    }
    
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.compactMap { index -> CGFloat? in
            return CGFloat(index) * tabViewWidth
        }
        
        let outputRangeForWidth = tabs.compactMap { tab -> CGFloat? in
            return tab.width
        }
        
        let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
            return tab.minX
        }
        
        let withInterpolitation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForWidth)
        
        let positionInterpolitation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        IndicatorWidth = withInterpolitation.calculate(for: contentOffset)
        IndicatorPosition = positionInterpolitation.calculate(for: contentOffset)
    }
    
    func index(of tab: Tab) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }
    
    @ViewBuilder
    func TabsView () -> some View {
        
        HStack(spacing: 0) {
            ForEach($tabs) { $tab in
                Text(tab.title)
                    .fontWeight(.semibold)
                
                    .offsetX { rect in
                        tab.minX = rect.minX
                        tab.width = rect.width
                    }
                
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
