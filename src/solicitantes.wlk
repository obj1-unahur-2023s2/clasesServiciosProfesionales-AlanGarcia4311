import profesionales.*

class Personas {
	var property provincia
	method puedeAtenderloUnProfesional(profesional) = profesional.provinciasDondePuedeTrabajar().contains(provincia)
}

class Instituciones {
	const universidades = #{}
	method puedeAtenderloUnProfesional(profesional) = universidades.contains(profesional.universidad())
}

class Clubes {
	const provincias = #{}
	method puedeAtenderloUnProfesional(profesional) = not provincias.intersection(profesional.provinciasDondePuedeTrabajar()).isEmpty()
}
