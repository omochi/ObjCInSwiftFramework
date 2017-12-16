//
//  ViewController.swift
//  IconvUserApp
//
//  Created by omochimetaru on 2017/12/16.
//  Copyright © 2017年 omochimetaru. All rights reserved.
//

import UIKit
import IconvSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = Data.init(bytes: [0x82, 0xA0]) // SJIS で "あ"
        let str = NSString.init(byDefaultEncodingWith: data)
        print(str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

