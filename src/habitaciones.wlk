class Habitacion{
	const property huespedesDeLaHabitacion = []
	const property ocupantesActuales = []
	
	method nivelDeConfortPara(persona) = 10
	
	method agregarOcupante(persona) 
	
	method estaOcupada() = not(ocupantesActuales.isEmpty())
	
	method ocupanteMasViejo() = ocupantesActuales.max({o => o.edad()})
}

class UsoGeneral inherits Habitacion{
	override method agregarOcupante(persona){
		persona.habitacionPrevia().ocupantesActuales().remove(persona)
		persona.pudoEntrar(true)
		persona.habitacionPrevia(self)
		persona.habitacionActual(self)
		ocupantesActuales.add(persona)
		
	}
}

class Banio inherits Habitacion{
	override method nivelDeConfortPara(persona) = if(persona.edad() <= 4) super(persona) + 2 
	else super(persona) + 4	
	
	override method agregarOcupante(persona){
		if(ocupantesActuales.isEmpty() or (ocupantesActuales.any({o => o.edad() <= 4}))){
			 persona.habitacionPrevia().ocupantesActuales().remove(persona)
			 persona.pudoEntrar(true)
			 persona.habitacionPrevia(self)
			 persona.habitacionActual(self)
			 ocupantesActuales.add(persona)
		}
	}
}

class Dormitorio inherits Habitacion{
	override method nivelDeConfortPara(persona) = if(huespedesDeLaHabitacion.contains(persona)) 
	super(persona) + (10 / huespedesDeLaHabitacion.size()) else super(persona)
	
	override method agregarOcupante(persona){
		if(ocupantesActuales.isEmpty() or huespedesDeLaHabitacion.contains(persona) or 
			self.todosLosOcupantesSonHuesped()){
			persona.habitacionPrevia().ocupantesActuales().remove(persona)
			persona.pudoEntrar(true)
			persona.habitacionPrevia(self)
			persona.habitacionActual(self)
			ocupantesActuales.add(persona)
		}		
	}
	
	method todosLosOcupantesSonHuesped() = self.huespedesDeLaHabitacion().asSet() == 
	self.ocupantesActuales().asSet()
	
}

class Cocina inherits Habitacion{
	var property cantM2
	
	override method nivelDeConfortPara(persona) = if(persona.tieneHabCocina()) super(persona) + 
	((cantM2 * porcentajeCocina.porcentaje())/100) else super(persona)
	
	override method agregarOcupante(persona){
		if(ocupantesActuales.isEmpty() or (persona.tieneHabCocina() and 
			not (ocupantesActuales.any({o => o.tieneHabCocina()})))){
				persona.habitacionPrevia().ocupantesActuales().remove(persona)
				persona.pudoEntrar(true)
				persona.habitacionPrevia(self)
				persona.habitacionActual(self)
				ocupantesActuales.add(persona)
			}
	}			
}

object porcentajeCocina{
	var property porcentaje //Definir al inicializar, el porcentaje que se desee	
}

