import universidad.*

class ProfesionalAsociado {
	var property universidad

	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(importe) = universidad.recibirDonacion(importe/2)
}


class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = #{universidad.provinciaDondeEsta()}
	
	method honorariosPorHora() = universidad.honorariosPorHora()
	
	method cobrar(importe) { asociacionDelLitoral.recibirDonacion(importe) }
}

class ProfesionalLibre {
	var property universidad
	const provinciasDondePuedeTrabajar = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method agregarProvincia(unaProvincia) = provinciasDondePuedeTrabajar.add(unaProvincia)
	method quitarProvincia(unaProvincia) = provinciasDondePuedeTrabajar.remove(unaProvincia)
	method provinciasDondePuedeTrabajar() = provinciasDondePuedeTrabajar
	
	
	method cobrar(importe) { totalRecaudado += importe }
	method pasarDinero(profesional, dinero) { 
		if (totalRecaudado < dinero) 
		self.error("El profesional no tiene dinero sufiente") 
		else { totalRecaudado -= dinero
			profesional.cobrar(dinero) }
	}
}