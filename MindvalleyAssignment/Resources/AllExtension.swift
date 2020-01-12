//
//  AllExtension.swift
//  MindvalleyAssignment
//
//  Created by ds-mayur on 1/11/20.
//  Copyright © 2020 Mayur Rathod. All rights reserved.
//

import UIKit

extension UIImage {
    func scale(to newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIScrollView {
    
    func isReachToBottom() -> Bool {
        return  contentOffset.y > (contentSize.height - frame.height)
    }
}

