//
//  ErrorView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

struct ErrorView: View {
    var fetchRepositories: () async -> Void
    
    var body: some View {
        if #available(iOS 15.0, *) {
            List {
                VStack(alignment: .center) {
                    Spacer()
                    LottieView(lottieFile: "ErrorAnimation")
                        .frame(
                            minWidth: 300,
                            maxWidth: .infinity,
                            minHeight: 300,
                            maxHeight: .infinity,
                            alignment: .center
                          )
                        .padding()
                    Text("Empty-Repositories-List-Message")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Empty-Repositories-List-Submessage")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(5)
                    Spacer()
                        .frame(height: 50)
                    Button("Fetch-Repositories-Again") {
                        Task {
                            await fetchRepositories()
                        }
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(.green)
                    .font(.title2)
                    .border(.green)
                    Spacer()
                }
            }
            .navigationTitle("Repositories-List-Title")
        } else {
            List {
                VStack(alignment: .center) {
                    Spacer()
                    LottieView(lottieFile: "ErrorAnimation")
                        .frame(
                            minWidth: 300,
                            maxWidth: .infinity,
                            minHeight: 300,
                            maxHeight: .infinity,
                            alignment: .center
                          )
                        .padding()
                    Text("Empty-Repositories-List-Message")
                        .font(.system(size: 16, weight: .bold))
                    Text("Empty-Repositories-List-Submessage")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(5)
                    Spacer()
                    Button("Fetch-Repositories-Again") {
                        Task {
                            await fetchRepositories()
                        }
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(.green)
                    .font(.system(size: 16, weight: .bold))
                    .border(.green)
                    Spacer()
                }
            }
            .navigationBarTitle("Repositories-List-Title")
        }
    }
}
