//
//  UIViewController+Extensions.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 17/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

import Foundation

extension UIViewController
    
{
    
    func showAlert(message: String)
        
    {
        
        self.showAlert("Uh Oh!", message: message)
        
    }
    
    func showAlert(title: String, message: String)
        
    {
        
        var alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
}