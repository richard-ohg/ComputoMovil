//
//  ViewController.swift
//  Calculator
//
//  Created by 2020-1 on 9/4/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func numbers(_ sender: UIButton) {
        print(sender.tag)
        
        switch sender.tag{
        case 10:
            resultado.text = resultado.text! +  " / "
            break;
        case 11:
            resultado.text = resultado.text! +  " x "
            break;
        case 12:
            resultado.text = resultado.text! +  " + "
            break;
        case 13:
            resultado.text = resultado.text! +  " - "
            break;
        case 14:
            resultado.text = resultado.text! +  " = "
            break;
        default:
            resultado.text = resultado.text! +  "\(sender.tag)"
        }

        
    }
    
    
    
}

