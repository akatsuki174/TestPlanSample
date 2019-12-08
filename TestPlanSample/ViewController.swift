//
//  ViewController.swift
//  TestPlanSample
//
//  Created by Akatsuki on 2019/12/08.
//  Copyright © 2019 akatsuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = NSLocalizedString("Top_title_label", comment: "")
    }


}

