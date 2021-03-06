object bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = (peso * 0.8 - 1).max(0) }
	method gusto() { return frutilla }
	method libreGluten() { return true }
}

object alfajor {
	var peso = 300
	
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso *= 0.8 }
	method gusto() { return chocolate }
	method libreGluten() { return false }
}

object caramelo {
var peso = 5
	
	method precio() { return 1 }
	method peso() { return peso }
	method mordisco() { peso =(peso-  1).max(0) }
	method gusto() { return frutilla }
	method libreGluten() { return true }
}

object chupetin {
	var peso = 7
	
	method precio() { return 2 }
	method peso() { return peso }
	method mordisco() { if (not self.pesoMenosDe2Gramos()) peso*=0.9}
	method gusto() { return naranja }
	method libreGluten() { return true }
	method pesoMenosDe2Gramos()=peso<2
}

object oblea {
	var peso = 250
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { if (self.pesoMasDe70Gramos()) peso*=0.5 else peso*=0.75}
	method gusto() { return vainilla }
	method libreGluten() { return false }
	method pesoMasDe70Gramos()=peso>70
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method precio() { return 0.5*pesoInicial }
	method peso() { return pesoActual }
	method mordisco() { pesoActual-=2}
	method gusto() { return chocolate }
	method libreGluten() { return false }	
}

object golosinaBaniada {
	var golosinaInterior=bombon
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio()+2 }
	method peso() { return golosinaInterior.peso()+pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() { return golosinaInterior.libreGluten()}	
	}

object tuttifrutti {
	var peso=5
	var property libreGluten=false
	var gusto=frutilla
	
	method peso()=peso
	method gusto()=gusto
	method precio(){return if (self.libreGluten()) 7 else 10}
	method mordisco(){self.cambiarSabor()}
	method cambiarSabor(){gusto=gusto.siguiente()}

}

object frutilla{
	method siguiente()=chocolate
}
object chocolate{
	method siguiente()=naranja
}
object naranja{
	method siguiente()=frutilla
}
object vainilla{
	method siguiente()=self
}




