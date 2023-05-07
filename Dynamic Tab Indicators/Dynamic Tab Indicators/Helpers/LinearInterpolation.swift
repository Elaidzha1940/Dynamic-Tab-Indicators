//
//  LinearInterpolation.swift
//  Dynamic Tab Indicators
//
//  Created by Elaidzha Shchukin on 07.05.2023.
//

import SwiftUI

class LinearInterpolation {
    
    private var lenght: Int
    private var inputRange: [CGFloat]
    private var outputRange: [CGFloat]
    
    init(inputRange: [CGFloat], outputRange: [CGFloat]) {
        
        assert(inputRange.count == outputRange.count)
        self.lenght = inputRange.count - 1
        self.inputRange = inputRange
        self.outputRange = outputRange
    }
    
}
