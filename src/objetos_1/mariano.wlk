object mariano {

	var golosinas = #{}

	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	method comprar(golosina) {
		golosinas.add(golosina)
	}

	method desechar(golosina) {
		golosinas.remove(golosina)
	}
	method golosinas()=golosinas

	method probarGolosinas() { 
		golosinas.forEach({golosina=>golosina.mordisco()})
	}
	method hayGolosinaSinTACC(){
		return golosinas.count {golosina=>golosina.libreGluten() }	>0}

}

