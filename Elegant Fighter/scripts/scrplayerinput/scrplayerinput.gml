function playerInput() {
	//NOTE: gamepad port 0-3 is for XInput (XBox), port 4-11 is for DirectInput (everything else)
	
	//Pause
	/*if (keyboard_check(inputPause1) || keyboard_check(inputPause2)) {
		
	}*/
	
	//Attack
	punchInput(false);
	kickInput(false);
	
	//Dodge
	dodgeInput();
	
	//Movement
	xMoveInput();
	x += xMove;
	//if (xMove != 0) pushEnemies();
	pushEnemies();
}