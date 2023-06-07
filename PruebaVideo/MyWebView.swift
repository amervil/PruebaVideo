//
//  MyWebView.swift
//  PruebaVideoId
//
//  Created by Americo Villalva on 6/7/23.
//


import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
