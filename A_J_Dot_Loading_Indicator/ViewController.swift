//
//  ViewController.swift
//  A_J_Dot_Loading_Indicator
//
//  Created by Alex Jiang on 13/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.aj_showDotLoadingIndicator()
    }

    @IBAction func stop(_ sender: UIButton) {
        view.aj_hideDotLoadingIndicator()
    }
}
