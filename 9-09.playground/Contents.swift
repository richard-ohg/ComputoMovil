import UIKit

// Closure
var a = {
    (s,x) in
    print(s,x)
}

a(5,6)


func realizaOperacion(a: Int, b: Int, funcion: (Int, Int)->Int){
    let resultado = funcion(a,b)
    print(resultado)
}
