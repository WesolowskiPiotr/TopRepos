//
//  RepositoriesDisplayListView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

struct RepositoriesDisplayListView: View {
    @ObservedObject var store: RepositoriesStore
    @State private var selection: Set<Repository> = []
    var repositories = [IdentifiableRepository]()
    var presenter: RepositoriesListPresenter
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ScrollView {
                ForEach(repositories) { item in
                    RepositoryRawView(repository: item.repository, isExpanded: self.selection.contains(item.repository))
                        .offset(x: self.selection.contains(item.repository) ? 0 : 0, y: self.selection.contains(item.repository) ? 0 : 0)
                        .onTapGesture { self.selectDeselect(item.repository) }
                        .modifier(ListRowModifier())
                        .animation(.linear(duration: 0.3))
                }
            }
            .refreshable {
                Task {
                    store.state = .loading
                    await presenter.fetchRepositories()
                }
            }
            .navigationTitle("Repositories-List-Title")
        } else {
            ScrollView {
                ForEach(repositories) { item in
                    RepositoryRawView(repository: item.repository, isExpanded: self.selection.contains(item.repository))
                        .offset(x: self.selection.contains(item.repository) ? 0 : 0, y: self.selection.contains(item.repository) ? 0 : 0)
                        .onTapGesture { self.selectDeselect(item.repository) }
                        .modifier(ListRowModifier())
                        .animation(.linear(duration: 0.3))
                }
            }
            .navigationBarItems(trailing: Button {
                Task {
                    store.state = .loading
                    await presenter.fetchRepositories()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
                    .foregroundColor(.green)
            })
            .navigationBarTitle("Repositories-List-Title")
        }
    }
    
    func selectDeselect(_ repository: Repository) {
        if selection.contains(repository) {
            selection.remove(repository)
        } else {
            selection.insert(repository)
        }
    }
}

struct RepositoriesDisplayListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesDisplayListView(
            store: RepositoriesStore(),
            presenter: RepositoriesListPresenter(
                service: FetchRepositoryService(
                    requestManager: RequestManager()
                )
            )
        )
    }
}
