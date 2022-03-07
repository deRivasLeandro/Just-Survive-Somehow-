import wollok.game.*
import nivel1.*

// en la implementaciÃ³n real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo mÃ¡s complejo que solamente
// imagen y posiciÃ³n


object izquierda {
    //agregar logica pac man acá
	method siguiente(position) = position.left(1)

	method opuesto() = derecha

}

object derecha {

	method siguiente(position) = position.right(1)

	method opuesto() = izquierda

}

object abajo {

	method siguiente(position) = position.down(1)

	method opuesto() = arriba

}

object arriba {

	method siguiente(position) = position.up(1)

	method opuesto() = abajo

}

class Personaje {

	var property position = game.at(1, 1)
	var property direccion = abajo

	method irArriba() {
		direccion = arriba
		if (self.position().y() < game.height()-1) {
			self.avanzar()
		}
		else {
			self.position(new Position(x = self.position().x(), y = 0))
		}
	}

	method irAbajo() {
		direccion = abajo
		if (self.position().y() > 0) {
			self.avanzar()
		}
		else {
			self.position(new Position(x = self.position().x(), y = game.height()-1))
		}
	}

	method irIzquierda() {
		direccion = izquierda
		if (self.position().x() > 0) {
			self.avanzar()
		}
		else {
			self.position(new Position(x = game.width()-1, y = self.position().y()))
		}
	}

	method irDerecha() {
		direccion = derecha
		if (self.position().x() < game.width() - 1) {
			self.avanzar()
		}
		else {
			self.position(new Position(x = 0, y = self.position().y()))
		}
	}

	method avanzar() {
		position = direccion.siguiente(position)
	}

	method accionar(elemento) {
		try
			elemento.accion()
		catch e {
			console.println(e)
			self.retrocede()
		}
	}

	method retrocede() {
		self.position(direccion.opuesto().siguiente(position))
	}
	
	method recoger() {
		game.getObjectsIn(personajeSimple.direccion().siguiente(self.position())).forEach({o => o.recogerlo()})
	}
}

object personajeSimple inherits Personaje {
	var property image = "personajeAbajo.png"
	var property llaves = 0
	var property energia = 30
	var property dinero = 0
	var property salud = 50
	
	method curar(cura) {
		salud = (salud + cura).min(50)
	}
	
	method daniar(danio) {
		salud = (salud - danio).max(0)
	}
	
	method enriquecer(dineroExtra) {
		dinero += dineroExtra
		salud = (salud - 10).max(0)
	}
	
	method energizar(energias) {
		energia = (energia + energias).min(50)
	}
	
	method desenergizar(energias) {
		energia = (energia - energias).max(0)
		nivelBloques.condicionParaPerder()
	}
	
	method acumular() {
		llaves += 1
	}
	override method irArriba() {
		super()
		self.image("personajeArriba.png")
		energia -= 1
	}
	
	override method irAbajo() {
		super()
		self.image("personajeAbajo.png")
		energia -= 1
	}
	
	override method irDerecha() {
		super()
		self.image("personajeDerecha.png")
		energia -= 1
	}
	
	override method irIzquierda() {
		super()
		self.image("personajeIzquierda.png")
		energia -= 1
	}
}
