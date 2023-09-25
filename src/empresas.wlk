import profesionales.*
import solicitantes.*

class Empresa{
	const profesionales = #{}
	var property honorarioReferencia = 0
	const clientes = #{}
	
	method contratar(p){
		profesionales.add(p)
	}
	method cantProfesionalesEstudiadosEn(universidad) = profesionales.count({x=>x.universidad() == universidad})
	method profesionalesCaros() = profesionales.filter({x=>x.honorariosPorHora() > honorarioReferencia})
	method universidadesFormadoras() = profesionales.map({x=>x.universidad()}).asSet()
	method profesionalMasBarato() = profesionales.min({x=>x.honorariosPorHora()})
	method genteAcotada() = profesionales.all({x=>x.provinciasDondePuedeTrabajar().size() <= 3})
	
	method puedeSatisfacerA(solicitante) = profesionales.any({x=>solicitante.puedeAtenderloUnProfesional(x)})
	
	method darServicio(solicitante){ 
		if (not self.puedeSatisfacerA(solicitante)) 
		self.error("No puede dar el servicio")
		const profesionalQueAtiende = profesionales.filter({p=>solicitante.puedeAtenderloUnProfesional(p)}).anyOne()
		profesionalQueAtiende.cobrar(profesionalQueAtiende.honorariosPorHora())
		clientes.add(solicitante)		
	}
}	

