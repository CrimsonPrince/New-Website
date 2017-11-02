
	
	pictures = new Array(5);
	pictures[0] = "pict1.jpg";
	pictures[1] = "pict2.jpg";
	pictures[2] = "pict3.jpg";
	pictures[3] = "pict4.jpg";
	pictures[4] = "pict5.jpg";
	
function display{
	
	var nextPict = "Assets/Images/" + pictures[1];
	document.getElementById("myImg").src = nextPict;
}