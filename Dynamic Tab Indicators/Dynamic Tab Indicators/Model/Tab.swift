//
//
//
//  Tab.swift
//  Dynamic Tab Indicators
//
//  Created by Elaidzha Shchukin on 07.05.2023.
//

import SwiftUI

struct Tab: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    
    var width: CGFloat = 0
    var minX: CGFloat = 0
}

var tabs_: [Tab] = [
    
    .init(title: "Gaugu"),
    .init(title: "Hammererkopf"),
    .init(title: "Korean"),
    .init(title: "Lenin"),
    .init(title: "Oppenheimer"),
    .init(title: "Silence"),
    .init(title: "TheBookofHenry"),
    .init(title:  "TheImitationGame"),
    .init(title:  "Tolkien"),
    .init(title:  "VanGogh"),
    .init(title:  "WaitingfortheBarbarian"),
]
