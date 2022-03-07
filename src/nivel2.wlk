import wollok.game.*
import fondo.*
import personajes.*
import elementos.*

object nivelLlaves {
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoCompleto2.png"))
		const dinero1 = new DineroChiquito(position = game.at(0, 0))const dinero2 = new DineroChiquito(position = game.at(0, 0))const dinero3 = new DineroChiquito(position = game.at(0, 0))
		const dinero4 = new DineroGrande(position = game.at(0, 0))const dinero5 = new DineroGrande(position = game.at(0, 0))const dinero6 = new DineroGrande(position = game.at(0, 0))
		const llave1 = new Llave(position = game.at(0, 0))const llave2 = new Llave(position = game.at(0, 0))const llave3 = new Llave(position = game.at(0, 0))
		const enemigo1 = new Enemigo(position = game.at(0, 0))const enemigo2 = new Enemigo(position = game.at(0, 0))const enemigo3 = new Enemigo(position = game.at(0, 0))
		const botiquin1 = new Botiquin(position = game.at(0, 0))const botiquin2 = new Botiquin(position = game.at(0, 0))const roca1 = new Roca(position = game.at(5, 7))game.addVisual(roca1)const roca2 = new Roca(position = game.at(11, 2))game.addVisual(roca2)
		const arbusto1 = new Arbusto(position = game.at(0, 2))const arbusto2 = new Arbusto(position = game.at(0, 3))const arbusto3 = new Arbusto(position = game.at(0, 4))
		const arbusto4 = new Arbusto(position = game.at(0, 6))const arbusto5 = new Arbusto(position = game.at(0, 7))const arbusto6 = new Arbusto(position = game.at(0, 8))
		const arbusto7 = new Arbusto(position = game.at(0, 10))const arbusto8 = new Arbusto(position = game.at(0, 11))const arbusto9 = new Arbusto(position = game.at(0, 12))
		const arbusto10 = new Arbusto(position = game.at(3,0))const arbusto11 = new Arbusto(position = game.at(3,14))const arbusto12 = new Arbusto(position = game.at(4, 0))
		const arbusto13 = new Arbusto(position = game.at(4, 14))const arbusto14 = new Arbusto(position = game.at(2, 0))const arbusto15 = new Arbusto(position = game.at(2,14))
		const arbusto16 = new Arbusto(position = game.at(7, 0))const arbusto17 = new Arbusto(position = game.at(7, 14))const arbusto18 = new Arbusto(position = game.at(8, 0))
		const arbusto19 = new Arbusto(position = game.at(8, 14))const arbusto20 = new Arbusto(position = game.at(6, 0))const arbusto21 = new Arbusto(position = game.at(6, 14))
		const arbusto22 = new Arbusto(position = game.at(10, 14))const arbusto23 = new Arbusto(position = game.at(10, 0))const arbusto24 = new Arbusto(position = game.at(11, 14))
		const arbusto25 = new Arbusto(position = game.at(11, 0))const arbusto26 = new Arbusto(position = game.at(12, 0))const arbusto27 = new Arbusto(position = game.at(12, 14))
		const arbusto28 = new Arbusto(position = game.at(14, 2))const arbusto29 = new Arbusto(position = game.at(14, 3))const arbusto30 = new Arbusto(position = game.at(14, 4))
		const arbusto31 = new Arbusto(position = game.at(14, 6))const arbusto32 = new Arbusto(position = game.at(14, 7))const arbusto33 = new Arbusto(position = game.at(14, 8))
		const arbusto34 = new Arbusto(position = game.at(14, 10))const arbusto35 = new Arbusto(position = game.at(14,11))const arbusto36 = new Arbusto(position = game.at(14, 12))
		
		[ arbusto1, arbusto2, arbusto3, arbusto4, arbusto5, arbusto6, arbusto7, arbusto8, arbusto9, arbusto10, arbusto11, arbusto12, arbusto13, arbusto14, arbusto15,
		arbusto16, arbusto17, arbusto18, arbusto19, arbusto20, arbusto21, arbusto22, arbusto23, arbusto24, arbusto25, arbusto26, arbusto27, arbusto28, arbusto29,
	    arbusto30, arbusto31, arbusto32, arbusto33, arbusto34, arbusto35, arbusto36 ].forEach({arbusto => game.addVisual(arbusto)})
		// otros visuals, p.ej. bloques o llaves
		[ dinero1, dinero2, dinero3, dinero4, dinero5, dinero6, llave1, llave2, llave3, enemigo1, enemigo2, enemigo3, botiquin1, botiquin2 ].forEach{ ing => game.addVisual(ing) self.ubicarAleatoriamente(ing)}
			
		// personaje, es importante que sea el Ãºltimo visual que se agregue
		game.addVisual(new MarcadorVida(position = game.at(2,14)))
		game.addVisual(new MarcadorDecenaVida(position = game.at(3,14)))
		game.addVisual(new MarcadorUnidadVida(position = game.at(4,14)))
		game.addVisual(new MarcadorLlave(position = game.at(6,14)))
		game.addVisual(new MarcadorDecenaLlave(position = game.at(7,14)))
		game.addVisual(new MarcadorUnidadLlave(position = game.at(8,14)))
		game.addVisual(new MarcadorDinero(position = game.at(10,14)))
		game.addVisual(new MarcadorDecenaDinero(position = game.at(11,14)))
		game.addVisual(new MarcadorUnidadDinero(position = game.at(12,14)))
		game.addVisual(personajeSimple)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.up().onPressDo({ personajeSimple.irArriba() self.condicionParaPerder() self.comprobarVictoria()})
		keyboard.down().onPressDo({ personajeSimple.irAbajo() self.condicionParaPerder() self.comprobarVictoria()})
		keyboard.left().onPressDo({ personajeSimple.irIzquierda() self.condicionParaPerder() self.comprobarVictoria()})
		keyboard.right().onPressDo({ personajeSimple.irDerecha() self.condicionParaPerder() self.comprobarVictoria()})
		// en este no hacen falta colisiones
		game.whenCollideDo(personajeSimple, { cosa => cosa.accion()})
	}
	
	method ubicarAleatoriamente(elemento) {
		const posicion = new Position(x = 0.randomUpTo(game.width() - 1).truncate(0), y = 0.randomUpTo(game.height() - 1).truncate(0))
		if (game.getObjectsIn(posicion).isEmpty()) {
			elemento.position(posicion)
		} 
		else {
			self.ubicarAleatoriamente(elemento)
		}
	}
	
	method comprobarVictoria() {
		if (personajeSimple.dinero() == 45 and personajeSimple.llaves() == 3) {
			game.addVisual(new Puerta(position = game.at(7, 13)))
		}
	}
	
	method condicionParaPerder() {
		if (personajeSimple.salud() <= 0) {
			self.perder()
		}
	}
	
	method perder() {
		game.schedule(1000, {
			game.clear()
			game.addVisual(new Fondo(image="perdiste.png"))
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() tambiÃ©n va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// despuÃ©s puedo volver a agregar el fondo, y algÃºn visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto2.png"))
		// despuÃ©s de un ratito ...
		game.schedule(1000, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// despuÃ©s de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
}
