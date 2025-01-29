//
//  ViewController.swift
//  EdplexLite
//
//  Created by MEHUL MODHVADIYA on 03/08/23.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate,UIWebViewDelegate, WKUIDelegate,UIScrollViewDelegate {
    
    // UIWKWebView Method
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var webview: WKWebView!
    private var zoomScale: CGFloat? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.webview.frame = self.view.frame
        self.activity.isHidden = false
        self.activity.startAnimating()
        self.webview.navigationDelegate = self
        self.webview.uiDelegate = self
        self.webview.sizeToFit()
        //self.webview.scrollView.delegate = self
        if let url = URL(string: "https://edplex.skool360.com/") {
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webview?.load(request)
            }
        }
    }
}
extension ViewController {
    func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
        print("WebView content loaded.")
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Failed Request")
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "logHandler" {
            print("LOG: \(message.body)")
        }
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.activity.isHidden = true
            self.activity.stopAnimating()
        }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if (navigationAction.navigationType == .linkActivated){
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
    }
}
