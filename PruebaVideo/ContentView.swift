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
    @State private var webViewFinishedLoading = false
    
    let url = URL(string: "https://www.sede.fnmt.gob.es/certificados/persona-fisica/obtener-certificado-video-identificacion")!
    
    var body: some View {
        SwiftUiWebView(url: url, finishedLoading: $webViewFinishedLoading)
               
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
