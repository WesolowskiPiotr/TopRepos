//
//  RowCard.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import Foundation
import SwiftUI

struct RowCard: ViewModifier {
    let isExpanded: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(height: isExpanded ? 120 : 70)
            .padding(24)
    }
}
