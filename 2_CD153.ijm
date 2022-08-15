//A macro for the particle analysis following 1_CD153.ijm. 20220326 M. Matsuda
// Open the TCR image, for example, "4_50_TCR_max_2.tif"
fname= getInfo("image.filename");
path=getInfo("image.directory");
name2 = substring(fname,0,4);
file_name=path + name2 + '_particle.csv'

setAutoThreshold("Default dark");
run("Threshold...");
run("Analyze Particles...", "size=3-30 circularity=0.50-1.00 exclude clear summarize add");
roiManager("Measure");
saveAs("Results", file_name);
roiManager("Delete");
close("*");
