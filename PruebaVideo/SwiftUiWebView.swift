//
//  SwiftUiWebView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import WebKit

struct SwiftUiWebView : UIViewRepresentable {
    
    let pagina1 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/OnBoarding?op=101"
    let pagina2 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/ControllerOnBoardingPF"
    let pagina3 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/onBoardingSVPF"
    
    var url: URL
    //var finishedLoading: Binding<Bool>
    
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
            let url = webView.url!.absoluteString
            print("Done Loading pagina \(url)")
            
            
        }
    }
    
    
}
