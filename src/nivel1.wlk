import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import pantallanivel2.*


object nivelBloques {
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoCompleto.png"))
				 
		// otros visuals, p.ej. bloques o llaves
		// method con iteracion.
		const pared1 = new Pared(position = game.at(0,0))const pared2 = new Pared(position = game.at(0,2))const pared3 = new Pared(position = game.at(0,3))
		const pared4 = new Pared(position = game.at(0,4))const pared5 = new Pared(position = game.at(0,5))const pared6 = new Pared(position = game.at(0,6))
		const pared7 = new Pared(position = game.at(0,8))const pared8 = new Pared(position = game.at(0,9))const pared9 = new Pared(position = game.at(0,10))
		const pared10 = new Pared(position = game.at(0,11))const pared11 = new Pared(position = game.at(0,12))const pared12 = new Pared(position = game.at(0,14))
		const pared13 = new Pared(position = game.at(2,0))const pared14 = new Pared(position = game.at(2,14))const pared15 = new Pared(position = game.at(3,14))
		const pared21 = new Pared(position = game.at(4,0))const pared16 = new Pared(position = game.at(4,6))const pared17 = new Pared(position = game.at(4,7))
		const pared18 = new Pared(position = game.at(4,8))const pared19 = new Pared(position = game.at(4,9))const pared20 = new Pared(position = game.at(4,14))
		const pared23 = new Pared(position = game.at(5,0))const pared24 = new Pared(position = game.at(5,14))const pared22 = new Pared(position = game.at(3,0))
		const pared25 = new Pared(position = game.at(6,0))const pared26 = new Pared(position = game.at(6,14))const pared27 = new Pared(position = game.at(7,3))
		const pared28 = new Pared(position = game.at(7,7))const pared29 = new Pared(position = game.at(8,0))const pared30 = new Pared(position = game.at(8,3))
		const pared31 = new Pared(position = game.at(8,14))const pared32 = new Pared(position = game.at(9,0))const pared33 = new Pared(position = game.at(9,3))
		const pared34 = new Pared(position = game.at(9,14))const pared35 = new Pared(position = game.at(10,0))const pared36 = new Pared(position = game.at(10,10))
		const pared37 = new Pared(position = game.at(10,14))const pared54 = new Pared(position = game.at(11,0))const pared38 = new Pared(position = game.at(11,10))
		const pared39 = new Pared(position = game.at(11,14))const pared40 = new Pared(position = game.at(12,0))const pared41 = new Pared(position = game.at(12,14))
		const pared42 = new Pared(position = game.at(14,0))const pared43 = new Pared(position = game.at(14,2))const pared44 = new Pared(position = game.at(14,3))
		const pared45 = new Pared(position = game.at(14,4))const pared46 = new Pared(position = game.at(14,5))const pared47 = new Pared(position = game.at(14,6))
		const pared48 = new Pared(position = game.at(14,8))const pared49 = new Pared(position = game.at(14,9))const pared50 = new Pared(position = game.at(14,10))
		const pared51 = new Pared(position = game.at(14,11))const pared52 = new Pared(position = game.at(14,12))const pared53 = new Pared(position = game.at(14,14))
		const meta1 = new Meta(position = game.at(1,1))const meta2 = new Meta(position = game.at(1,1))const meta3 = new Meta(position = game.at(1,1))
		const meta4 = new Meta(position = game.at(1,1))const caja1 = new Caja(position = game.at(0, 0), meta = [meta1, meta2, meta3, meta4], cajas = #{})
		const caja2 = new Caja(position = game.at(0, 0), meta = [meta1, meta2, meta3, meta4], cajas = #{})
		const caja3 = new Caja(position = game.at(0, 0), meta = [meta1, meta2, meta3, meta4], cajas = #{})
		const caja4 = new Caja(position = game.at(0, 0), meta = [meta1, meta2, meta3, meta4], cajas = #{})
		caja1.cajas(#{caja1, caja2, caja3, caja4}) caja2.cajas(#{caja1, caja2, caja3, caja4}) caja3.cajas(#{caja1, caja2, caja3, caja4}) caja4.cajas(#{caja1, caja2, caja3, caja4})
		const nuka1 = new NukaCola(position = game.at(0, 0))const nuka2 = new NukaCola(position = game.at(0, 0))
		const nuka3 = new NukaCola(position = game.at(0, 0))const celdaEsp1 = new CeldaEspecialMasEnergia(position = game.at(1,1))
		const celdaEsp2 = new CeldaEspecialMenosEnergia(position = game.at(1,1)) const celdaEsp3 = new CeldaEspecialTP(position = game.at(1,1))
		
		[ pared1, pared2, pared3, pared4, pared5, pared6, pared7, pared8, pared9, pared10, pared11, pared12, pared13, pared14, pared15, pared16, pared17, pared18, pared19, pared20,
		  pared21, pared22, pared23, pared24, pared25, pared26, pared27, pared28, pared29, pared30, pared31, pared32, pared33, pared34, pared35, pared36, pared37, pared38, pared39,
		  pared40, pared41, pared42, pared43, pared44, pared45, pared46, pared47, pared48, pared49, pared50, pared51, pared52, pared53, pared54].forEach{p => game.addVisual(p)}
		[ meta1, meta2, meta3, meta4, celdaEsp1, celdaEsp2, celdaEsp3, caja1, caja2, caja3, caja4, nuka1, nuka2, nuka3 ].forEach{ ing => game.addVisual(ing) self.ubicarAleatoriamente(ing)}	
		game.addVisual(new MarcadorEnergia(position = game.at(3,14)))
		game.addVisual(new MarcadorDecena(position = game.at(4,14)))
		game.addVisual(new MarcadorUnidad(position = game.at(5,14)))
		// personaje, es importante que sea el Ãºltimo visual que se agregue
		game.addVisual(personajeSimple)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.up().onPressDo({ personajeSimple.irArriba() self.condicionParaPerder()})
		keyboard.down().onPressDo({ personajeSimple.irAbajo() self.condicionParaPerder()})
		keyboard.left().onPressDo({ personajeSimple.irIzquierda() self.condicionParaPerder()})
		keyboard.right().onPressDo({ personajeSimple.irDerecha() self.condicionParaPerder()})
		keyboard.e().onPressDo({personajeSimple.recoger()})

		// colisiones, acÃ¡ sÃ­ hacen falta
		game.whenCollideDo(personajeSimple, {e => personajeSimple.accionar(e)})	
		}
		
		method comprobarVictoria(cajas) {
			if (cajas.all{caja => caja.estaEnPosicion()}) {
				self.terminar()
			}
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
	
	method condicionParaPerder() {
		if (personajeSimple.energia() <= 0) {
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
	

	method terminar() {
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// despuÃ©s puedo volver a agregar el fondo, y algÃºn visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		// despuÃ©s de un ratito ...
		game.schedule(1000, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="finNivel1.png"))
			// despuÃ©s de un ratito ...
			game.schedule(3000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				presentacion2.configurate()
				}
			)}
		)}
}

