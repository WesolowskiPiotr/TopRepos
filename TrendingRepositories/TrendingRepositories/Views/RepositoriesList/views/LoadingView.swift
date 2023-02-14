//
//  LoadingView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI
import Shimmer

struct LoadingView: View {
    var body: some View {
        if #available(iOS 14.0, *) {
            List {
                ForEach((1...10), id: \.self) {_ in
                    HStack {
                        VStack {
                            Circle()
                                .fill(.gray.opacity(0.4))
                                .frame(width: 40, height: 40)
                        }
                        VStack(alignment: .leading) {
                            Text("Top placeholder")
                                .lineLimit(1)
                            Text("Bottom longer text placeholder")
                                .lineLimit(1)
                        }
                    }
                    .redacted(reason: .placeholder)
                    .padding()
                    .shimmering()
                }
            }
            .navigationTitle("Repositories-List-Title")
        } else {
            List {
                ForEach((1...10), id: \.self) {_ in
                    HStack {
                        VStack {
                            Circle()
                                .fill(.gray.opacity(0.4))
                                .frame(width: 40, height: 40)
                        }
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: 150, height: 20)
                                .foregroundColor(.gray.opacity(0.5))
                            Rectangle()
                                .frame(width: 250, height: 20)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                    }
                    .padding()
                    .shimmering()
                }
            }
            .navigationBarTitle("Repositories-List-Title")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
