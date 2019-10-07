import UIKit


struct Pelicula{
    
}

struct Sala{
    var horarios: [Horario]
    var tipo: String
}

struct Horario{
    var periodo: String
    var cupo: Int
    var precio: Double
}



struct Cartelera{
    var pelicula: [Pelicula]
}

