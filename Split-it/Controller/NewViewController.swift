//
//  NewViewController.swift
//  Split-it
//
//  Created by Wilson Zhang on 6/7/18.
//  Copyright © 2018 Zheng Zhang. All rights reserved.
//

import UIKit
import PopupKit

class NewViewController: UIViewController {
    
    let popupKit = PopupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        popupKit.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func popupKitSetUp () {
        
    }

}
