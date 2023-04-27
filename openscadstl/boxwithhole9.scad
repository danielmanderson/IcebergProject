//Instructions: 
//   a. Rotate view (press mouse, move one finger) 
//   b. Zoom view (two fingers) 
//   c. Preview (Design menu) 
//   d. Render (Design menu) 
//   e. Save (File menu)
//   f. Export as STL (File menu)

difference() {
	cube([60,30,30], center =true, $fn=100); 	// main object
        // the following is the object that will be substracted
    translate([-30,9,9]) //Change 9 to another value to reposition hole.
	rotate ([0,90,0]) cylinder (h = 80, r=2.5, center = false, $fn=100);
}


