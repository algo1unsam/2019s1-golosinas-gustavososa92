import golosinas.*

object mariano {

	var golosinas = #{}
	var golosinasDeseadas = #{}
	var gustosDeseados = #{}

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

	method agregarGustosDeseados(sabores) {
		gustosDeseados.addAll(sabores)
	}

	method agregarGolosinasDeseadas(candy) {
		golosinasDeseadas.addAll(candy)
	}

	method golosinasDeseadas() = golosinasDeseadas

	method gustosDeseados() = gustosDeseados

/*
 * Además, se deben contemplar dos situaciones relacionadas con Juliana, la pareja actual de Mariano.

 *     Juliana critica a Mariano, pero siempre que puede le quita alguna golosina si es de las que a ella le gusta, y se enoja por las que faltan.
 *     Lograr que a Mariano se le pueda preguntar golosinasFaltantes(golosinasDeseadas) , donde golosinasDeseadas es una colección de golosinas. Debe devolver las golosinas que están entre las golosinasDeseadas, y que Mariano no compró.
 *     A veces Juliana tiene antojos por gustos gustos especiales.
 *     Lograr que a Mariano se le pueda preguntar gustosFaltantes(gustosDeseados), que es una consulta similar a la anterior, pero donde gustosDeseados es una colección de gustos.
 *     Debe devolver los gustos que están entre los gustosDeseados, y que no están cubiertos por ninguna golosina de las que tiene Mariano.
 */
}

