//
//  ViewController.swift
//  PathsAndShapes
//
//  Created by Лилия Левина on 30/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myArrow: MyArrow!

    override func viewDidLoad() {
        super.viewDidLoad()
        myArrow = MyArrow()
        myArrow.frame = CGRect(x: 100, y: 200, width: 120, height: 100)
        self.view.addSubview(myArrow)
        myArrow.setNeedsDisplay()
    }


}

