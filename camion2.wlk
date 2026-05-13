import cosas2.*
object camion {
    const cosasCargadas = []
    

    method peso() {
        return 1000 + cosasCargadas.sum({c => c.peso()})
    }
    method cargarCosas(unaCosa) {
      cosasCargadas.add(unaCosa)
      unaCosa.consecuenciaDeLaCarga()
    }
    method descargarCosas(unaCosa) {
      cosasCargadas.remove(unaCosa)
    }
    method cargarVariasCosas(listaDeCosas) {
      cosasCargadas.addAll(listaDeCosas)
    }

    method todosLosPesosSonPares(){
        return cosasCargadas.all({c => c.peso().even()})
    }
    
    method hayAlgunaCargaQuePese(peso){
        return cosasCargadas.any({c => c.peso() == peso})
    }

    method primeraCosaCargadaConPeligrosidadDe(peligrosidad){
        return cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == peligrosidad}, 
        "no hay cosa")
    }
    method cosasQueSuperanPeligrosidad(peligrosidad) {
        return cosasCargadas.filter({c => c.nivelDePeligrosidad() > peligrosidad})
    } 
    method cosasCargadasQueSuperanPeligrosidadDeCosa(unaCosa) {
        return self.cosasQueSuperanPeligrosidad(unaCosa.nivelDePeligrosidad())
    } 

    method estaExcedidoDePeso() {
        return self.peso() > 2500
    } 

    method puedeCircularEnRuta(peligrosidadMaxima) {
    return !self.estaExcedidoDePeso() and self.cosasQueSuperanPeligrosidad(peligrosidadMaxima).isEmpty()
    } 
    method algunaCargaPesaEntre(min, max){
        return cosasCargadas.any({c => c.peso().between(min, max)})
    }
    method cosaMasPesadaDelCamion(){
        cosasCargadas.max({c => c.peso()})
    }


}