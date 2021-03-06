import golosinas.*

object mariano {

	var golosinas = #{}

	/*esto es por si quiero guardar los conjuntos dentro de mariano (no hacia falta)
	 * var golosinasDeseadas = #{}
	 * var gustosDeseados = #{}
	 * method agregarGustosDeseados(sabores) {
	 * 	gustosDeseados.addAll(sabores)
	 * }

	 * method agregarGolosinasDeseadas(candy) {
	 * 	golosinasDeseadas.addAll(candy)
	 * }

	 * method golosinasDeseadas() = golosinasDeseadas

	 method gustosDeseados() = gustosDeseados*/
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	method comprar(golosina) {
		/*comprar(unaGolosina) : agrega una golosina a la bolsa de golosinas compradas. */
		golosinas.add(golosina)
	}

	method desechar(golosina) {
		/*desechar(unaGolosina) : desecha la golosina escogida de la bolsa de golosinas. */
		golosinas.remove(golosina)
	}

	method desecharBolsa() {
		golosinas.clear()
	}

	method golosinas() = golosinas

	method probarGolosinas() {
		/*probarGolosinas() : le da un mordisco a todas las golosinas dentro de la bolsa de golosinas compradas. */
		golosinas.forEach({ golosina => golosina.mordisco()})
	}

	method hayGolosinaSinTACC() {
		/*hayGolosinaSinTACC() : indica si hay al menos una golosina sin gluten en la bolsa de golosinas compradas. */
		return golosinas.any({ golosina => golosina.libreGluten() })
	}

	method preciosCuidados() {
		/*preciosCuidados() : indica si todas las golosinas compradas tienen un precio menor o igual a 10 pesos. */
		return golosinas.all({ golosina => golosina.precio() <= 10 })
	}

	method golosinaDeSabor(unSabor) {
		/*golosinaDeSabor(unSabor) : devuelve la primer golosina que encuentra en la bolsa del sabor escogido. */
		return golosinas.find({ golosina => golosina.gusto() == unSabor })
	}

	method golosinasDeSabor(unSabor) {
		/*golosinasDeSabor(unSabor) : devuelve las golosinas que encuentre dentro de la bolsa del sabor escogido. */
		return golosinas.filter({ golosina => golosina.gusto() == unSabor })
	}

	method sabores() {
		/*sabores() : que devuelve los sabores de las golosinas de la bolsa, idealmente sin repetidos. */
		return golosinas.map({ golosina => golosina.gusto() }).asSet()
	}

	method golosinaMasCara() {
		/*golosinaMasCara() : devuelve la golosina mas cara en la bolsa de golosinas compradas. */
		return golosinas.max({ golosina => golosina.precio() })
	}

	method pesoGolosinas() {
		/*pesoGolosinas() : devuelve el peso de la bolsa de golosinas compradas, o sea, la suma del peso de cada golosina. */
		return golosinas.sum({ golosina => golosina.peso() })
	}

	method golosinasFaltantes(golosinasDeseadas) {
		/*Lograr que a Mariano se le pueda preguntar golosinasFaltantes(golosinasDeseadas) , donde golosinasDeseadas es una colección de golosinas.
		 * Debe devolver las golosinas que están entre las golosinasDeseadas, y que Mariano no compró.
		 */
		return golosinasDeseadas.difference(golosinas)
	}

	method gustosFaltantes(gustosDeseados) {
		/*Lograr que a Mariano se le pueda preguntar gustosFaltantes(gustosDeseados), que es una consulta similar a la anterior,
		 * pero donde gustosDeseados es una colección de gustos.
		 *     Debe devolver los gustos que están entre los gustosDeseados, y que no están cubiertos por ninguna golosina de las que tiene Mariano.
		 */
		return gustosDeseados.difference(self.sabores())
	}

}

