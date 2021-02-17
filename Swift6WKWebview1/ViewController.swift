//
//  ViewController.swift
//  Swift6WKWebview1
//
//  Created by 藤岡正哉 on 2021/02/17.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolbar.frame.size.height)
        
//        addSubvewはViewに今作ったwebViewwを載せるという事になる
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
//        URLをロードする
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        indicator.layer.zPosition = 2
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        
        webView.goForward()
    }
    
}

