//
//  BlurEffect.swift
//  MusicApp
//
//  Created by GuoGuo on 0 3/24.
//

import Foundation
import SwiftUI
//import UIKit

struct Blur: UIViewRepresentable {
    
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
