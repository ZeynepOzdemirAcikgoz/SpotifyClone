//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//

import Foundation
final class AuthManager {
    static let shared = AuthManager()
    struct Constants{
        
        static let clientID = "b000981ecf184f14aa35a908edf4161e"
        static let clientSecret = "f7a46287e6a84533ae97c43a75abe257"
        static var tokenAPIURL = "https://accounts.spotify.com/api/token"
        
    }
    
    private init() {}
    
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.iosacademy.io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        //eşit değilse kullanıcı oturum açmıştır
        return false
    }
    private var accessToken: String? {
        return nil
    }
    private var refreshToken: String? {
        return nil
    }
    private var tokenExpirationDate: Date? {
        
        return nil
    }
    
    private var shouldRefreshToken: Bool{
       return false
    }
    
    public func exchangeCodeForToken(
        code: String, completion: @escaping((Bool) -> Void )){
            // get Token
            guard let url = URL(string: Constants.tokenAPIURL) else {
                return
            }
            var components = URLComponents()
            components.queryItems = [ URLQueryItem(name: "grant_type", value: "authorization_code"),
                                      URLQueryItem(name: "code", value: code),
                                      URLQueryItem(name: "redirect_uri", value: "https://www.iosacademy.io"),
            ]
            
            
            var request = URLRequest(url: url)
            request.httpMethod =  "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = components.query?.data(using: .utf8)
            let basicToken = Constants.clientID+":"+Constants.clientSecret
            let data = basicToken.data(using: .utf8)
            guard let base64String = data?.base64EncodedString() else {
                print("Failure to get base64")
                completion(false)
                return
            }
            
            request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                guard let data = data, error == nil else{
                    completion(false)
                    return
                }
                do {
                    
                    
                    let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments)
                    print("SUCCESS:\(json)")
                  
                    
                   
                    completion(true)
                    
                } catch {
                    print(error.localizedDescription)
                    completion(false)
                    
                }
            }
            task.resume()
            
        }
    
    
    
    public func refrehAccessToken(){
        
    }
    private func cacheToken(){
        
    }
    
    
}
        
