//
//  EmptyListView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

struct EmptyListView: View {
    
    var body: some View {
        if #available(iOS 14.0, *) {
            List {}
            .navigationTitle("Repositories-List-Title")
        } else {
            List {}
            .navigationBarTitle("Repositories-List-Title")
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
