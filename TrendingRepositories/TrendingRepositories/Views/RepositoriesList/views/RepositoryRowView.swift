//
//  RepositoryRowView.swift
//  TrendingRepositories
//
//  Created by Piotr Wesołowski on 13/02/2023.
//

import SwiftUI

struct RepositoryRawView: View {
    let repository: Repository
    let isExpanded: Bool
    
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
    }
    
    private var content: some View {
        if #available(iOS 15.0, *) {
            return  VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: repository.owner.avatar)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 50, maxHeight: 50)
                                    .clipShape(Circle())
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text(repository.owner.login)
                            .bold()
                            .font(.title2)
                            .lineLimit(1)
                            .frame(alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(repository.name)
                            .font(.headline)
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                }
                .frame(height: 70)
                
                if isExpanded {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(repository.description)
                                .multilineTextAlignment(.leading)
                                .frame(height: 50)
                                .lineLimit(nil)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text(repository.language ?? .empty)
                                    .modifier(DescriptionCard(color: .green))
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(String(repository.stars))
                                    .modifier(DescriptionCard(color: .yellow))
                            }
                        }
                    }
                    .padding(.leading, 58)
                }
            }
            .modifier(RowCard(isExpanded: isExpanded))
        } else {
            return VStack {
                HStack {
                    VStack {
                        Image(uiImage: repository.owner.avatar.load())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 50, maxHeight: 50)
                            .clipShape(Circle())
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text(repository.owner.login)
                            .bold()
                            .font(.system(size: 13))
                            .lineLimit(1)
                            .frame(alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(repository.name)
                            .font(.headline)
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                    Spacer()
                }
                .frame(height: 70)
                
                if isExpanded {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(repository.description)
                                .multilineTextAlignment(.leading)
                                .frame(height: 50)
                                .lineLimit(nil)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                Text(repository.language ?? .empty)
                                    .modifier(DescriptionCard(color: .green))
                            }
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(String(repository.stars))
                                    .modifier(DescriptionCard(color: .yellow))
                            }
                        }
                    }
                    .padding(.leading, 58)
                }
            }
            .modifier(RowCard(isExpanded: isExpanded))
        }
    }
}

struct RepositoryRawViewView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRawView(
            repository: Repository.example,
            isExpanded: true
        )
    }
}
