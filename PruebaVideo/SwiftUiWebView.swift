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
    
    private static let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:83.0) Gecko/20100101 Firefox/83.0"
    
    var url: URL
    @Binding var urlFinal: String
    //var finishedLoading: Binding<Bool>
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.customUserAgent = Self.userAgent
        
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
        var parent: SwiftUiWebView
        
        init(_ parent: SwiftUiWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if (webView.isLoading) {
               return
            }
            let url = webView.url!.absoluteString
            print("Done Loading pagina \(url)")
            
            if url == self.parent.pagina1 {
                
                let codigo_solicitud = "204948965"
                let dni = "09203257Z"
                let primer_apellido = "CELA"
                let telefono = "662699020"
                
                
                webView.evaluateJavaScript("document.querySelector(\"#codSolicitud\").value=\"" + codigo_solicitud + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#nif\").value=\"" + dni + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#apellido1\").value=\"" + primer_apellido + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#telefono\").value=\"" + telefono + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#telefono_confirmacion\").value=\"" + telefono + "\";") { (result, error) in }
                
                webView.evaluateJavaScript("document.querySelector(\"#aceptarCondiciones\").checked=true;") { (result, error) in }
                webView.evaluateJavaScript("condicionesLeidas=true;") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#pEnviarForm > input\").click()") { (result, error) in }
                
                
            }
            if url == self.parent.pagina2 {
                
                let sms = "123456"
                
                
                webView.evaluateJavaScript("document.querySelector(\"#codVerificacion\").value=\"" + sms + "\";") { (result, error) in }
                //webView.evaluateJavaScript("document.querySelector(\"#botonEnviarFormulario\").click();") { (result, error) in }
                
                
            }
            if url == self.parent.pagina3 {
                
                webView.evaluateJavaScript("document.querySelector(\"#xpressid-iframe\").src") { (result, error) in

                    print(result!)
                    
                    webView.load(URLRequest(url: URL(string: result as! String)!))
                    
                }
                
                            
            }
            
            if url.contains("https://xpressid.eu.veri-das.com/?access_token=") {
                
                webView.evaluateJavaScript("dataFromParent.mobileQrParams.qk") { (result, error) in
                    
                    let token = result as! String
                    
                    let url_final = "https://apus20.cert.fnmt.es/InterconexionOnboarding/ControllerOnBoardingMobile?op=101&qk=\(token)"
                    
                    print(url_final)
                    
                    self.parent.urlFinal = url_final
                    
                }
                
            }

        }
    }
    
    
}
