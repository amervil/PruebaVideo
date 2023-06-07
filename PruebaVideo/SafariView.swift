//
//  SafariView.swift
//  PruebaVideo
//
//  Created by Americo Villalva on 6/7/23.
//

import SwiftUI
import SafariServices



struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}
