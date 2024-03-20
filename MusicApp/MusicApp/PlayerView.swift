//
//  PlayerView.swift
//  MusicApp
//
//  Created by GuoGuo on 03/24.
//

import Foundation
import SwiftUI

struct PlayerView : View {
    var album : Album
    var song : Song
    
    @State var isPlaying : Bool = false
    var body : some View {
        ZStack {
            Image(album.image).resizable().edgesIgnoringSafeArea(.all)
            Blur(style: .light).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AlbumArt(album: album, isWithText: false)
                Text(song.name).font(.title).fontWeight(.medium).foregroundColor(.white)
                Spacer()
                ZStack {
                    Color.clear.cornerRadius(15).shadow(radius: 10)
                    
                    HStack {
                        Button(action: self.previous, label: {
                            Image(systemName: "arrow.left.circle").resizable()
                        }).frame(width: 50, height: 50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                        Button(action: self.playPause, label: {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                        }).frame(width: 70, height: 70, alignment: .center).padding()
                        Button(action: self.next, label: {
                            Image(systemName: "arrow.right.circle").resizable()
                        }).frame(width: 50, height: 50, alignment: .center).foregroundColor(Color.black.opacity(0.2))
                    }
                }.edgesIgnoringSafeArea(.bottom).frame(height: 200, alignment: .center)
            }
        }
    }
    func playPause() {
        self.isPlaying.toggle()
    }
    
    func next() {
        
    }
    
    func previous() {
        
    }
    
}

