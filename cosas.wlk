object nightRider {
    method peso(){
        return 500
    }
    method nivelDePeligrosidad(){
        return 10
    }
}
object bumblebee{
    var formaActual = auto
    method cambiarForma(nuevaForma) {
      formaActual = nuevaForma
    }
    method peso(){
        return 800
    }
    method nivelDePeligrosidad(){
        return formaActual.nivel()
    }
}
object auto{method nivel() = 15 }
object robot{method nivel() = 30}

object paqueteDeLadrillos{
    var cantidadDeLadrillos = 3
    
    method cambiarCantidadLadrillos(cantidad){
        cantidadDeLadrillos = cantidad
    }
    method peso(){
        return 2 * cantidadDeLadrillos
    }
    method nivelDePeligrosidad(){
        return 2
    }
}

object arenaAGraner{
    var property peso = 10

    method nivelDePeligrosidad(){
        return 1
    }
}

object bateriaAntiaerea{
    var estaConMisiles = true
    

    method peso(){
        return if(estaConMisiles) 300 else 200
    }
    method nivelDePeligrosidad(){
        return if(estaConMisiles) 100 else 0
    }
    method cargarYDescargarMisiles() {
      estaConMisiles = !estaConMisiles
    }
}

object contenedor {
    var cosasContenidas = []
    

    method peso(){
        return 100 + self.cosasContenidas()
    }
    method nivelDePeligrosidad(){
        return if(not cosasContenidas.isEmpty())self.cosaContenidaMasPeligrosa().nivelDePeligrosidad() else 0
    }
    method cosasContenidas(){
        return cosasContenidas.sum({c => c.peso()})
    }
    method cosaContenidaMasPeligrosa(){
        return cosasContenidas.max({c => c.nivelDePeligrosidad()})
    }
    method meterElementos(listaDeElementos) {
        cosasContenidas.addAll(listaDeElementos)
    } 
}

object residuos {
    var property peso = 10

    method NivelDePeligrosidad(){
        return 200
    }
}

object embalaje{
    var cosaQueEnvuelve = residuos

    method cambiarEmbalaje(nuevaCosa) {
      cosaQueEnvuelve = nuevaCosa
    }
    method peso(){
        return cosaQueEnvuelve.peso()
    }
    method nivelDePeligrosidad(){
        cosaQueEnvuelve.nivelDePeligrosidad() / 2
    }
}

