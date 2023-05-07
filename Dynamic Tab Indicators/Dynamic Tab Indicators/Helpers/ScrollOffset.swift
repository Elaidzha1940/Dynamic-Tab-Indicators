//
//  ScrollOffset.swift
//  Dynamic Tab Indicators
//
//  Created by Elaidzha Shchukin on 07.05.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let rect = proxy.frame(in: .global)
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: rect)
                }
            }
        
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
        
    }
}
