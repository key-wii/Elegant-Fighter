function collide() {
	if (place_meeting(x, y, other)) {
		for (var i = 0; i < 1000; ++i) {
			if (!place_meeting(x + i, y, other)) {
				x += i;
				break;
			}
			if (!place_meeting(x - i, y, other)) {
				x -= i;
				break;
			}
			if (!place_meeting(x, y - i, other)) {
				y -= i;
				break;
			}
			if (!place_meeting(x, y + i, other)) {
				y += i;
				break;
			}
			if (!place_meeting(x + i, y - i, other)) {
				x += i;
				y -= i;
				break;
			}
			if (!place_meeting(x - i, y - i, other)) {
				x -= i;
				y -= i;
				break;
			}
			if (!place_meeting(x + i, y + i, other)) {
				x += i;
				y += i;
				break;
			}
			if (!place_meeting(x - i, y + i, other)) {
				x -= i;
				y += i;
				break;
			}
		}
	}
}