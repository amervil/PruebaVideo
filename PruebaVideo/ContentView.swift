//
//  ContentView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import CoreData
import WebKit

struct ContentView: View {
    @State private var isPresentWebView = false
    @State private var webViewFinishedLoading1 = false
    @State private var webViewFinishedLoading2 = false
    @State private var webViewFinishedLoading3 = false
    
    let pagina1 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/OnBoarding?op=101"
    let pagina2 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/ControllerOnBoardingPF"
    let pagina3 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/onBoardingSVPF"
    
    var webPages: [URL] {
        let url1 = URL(string: pagina1)!
        let url2 = URL(string: pagina2)!
        let url3 = URL(string: pagina3)!
        return [url1, url2, url3]
    }
    
    var body: some View {
        ZStack {
            SwiftUiWebView(url: webPages[0], finishedLoading: $webViewFinishedLoading1)
            
            if webViewFinishedLoading1 {
                SwiftUiWebView(url: webPages[1], finishedLoading: $webViewFinishedLoading2)
            }
            
            if webViewFinishedLoading2 {
                SwiftUiWebView(url: webPages[2], finishedLoading: $webViewFinishedLoading3)
            }
            
        }
        
               
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
