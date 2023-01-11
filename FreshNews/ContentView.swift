//
//  ContentView.swift
//  FreshNews
//
//  Created by Baris Ciftci on 29/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ArticleListView(articles: Article.previewData)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
