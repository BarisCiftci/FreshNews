//
//  ArticleRowView.swift
//  FreshNews
//
//  Created by Baris Ciftci on 10/01/2023.
//

import SwiftUI

struct ArticleRowView: View {
    
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: article.imageURL){
                phase in
                switch phase {
                case.empty:
                    ProgressView()
                    
                case.success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case.failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                        
                    
                   
                @unknown default:
                    fatalError()
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
                HStack {
                    Text("Puplished at: \(article.publishedAt)")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    },
                           label: {
                        Image(systemName: "bookmark")
                    })
                    
                    
                    Button(action: {
                        
                    },
                           label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    
                    
                }
                .buttonStyle(.bordered)
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ArticleRowView(article: .previewData[0])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
}
