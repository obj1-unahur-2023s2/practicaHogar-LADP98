class Persona {
	const property edad
	var property tieneHabilidadesDeCocina
	var habitacionDondeEsta = null
	
	method habitacionDondeEsta() = habitacionDondeEsta
	
	method entrar(habitacion) {
		if (not habitacion.puedeEntrar(self)) {
			self.error("Donde vas amigo??")
		}
		habitacion.ingresar(self)
		habitacionDondeEsta = habitacion
	}	
	
	method nivelConfortTotal(casa) = casa.habitaciones().sum { hab => hab.confort(self) }
	method seSienteAGusto(casa, familia)
}


class Obsesive inherits Persona {
	override method seSienteAGusto(casa, familia) {
		return casa.habitaciones().any { hab => hab.puedeEntrar(self) }
		and casa.habitaciones().all { hab => hab.ocupantes().size() <= 2 }
	}
}

class Golose inherits Persona {
	override method seSienteAGusto(casa, familia) {
		return casa.habitaciones().any { hab => hab.puedeEntrar(self) }
		and casa.habitaciones().any {hab => hab.hayAlgunCocinere()}
	}
}

class Sencille inherits Persona {
	override method seSienteAGusto(casa, familia) {
		return casa.habitaciones().any { hab => hab.puedeEntrar(self) }
		and casa.habitaciones().size() > familia.integrantes().size()
	}
}