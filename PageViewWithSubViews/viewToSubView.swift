//
//  viewToSubView.swift
//  PageViewWithSubViews
//
//  Created by Ketul Patani on 01/01/15.
//  Copyright (c) 2015 Ketul Patani. All rights reserved.
//

import UIKit

class viewToSubView: UIViewController {

    @IBOutlet var label: UILabel!
    var number = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = String(number)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
