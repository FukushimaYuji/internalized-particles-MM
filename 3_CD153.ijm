// import Cellpose data, shrink, and output to a zip file. 20220326 M. Matsuda

	fname= getInfo("image.filename");
	path=getInfo("image.directory");
	name2 = substring(fname,0,4);
	file_name=path + name2 + '_RoiSet.zip'
	
	runMacro("D:/Drivers_Programs/Fiji.app/macros/imagej_roi_converter.py");
	
	dx = -1;
	n = roiManager("count");
	if (n==0)
	          exit("The ROI Manager is empty");
	for (i=0; i<n; i++) {
      roiManager("select", i);
      run("Enlarge...", "enlarge="+dx);
      roiManager("update");
      roiManager("Save", file_name);
	}
	roiManager("Delete");   // delete only the selected
	roiManager("Delete");  // to detele all 
	close("*");
