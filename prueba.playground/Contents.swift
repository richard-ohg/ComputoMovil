import UIKit

func suma(_ a: Int, b: Int) -> Int{
    return a + b
}

func imprimeResultado(_ function: (Int, Int)->Int, _ a: Int, _ b: Int){
    let resultado = function(a, b)
    print(resultado)
}

imprimeResultado(suma, 4, 2)
//suma(1,2)

