//
//  ViewController.swift
//  08
//
//  Created by Ricardo Hernandez D4 on 8/19/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var caja: UITextField!
    
    @IBOutlet weak var etiqueta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 1...1000 {
            print(factorial(n: Double(x)))
        }
    }

    func factorial(n: Double) -> Double{
    // Recursiva
        
//        if n <= 1 {
//            return 1
//        }else{
//            return n * factorial(n: n-1)
//        }
        
    // Lineal
        var result: Double = 1
        for x in 1...Int(n) {
            result *= Double(x)
        }
        return result
    }
    
    func esPrimo(n: Double) -> Bool{
// Teorema de Wilson
//        return Double((factorial(n: n-1) + 1)) % n == 0
        return true
    }
    
    @IBAction func aceptar(_ sender: UIButton){

        if let valor = caja.text{
            print("valor: \(valor)")
            if let numero = Double(valor){
                if esPrimo(n: numero){
                    etiqueta.text = "Es primo"
                }else{
                    etiqueta.text = "No es primo"
                }
                print(numero)
            }else{
                print("No es un numero")
            }
        }else{
            print("Es un nulo")
        }

    }
    
}

