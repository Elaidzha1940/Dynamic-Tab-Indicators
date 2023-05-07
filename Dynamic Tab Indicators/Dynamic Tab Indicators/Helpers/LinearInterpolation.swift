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
    
    func calculate(for x: CGFloat) -> CGFloat {
        
        if <= inputRange [0] { return outputRange [0]}
        
        for index in 1...lenght {
            
            let x1 = inputRange [index - 1]
            let x2 = inputRange [index]
            
            let y1 = outputRange [index - 1]
            let y2 = outputRange [index]
            
        /// Formula :  x2  + ((y2 - y1) / (x2 - x1))  * (x- x1)
            if x <= inputRange [index] {
                let resault =  x2  + ((y2 - y1) / (x2 - x1))  * (x- x1)
                return resault
            }
        }
        
        return outputRange [lenght]
        
    }
}
