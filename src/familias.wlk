class Familia {
	var property integrantes = #{}
	var property casaActual
	
	method nivelDeConfortDeFamilia() = integrantes.sum({i => i.nivelDeConfort()}) / integrantes.size()

	method estaAGusto() = self.nivelDeConfortDeFamilia() > 40 and 
	integrantes.all({i => i.seSienteAGusto(casaActual, self)})
}
