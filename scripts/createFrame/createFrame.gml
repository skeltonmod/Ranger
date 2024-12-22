function createFrameFrmAngle(num, angle){
	var frameNumber = 0;
	
	frameNumber = floor((((360 / num) >> 1) + angle) / (360 / num))
	
	if(frameNumber >= num){
		return 0;
	}
	
	return frameNumber;
}