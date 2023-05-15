//
//  UserProfile.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email : String
   let explicit_content: [String: Bool]
    let external_urls: [String: String]
    //let followers: [String:Codable?]
    let id: String
    let product: String
    let images: [UserImage]
    
}
struct UserImage: Codable {
    let url: String
}


/**
 
 
 {
     country = TR;
     "display_name" = zeynepDeveloper;
     email = "zeynmirdeveloper@gmail.com";
     "explicit_content" =     {
         "filter_enabled" = 0;
         "filter_locked" = 0;
     };
     "external_urls" =     {
         spotify = "https://open.spotify.com/user/316uy4ynarfk3jihe7q2mpzvyw7u";
     };
     followers =     {
         href = "<null>";
         total = 0;
     };
     href = "https://api.spotify.com/v1/users/316uy4ynarfk3jihe7q2mpzvyw7u";
     id = 316uy4ynarfk3jihe7q2mpzvyw7u;
     images =     (
     );
     product = free;
     type = user;
     uri = "spotify:user:316uy4ynarfk3jihe7q2mpzvyw7u";
 }

 */
