import habitaciones.*
import personas.*

class Casa {
	var property habitaciones = #{}		
	
	method habitacionesOcupadas() = habitaciones.filter { hab => hab.estaOcupada() }
	
	method responsables() = self.habitacionesOcupadas().map { hab => hab.ocupanteMasViejo() }
	
	method agregarHabitaciones(hab) {habitaciones.addAll(hab)}
}


class Familia {
	var property integrantes = #{}
	var property casaDondeVive
	
	method nivelConfortPromedio() { 
		return integrantes.sum { int => int.nivelConfortTotal(casaDondeVive) } / integrantes.size()
	}
	
	method estaAGusto() {
		return self.nivelConfortPromedio() > 40
			and integrantes.all { pers => pers.seSienteAGusto(casaDondeVive, self) }
	}
	
	method agregarIntegrante(persona) {integrantes.add(persona)}
	method agregarIntegrantes(variasPersonas) {integrantes.addAll(variasPersonas)}
}