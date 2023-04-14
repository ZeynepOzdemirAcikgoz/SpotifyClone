//
//  WelcomeViewController.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let singInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sing In With Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(singInButton)
        singInButton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        singInButton.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom, width: view.width-40, height: 50)
    }
    
    
    
    @objc func didTapSingIn(){
        let vc = AuthViewController()
        // kullanıcının başarılı bir şekilde oturum açtığını söyleyecek
        
        vc.completionHandler = {[weak self] success in
            DispatchQueue.main.async {
                self?.handleSingIn(success: success)
            }
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    private func handleSingIn(success: Bool) {
        // kullanıcı oturumu açılacak
        
        
        
        
    }
}
