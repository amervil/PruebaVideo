//
//  SwiftUiWebView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import WebKit

struct SwiftUiWebView : UIViewRepresentable {
    
  var url: URL
  var finishedLoading: Binding<Bool>
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.load(URLRequest(url: url))
        return view
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        webView.load(request)
    }
    
    func makeCoordinator() -> SwiftUiWebView.Coordinator {
            Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: SwiftUiWebView
        
        init(_ parent: SwiftUiWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if (webView.isLoading) {
               return
            }
            print("Done Loading")
//            finishedLoading.wrappedValue = true
        }
    }
    
    
}
