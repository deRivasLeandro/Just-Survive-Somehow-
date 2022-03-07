import wollok.game.*
import fondo.*
import nivel1.*

object presentacion1 {
	
	method configurate() {
		game.addVisual(new Fondo(image="pantallaNivel1.png"))
		keyboard.space().onPressDo({self.terminar()})
		}

	method terminar() {
		game.clear()
		nivelBloques.configurate()
		}
}