//
//  ContentView.swift
//  MusicApp
//
//  Created by GuoGuo on 03/24.
//

import SwiftUI
import SwiftData

struct Album : Hashable {
    var id = UUID()
    var name : String
    var image : String
    var  songs : [Song]
}

struct Song : Hashable {
    var id = UUID()
    var name : String
    var time :  String
}
struct ContentView: View {
    
    var albums = [Album(name: "Album 1", image: "1", songs: [Song(name: "Spring Day", time: "4:34"),
                                                             Song(name: "yes, and?", time: "3:35"),
                                                             Song(name: "Spring Rain", time: "4:19"),
                                                             Song(name: "Last Friday Night", time: "3:50")]),
                  Album(name: "Album 2", image: "5", songs: [Song(name: "Cruel Summer", time: "2:58"),
                                                             Song(name: "Umbrella", time: "4:35"),
                                                             Song(name: "Water Fountain", time: "3:38"),
                                                             Song(name: "Dynamite", time: "3:19")]),
                  Album(name: "Album 3", image: "9", songs: [Song(name: "Autumn Leaves", time: "4:27"),
                                                             Song(name: "Mona Lisa", time: "3:06"),
                                                             Song(name: "Pump It Up", time: "2:30"),
                                                             Song(name: "Castle on the Hill", time: "4:21")]),
                  Album(name: "Album 4", image: "13", songs: [Song(name: "Winter Bear", time: "2:54"),
                                                              Song(name: "Snow On The Beach", time: "4:16"),
                                                              Song(name: "Crystal Snow", time: "5:43"),
                                                              Song(name: "Winter Things", time: "2:38")])]
    @State private var currentAlbum : Album?
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content:{
                    LazyHStack {
                        ForEach(self.albums, id : \.self, content: {
                            album in
                            AlbumArt(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                })
                LazyVStack {
                    ForEach((self.currentAlbum?.songs ?? self.albums.first?.songs) ?? [Song(name: "Song 1", time: "2:36"),
                                                                                       Song(name: "Song 2", time: "2:36"),
                                                                                       Song(name: "Song 3 ", time: "2:36")],
                            id: \.self,
                            content: {
                        song in
                        Songcell(album: currentAlbum ?? albums.first!, song: song)
                    })
                }
            }.navigationTitle("For the Season")
        }
    }
}
    struct AlbumArt : View {
        var album : Album
        var isWithText : Bool
        var body : some View {
            ZStack (alignment: .bottom, content: {
                Image(album.image).resizable().aspectRatio(contentMode: .fill).frame(width: 170, height: 200, alignment: .center)
                if isWithText == true {
                    ZStack {
                        Blur(style: .light)
                        Text(album.name).foregroundColor(.white)
                    }.frame(height: 60, alignment: .center)
                }
            }).frame(width: 170, height: 200, alignment: .center).clipped().cornerRadius(15).shadow(radius: 10).padding(20)
        }
    }
    struct Songcell : View {
        var album : Album
        var song : Song
        var body : some View {
            NavigationLink(
                destination: PlayerView(album: album, song: song),
                label: {
                    HStack {
                        ZStack {
                            Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.green)
                            Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.yellow)
                        }
                        Text(song.name).bold()
                        Spacer()
                        Text(song.time)
                    }.padding(20)
            }).buttonStyle(PlainButtonStyle())
        }
    }


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
