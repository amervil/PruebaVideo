//
//  ContentView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isPresentWebView = false
    
    let url = URL(string: "https://www.sede.fnmt.gob.es/certificados/persona-fisica/obtener-certificado-video-identificacion")
    
    var body: some View {
        Button("FNMT") {
            isPresentWebView.toggle()

        }
        .sheet(isPresented: $isPresentWebView) {
            MyWebView(url: url!)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
