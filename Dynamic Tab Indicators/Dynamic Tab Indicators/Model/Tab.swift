//  /*
//
//  Project: Dynamic Tab Indicators
//  File: Tab.swift
//  Created by: Elaidzha Shchukin
//  Date:  07.05.2023
//
//  */

import SwiftUI

struct Tab: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    
    var width: CGFloat = 0
    var minX: CGFloat = 0
}

var tabs_: [Tab] = [
    
    .init(title: "Hammererkopf"),
    .init(title: "Gaugu"),
    .init(title: "Korean"),
    .init(title: "Lenin"),
//    .init(title: "Oppenheimer"),
//    .init(title: "Silence"),
//    .init(title: "TheBookofHenry"),
//    .init(title: "TheImitationGame"),
//    .init(title: "Tolkien"),
//    .init(title: "VanGogh"),
//    .init(title: "WaitingfortheBarbarian"),
]


