//
//  AuthViewController.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//

import UIKit
import WebKit
class AuthViewController: UIViewController ,WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    // kullanıcı oturum açıp kapattıktan sonra geri dönmek istediğinde bir kimlik doğrulama sürecinden geçer ve böylece başarılı bir şekilde bittiğini bilir. bu yüzden buraya bir değişken eklendi. temelde bir boolen döndüren kapanış olacak.
    
    public var completionHandler: ((Bool) -> Void)?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        guard let url = AuthManager.shared.signInURL else {
            return
        }
        // spotify giriş sayfası açıldı
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        //exchange the codefor access token
    
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name == "code"})?.value else {
            return
        }
       webView.isHidden = true
        
        print("Code: \(code)")
        //kullanıcıdan sorgu parametresi olan kodu aldık. sonra auth manager işlevi oluşturmaya başladık.
        AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popToRootViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
        
    }
    

   
}
