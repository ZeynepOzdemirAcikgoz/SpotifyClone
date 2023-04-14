//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//

import Foundation



struct AuthReponse: Codable {
    
    let access_token: String
    let expires_in: Int
    let refresh_token:String?
    let scope: String
    let token_type:String
    
    
}


/*
 
 {
     "access_token" = "BQBmaDjnk6rsnJzGYcOWCD-OspCEO-PZsZMmJZcJzU13OMWnSCzcn4vwACPYbovN_BCE95DilNB8FCB9NUHVk3uPZ7-W1Mf3GxfDSlth-M7z7XeAEcJFIULf7dNoGIWY_mZ1F2nVRTguKa6W3xI0pq7WiOZq45nGwNvnfrLeDpqdaaCXq9w2WG4PpCovSuJUHkrS0X9-dCG5IEYv63Hn";
     "expires_in" = 3600;
     "refresh_token" = "AQDfTZe_jQS0PSKHKTQrgwA0u2XDW5fuonLgpWHgINO8M2w-j86_uB1fIOwpAfJUJLBpG3ZuWJpPxH69oKEFiDr7Et9TU31f4T--8XObiB99SKqZm1m3KXc3g6rf4XTwLJg";
     scope = "user-read-private";
     "token_type" = Bearer;
 }
 */
