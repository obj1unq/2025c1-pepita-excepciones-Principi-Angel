object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		if (! self.puedeVolar(distancia)){
			self.error("sin nafta")
		 }	
		 energia = energia - 10 - 2*distancia
	}

	method puedeVolar(distancia){
		return energia >= self.energiaQueSeGasta(distancia)
	}

	method energiaQueSeGasta(distancia) {
		return 10 + 2*distancia
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	var ultimaCena = manzana

	method energia() {
		return energia
	}
	
	method comer(comida) {	
		if (comida == ultimaCena){
			self.error("es lo último que comí, quiero otra cosa")
		}
		energia += comida.energiaQueAporta() / 2
		ultimaCena = comida
	}
		
	method volar(distancia) {
		if (! self.puedeVolar(distancia)){
			self.error("no puedo, no tengo energía suficiente")
		 }	
		energia = energia - 20 - 2*distancia
	}

	method puedeVolar(distancia){
		return energia >= self.energiaQueSeGasta(distancia)
	}

	method energiaQueSeGasta(distancia) {
		return 20 + 2*distancia
	}
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}

	method cenas(){
		return cenas
	}
}


object milena {
  var aves = [pepita, pepon]
  	
  method movilizar(distancia){
	aves.volar(distancia)
  }
}

// 
// self.error("...")
// Receta excepción
// method name(){
// 	self.validar...(...)
//  <lógica de negocio>
// }
// assert.equals 
// assert.that
// assert.notThat
// assert.throwsExceptions({loquefalla})