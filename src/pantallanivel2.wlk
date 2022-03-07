import wollok.game.*
import fondo.*
import nivel2.*

object presentacion2 {
	
	method configurate() {
		game.addVisual(new Fondo(image="pantallaNivel2.png"))
		keyboard.space().onPressDo({self.terminar()})
		}

	method terminar() {
		game.clear()
		nivelLlaves.configurate()
		}
}