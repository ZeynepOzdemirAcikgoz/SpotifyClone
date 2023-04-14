//
//  Extensions.swift
//  SpotifyClone
//
//  Created by Zeynep Özdemir Açıkgöz on 14.04.2023.
//


import Foundation
import UIKit

extension UIView{
    
    var width: CGFloat{
        return frame.size.width
        
    }
    
    var height: CGFloat{
        return frame.size.height
        
    }
    
    var left: CGFloat{
        return frame.origin.x
        
    }
    var rigt: CGFloat{
        return left + width
        
    }
    var top: CGFloat{
        return frame.origin.y
        
    }
    var bottom: CGFloat{
        return top + height
        
    }
    
    
    
}

