//
//  VideoTip.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 27/11/21.
//
/**
 Extrae vídeos de youtube
 */
import SwiftUI
import WebKit

struct VideoTip: UIViewRepresentable{
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://youtube.com/embed/\(videoID)")
        else{
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
