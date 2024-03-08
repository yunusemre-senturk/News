//
//  DetailViewController.swift
//  news
//
//  Created by Yunus Emre Şentürk on 5.03.2024.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate{
    var webUrl: String = ""
    @IBOutlet weak var webDisplay: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webDisplay.navigationDelegate = self
        let url = URL(string: webUrl)!
        print(webUrl)
        webDisplay.load(URLRequest(url: url))

        webDisplay.allowsBackForwardNavigationGestures = true
    }
    // WKNavigationDelegate metodları
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("Web sayfası yüklenmeye başladı")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Web sayfası yüklenme tamamlandı")
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Web sayfası yüklenirken hata oluştu: \(error.localizedDescription)")
        }
}
