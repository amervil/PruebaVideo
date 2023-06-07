//
//  ContentView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @State private var urlFinal: String = ""
    
    let pagina1 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/OnBoarding?op=101"
//    let pagina1 = "https://www.apple.com"
    
    var body: some View {
        ZStack {
            SwiftUiWebView(url: URL(string: pagina1)!, urlFinal: $urlFinal)
            
            if urlFinal != "" {
                SFSafariViewWrapper(url: URL(string: urlFinal)!)
            }
        }
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
