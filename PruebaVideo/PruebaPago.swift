//
//  PruebaPago.swift
//  PruebaVideo
//
//  Created by Gonzalo Rodriguez on 7/6/23.
//

//
//  SwiftUiWebView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import WebKit


struct PruebaPago : UIViewRepresentable {
    
    let solicitud = "https://apus20.cert.fnmt.es/DescargaCertificados/preDescarga.do?APPID=DESCARGA_CERT&IDCA=PF1&TIPOCERT=F&"   //solicitud
    let validacion = "https://apus20.cert.fnmt.es/DescargaCertificados/validarDescarga.do"    //marcin
    let paserela_pago = "https://secure.ogone.com/Ncol/Prod/orderstandard_UTF8.asp"   //mostrar webview
    let pago_realizado = "https://apus20.cert.fnmt.es/DescargaCertificados/pagoCert.do"   //marcin
    
    
    private static let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:83.0) Gecko/20100101 Firefox/83.0"
    
    var url: URL
    @Binding var urlFinal: String
    //var finishedLoading: Binding<Bool>
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.customUserAgent = Self.userAgent
        
        view.navigationDelegate = context.coordinator
        view.load(URLRequest(url: URL(string: solicitud)!))
        return view
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        webView.load(request)
    }
    
    func makeCoordinator() -> PruebaPago.Coordinator {
            Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: PruebaPago
        
        init(_ parent: PruebaPago) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if (webView.isLoading) {
               return
            }
            let url = webView.url!.absoluteString
            print("Done Loading pagina \(url)")
            
            if (url == self.parent.solicitud) {
                
                let userIdNumber = "30672734A"
                let userSurname = "MAGUREGUI"
                let userRequestCode = "015682825"
                
                
                webView.evaluateJavaScript("document.getElementById('NIF_SG').value=\"" + userIdNumber + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.getElementById('APELLIDO1_SG').value=\"" + userSurname + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.getElementById('COD_SOLICITUD').value=\"" + userRequestCode + "\";") { (result, error) in }
                webView.evaluateJavaScript("document.querySelector(\"#aceptarCondiciones\").checked=1;") { (result, error) in }
                webView.evaluateJavaScript("enviarFormulario(boolHmac);") { (result, error) in }
                
                webView.evaluateJavaScript("") { (result, error) in }
                webView.evaluateJavaScript("") { (result, error) in }
                webView.evaluateJavaScript("") { (result, error) in }
                
                
            }
            
            if (url.contains("https://apus20.cert.fnmt.es/pasarela-fnmt/pasarelaFNMT/shoppingBasket?idSolicitud=")){
                
                
                webView.evaluateJavaScript("continueToTPV.click()") { (result, error) in }
            }
            
            if (url == self.parent.validacion) {
                
                // ir a marcin
                
                print("el tio ha pagado previamente")
                
            }
            if (url == self.parent.paserela_pago) {
                
                // mostrar webview para pagar DESPATAR WEBVIEW
                
            }
            if (url == self.parent.pago_realizado) {
                
                // ir a marcin
                
                print("el tio acaba de pagar")
                
            }
            
            
        }
    }
}
