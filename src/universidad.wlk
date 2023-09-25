class Universidad{
	var property provincia
	var property honorariosRecomendados
	var donacionesTotales 
	
	method donacionesTotales() = donacionesTotales
	method recibirDonacion(dinero) { donacionesTotales += dinero }
	method provinciaDondeEsta() = provincia
	method honorariosPorHora() = honorariosRecomendados
}

object asociacionDelLitoral{
	var donacionesTotales 
	
	method recibirDonacion(dinero) { donacionesTotales += dinero }
}