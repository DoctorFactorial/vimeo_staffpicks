//
//  SearchViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 17/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view.
        
        
        var searchImageView = UIImageView(frame: CGRectMake(0,0,50, self.searchTextField!.frame.size.height))
        searchImageView.image = UIImage(named: "SearchDarkIcon")
        searchImageView.contentMode = .Center
        
        self.searchTextField!.leftView = searchImageView
        self.searchTextField!.leftViewMode = .Always
    }
    
    // NOTE: Desgin / Dev conflict - Default not to have back button within tabs
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)
    }
    
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.searchTextField?.becomeFirstResponder()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == self.searchTextField)
        {
            self.searchTextField?.resignFirstResponder()
            self.search()
        }
        return true
    }
    

    func search() {
        var searchRequest = self.searchTextField?.text
        
        if (searchRequest?.isEmpty == true)
        {
            //alert the user
            self.showAlert("Searching the abyss..? Try giving us more to go on ;-)")
            
            return
        }
    }
    
    
}
