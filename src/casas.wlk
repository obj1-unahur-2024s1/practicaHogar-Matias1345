class Casa{
	var property habitaciones = #{}
	
	method habitacionesOcupadas() = habitaciones.filter({h => h.estaOcupada()})
	
	method responsablesDeLaCasa() = habitaciones.map({h => h.ocupanteMasViejo()}).asSet()
}
