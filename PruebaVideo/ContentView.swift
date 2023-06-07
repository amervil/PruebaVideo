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
    
    //let pagina1 = "https://apus20.cert.fnmt.es/InterconexionOnboarding/OnBoarding?op=101"
    let pagina1 = "https://www.apple.com"
    
    var body: some View {
        SwiftUiWebView(url: URL(string: pagina1)!)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
