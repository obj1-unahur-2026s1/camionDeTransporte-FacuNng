import camion2.*
object nightRider {
    method bulto() = 1
    method peso(){
        return 500
    }
    method nivelDePeligrosidad(){
        return 10
    }
    method consecuenciaDeLaCarga(){

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
    method bulto() = 2 
    method consecuenciaDeLaCarga() {
        formaActual = robot
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
    method bulto(){
        return if(cantidadDeLadrillos <= 100) {
            1
        } else if(cantidadDeLadrillos.between(101, 300)){
            2
        } else 3
    }
    method consecuenciaDeLaCarga(){
        cantidadDeLadrillos += 12
    }
}

object arenaAGraner{
    var property peso = 150

    method nivelDePeligrosidad(){
        return 1
    }
    method bulto() = 1
    method consecuenciaDeLaCarga(){
        peso = (peso-10).max(0)
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
    method bulto(){
        return if(estaConMisiles) 2 else 1
    }
    method consecuenciaDeLaCarga(){
        estaConMisiles = true
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
    method bulto(){
        return 1 + self.bultoDeCosasContenidas()
    }
    method bultoDeCosasContenidas() = cosasContenidas.sum({c => c.bulto()}) 
    method consecuenciaDeLaCarga(){
        cosasContenidas.forEach({c => c.consecuenciaDeLaCarga()})
    }
}

object residuos {
    var property peso = 10

    method NivelDePeligrosidad(){
        return 200
    }
    method bulto() = 1
    method consecuenciaDeLaCarga(){
        peso =+ 15
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
    method bulto() = 2 
    method consecuenciaDeLaCarga(){

    }
}

