//
//  ViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: - See if data was stored in coreData successfully.
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

