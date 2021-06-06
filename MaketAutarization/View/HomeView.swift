//
//  HomeView.swift
//  MaketAutarization
//
//  Created by user on 05.06.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @StateObject var movieObgact = MovieObgact()
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bookmark")
                Spacer()
                Text("Social").font(.title)
                Spacer()
                Image(systemName: "bell")
            }.padding()
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack{
//                ForEach(0...15, id: \.self)
//                { _ in
//                    Image("Glogo")
//                        .resizable()
//                        .frame(width: 75, height: 74, alignment: .center)
//                }
                    ForEach(movieObgact.posters, id: \.self) {poster in
                        WebImage(url: URL (string: "http://cinema.areas.su/up/images/\(poster)"))
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    }
                }
            })
            Spacer()
        }
        .onAppear {
            movieObgact.getMovies()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
