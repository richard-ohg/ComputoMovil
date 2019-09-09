import UIKit

// FizzBuz

//func fizzBuzz(start: Int, end: Int){
//    if start % 3 == 0 && start % 5 == 0 {
//        print("FizzBuzz")
//    }else if start % 3 == 0{
//        print("Fizz")
//    }else if start % 5 == 0{
//        print("Buzz")
//    }else{
//        print(start)
//    }
//
//    if start < end {
//        fizzBuzz(start: start+1, end: end)
//    }
//}

func fizzBuzz2(n: Int){
    if n == 0 {
        return
    }
    fizzBuzz2(n: n-1)
    if n % 15 == 0 {
        print("FizzBuzz")
    }else if n % 3 == 0{
        print("Fizz")
    }else if n % 5 == 0{
        print("Buzz")
    }else{
        print(n)
    }
}

//fizzBuzz(start: 1, end: 15)
fizzBuzz2(n: 15)

// Factorial

func factorial(n: Int ) -> Int{
    if n == 1 {
        return 1
    }else{
        return n * factorial(n: n-1)
    }
}

for x in 1...8 {
    print(factorial(n: x))
}


// Sucesion de Fibonacci

func fibonacci(n: Int) -> Int{
    if n <= 1 {
        return n
    }else{
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}

for x in 0...15 {
    print(fibonacci(n: x), terminator: " ")
}


class Prueba{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func editParam(new: String){
        self.name = new
    }
}




