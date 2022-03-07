import wollok.game.*
import personajes.*
import nivel1.*
import nivel2.*

class Bloque {
	var property position 
	
	method image() = "bloque.png"
	
	method colision() = true
	
	method accion() {}
	
	method recogerlo() {}
	
	method ubicarAleatoriamente(elemento) {
		const posicion = new Position(x = 0.randomUpTo(game.width() - 1).truncate(0), y = 0.randomUpTo(game.height() - 1).truncate(0))
		if (game.getObjectsIn(posicion).isEmpty()) {
			elemento.position(posicion)			
		} 
		else {
			self.ubicarAleatoriamente(elemento)
		}
	}
}

class Pared inherits Bloque {
	override method image() = "pared1.png"
	
	override method accion() {
		throw new Exception(message = "No se pueden empujar las paredes.")
	}
}

class Potenciador inherits Bloque {
	const energias = 10.randomUpTo(25).truncate(0)
	
	override method accion(){	
		personajeSimple.energizar(energias)
		game.removeVisual(self)
	}
	
	override method colision() = false
	override method image() = "potenciador.png"
}

class Llave inherits Bloque {
	override method image() = "llave.png"
	
	override method accion(){
		personajeSimple.acumular()
		game.removeVisual(self)
	}
	override method colision() = false
}

class DineroChiquito inherits Bloque {
	const property dineroQueDa = 5
	
	override method image() = "dineroPoco.png"
	
	override method accion(){
		personajeSimple.enriquecer(dineroQueDa)
		game.removeVisual(self)
	}
	override method colision() = false
}

class DineroGrande inherits Bloque {
	const property dineroQueDa = 10
	
	override method image() = "dineroMucho.png"
	
	override method accion(){
		personajeSimple.enriquecer(dineroQueDa)
		game.removeVisual(self)
	}
	override method colision() = false
}

class NukaCola inherits Potenciador {
	override method colision() = true
	override method image() = "nuka.png"
	override method accion() {
		throw new Exception(message = "No se pueden empujar las gaseosas.")
	}
	override method recogerlo() {
		personajeSimple.energizar(energias)
		game.removeVisual(self)
	}	
}

class Meta inherits Bloque {

	override method image() = "marcaMeta.png"

	override method accion() {}

	override method colision() = false
}


class Caja inherits Bloque {
	const property meta = #{}
	var property cajas = #{}
	
	override method accion() {
	if (personajeSimple.direccion() == arriba) {
		self.hayLugarLibre(personajeSimple.direccion())
		self.irArriba()
	}
	if (personajeSimple.direccion() == abajo) {
		self.hayLugarLibre(personajeSimple.direccion())
		self.irAbajo()
	}
	if (personajeSimple.direccion() == izquierda) {
		self.hayLugarLibre(personajeSimple.direccion())
		self.irIzquierda()
	}
	if (personajeSimple.direccion() == derecha) {
		self.hayLugarLibre(personajeSimple.direccion())
		self.irDerecha()
		}
	}
	
	method irArriba() {
        if (not (self.position().y() == game.height() - 1)) {
            self.position(self.position().up(1))
        } else {
            self.position(new Position(x = self.position().x(), y = 0))
        }
        nivelBloques.comprobarVictoria(self.cajas())
    }

    method irAbajo() {
        if (not (self.position().y() == 0)) {
            self.position(self.position().down(1))
        } else {
            self.position(new Position(x = self.position().x(), y = game.height()-1))
        }
        nivelBloques.comprobarVictoria(self.cajas())
    }

    method irDerecha() {
        if (not (self.position().x() == game.width() - 1)) {
            self.position(self.position().right(1))
        } else {
            self.position(new Position(x = 0, y = self.position().y()))
        }
        nivelBloques.comprobarVictoria(self.cajas())
    }

    method irIzquierda() {
        if (not (self.position().x() == 0)) {
            self.position(self.position().left(1))
        } else {
            self.position(new Position(x = game.width()-1 , y = self.position().y()))
        }
        nivelBloques.comprobarVictoria(self.cajas())
    }

	method hayLugarLibre(direccion) {
		const lugarLibre = game.getObjectsIn(direccion.siguiente(position)).all{ obj => not obj.colision() }
		if (not lugarLibre) {
			throw new Exception(message = "No hay lugar para empujar la caja.")
		}
	}

	method estaEnPosicion() {
		return meta.map({ elemento => elemento.position()}).contains(self.position())
	}
	
	override method image() {
		if (self.estaEnPosicion())  return "cajacolocada.png"
	    return "caja.png"
	}
}

class MarcadorLlave inherits Bloque {
	override method image() = "llave.png"
}

class MarcadorDecenaLlave inherits MarcadorVida {
	override method image() = "ml0.png"
}

class MarcadorUnidadLlave inherits MarcadorVida {
	override method image() {
		if (personajeSimple.llaves() == 0) {
			return "ml0.png"
		}
		if (personajeSimple.llaves() == 1) {
			return "ml1.png"
		}
		if (personajeSimple.llaves() == 2) {
			return "ml2.png"
		}
		else {
			return "ml3.png"
		}
	}
}

class MarcadorDinero inherits Bloque {
	override method image() = "marcadorDinero.png"
}

class MarcadorDecenaDinero inherits Bloque {
	override method image() {
		if (personajeSimple.dinero() > 49) {
			return "mp5.png"
		}
		if (personajeSimple.dinero() > 39 and personajeSimple.dinero()  < 50) {
			return "mp4.png"
		}
		if (personajeSimple.dinero() > 29 and personajeSimple.dinero()  < 40) {
			return "mp3.png"
		}
		if (personajeSimple.dinero() > 19 and personajeSimple.dinero()  < 30) {
			return "mp2.png"
		}
		if (personajeSimple.dinero() > 9 and personajeSimple.dinero()  < 20) {
			return "mp1.png"
		}
		else {
			return "mp0.png"
		}
	}
}

class MarcadorUnidadDinero inherits Bloque {
	override method image() {
		if (personajeSimple.dinero()%10 == 9) {
			return "mp9.png"
		}
		if (personajeSimple.dinero()%10 == 8) {
			return "mp8.png"
		}
		if (personajeSimple.dinero()%10 == 7) {
			return "mp7.png"
		}
		if (personajeSimple.dinero()%10 == 6) {
			return "mp6.png"
		}
		if (personajeSimple.dinero()%10 == 5) {
			return "mp5.png"
		}
		if (personajeSimple.dinero()%10 == 4) {
			return "mp4.png"
		}
		if (personajeSimple.dinero()%10 == 3) {
			return "mp3.png"
		}
		if (personajeSimple.dinero()%10 == 2) {
			return "mp2.png"
		}
		if (personajeSimple.dinero()%10 == 1) {
			return "mp1.png"
		}
		else {
			return "mp0.png"
		}
	}
}

class MarcadorVida inherits Bloque {
	override method image() = "marcadorVida.png"
}
	
class MarcadorEnergia inherits Bloque {
	override method image() = "marcadorEnergia.png"
}
	
class MarcadorDecena inherits Bloque {
	override method image() {
		if (personajeSimple.energia() > 49) {
			return "md5.png"
		}
		if (personajeSimple.energia() > 39 and personajeSimple.energia() < 50) {
			return "md4.png"
		}
		if (personajeSimple.energia() > 29 and personajeSimple.energia() < 40) {
			return "md3.png"
		}
		if (personajeSimple.energia() > 19 and personajeSimple.energia() < 30) {
			return "md2.png"
		}
		if (personajeSimple.energia() > 9 and personajeSimple.energia() < 20) {
			return "md1.png"
		}
		else {
			return "md0.png"
		}
	}
}

class MarcadorUnidad inherits Bloque {
	override method image() {
		return "md" + personajeSimple.energia()%10 + ".png"
	}
}

class MarcadorUnidadVida inherits Bloque {
	override method image() {
		if (personajeSimple.salud()%10 == 9) {
			return "mu9.png"
		}
		if (personajeSimple.salud()%10 == 8) {
			return "mu8.png"
		}
		if (personajeSimple.salud()%10 == 7) {
			return "mu7.png"
		}
		if (personajeSimple.salud()%10 == 6) {
			return "mu6.png"
		}
		if (personajeSimple.salud()%10 == 5) {
			return "mu5.png"
		}
		if (personajeSimple.salud()%10 == 4) {
			return "mu4.png"
		}
		if (personajeSimple.salud()%10 == 3) {
			return "mu3.png"
		}
		if (personajeSimple.salud()%10 == 2) {
			return "mu2.png"
		}
		if (personajeSimple.salud()%10 == 1) {
			return "mu1.png"
		}
		else {
			return "mu0.png"
		}
	}
}

class MarcadorDecenaVida inherits Bloque {
	override method image() {
		if (personajeSimple.salud() > 49) {
			return "mu5.png"
		}
		if (personajeSimple.salud() > 39 and personajeSimple.energia() < 50) {
			return "mu4.png"
		}
		if (personajeSimple.salud() > 29 and personajeSimple.energia() < 40) {
			return "mu3.png"
		}
		if (personajeSimple.salud() > 19 and personajeSimple.energia() < 30) {
			return "mu2.png"
		}
		if (personajeSimple.salud() > 9 and personajeSimple.energia() < 20) {
			return "mu1.png"
		}
		else {
			return "mu0.png"
		}
	}
}

class CeldaEspecial inherits Bloque {
	override method colision() = false
	override method image() = "incognita.png"
}

class CeldaEspecialMasEnergia inherits CeldaEspecial {
	override method accion() {
		personajeSimple.energizar(30)
		game.removeVisual(self)
	}
}

class CeldaEspecialMenosEnergia inherits CeldaEspecial {
	override method accion() {
		personajeSimple.desenergizar(15)
		game.removeVisual(self)
	}
}

class CeldaEspecialTP inherits CeldaEspecial {
	override method accion() {
		self.ubicarAleatoriamente(personajeSimple)
		game.removeVisual(self)
	}
}

class Enemigo inherits Bloque {
	const property danio = 15
	
	override method image() = "enemigo1.png"
	
	override method accion(){
		personajeSimple.daniar(danio)
		game.removeVisual(self)
	}
	override method colision() = false
}

class Botiquin inherits Bloque {
	const cura = 25.randomUpTo(35).truncate(0)
	
	override method accion(){	
		personajeSimple.curar(cura)
		game.removeVisual(self)
	}
	
	override method colision() = false
	override method image() = "botiquin.png"
}

class Roca inherits Bloque {
	override method image() = "roca1.png"
	
	override method accion() {
		personajeSimple.retrocede()
	}
}

class Arbusto inherits Bloque {
	override method image() = "arbusto1.png"
	
	override method accion() {
		personajeSimple.retrocede()
	}
}

class Puerta inherits Bloque {
	override method image() = "puerta.png"
	
	override method accion() {
		nivelLlaves.ganar()
	}
}