class Persona {
	var property edad
	var property tieneHabCocina
	var property pudoEntrar = false
	var property habitacionActual
	var property habitacionPrevia
	var property nivelDeConfort
	
	method aprenderHabilidadesDeCocina(){
		self.tieneHabCocina(true)
	}
	
	method entrarEn(habitacion) = habitacion.agregarOcupante(self)
	
	method seSienteAGusto(casa,familia)
}

class Obsesivo inherits Persona{
	override method seSienteAGusto(casa,familia) = self.pudoEntrar()
	and casa.habitaciones().all({h => h.ocupantesActuales().size() <= 2})
}

class Goloso inherits Persona{
	override method seSienteAGusto(casa,familia) = self.pudoEntrar() and 
	familia.integrantes().any({i => i.tieneHabCocina()})	
}

class Sencillo inherits Persona{
	override method seSienteAGusto(casa,familia) = self.pudoEntrar() and
	casa.habitaciones().size() > familia.integrantes().size() 
}
