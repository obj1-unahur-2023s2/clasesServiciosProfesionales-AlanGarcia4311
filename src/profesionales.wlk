class ProfesionalAsociado {
	var property universidad

	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
}


class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = [universidad.provinciaDondeEsta()]
	
	method honorariosPorHora() = universidad.honorariosPorHora()
	
}

class ProfesionalLibre {
	var property universidad
	var property provinciasDondePuedeTrabajar
	var property honorariosRecomendados
}

class Universidad{
	var property provincia = "Santa Fe"
	var property honorariosRecomendados = 0
	
	method provinciaDondeEsta() = provincia
	method honorariosPorHora() = honorariosRecomendados
}

class Empresa{
	const profesionales = []
	var property honorarioReferencia
	
	method contratar(p){
		profesionales.add(p)
	}
	method cantProfesionalesEstudiadosEn(universidad) = profesionales.filter({x=>x.universidad() == universidad}).size()
	method profesionalesCaros() = profesionales.filter({x=>x.honorariosPorHora() > honorarioReferencia})
	method universidadesFormadoras() = profesionales.map({x=>x.universidad()})
	method profesionalMasBarato() = profesionales.min({x=>x.honorariosPorHora()})
	method genteAcotada() = profesionales.all({x=>x.provinciasDondePuedeTrabajar().size() <= 3})
}