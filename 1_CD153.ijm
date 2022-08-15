// For TCR analysis; 20200326 M. Matsuda
// with only maximum z 

SliceNum = getNumber("Slice number of interest",58);
fname= getInfo("image.filename");
path=getInfo("image.directory");
name2 = substring(fname,0,1);
TCR_name=path + name2 + '_' + SliceNum + '_TCR_max_2.tif'
CD153_name=path + name2 + '_' + SliceNum + '_CD153_max.tif'

selectWindow(fname);
run("Slice Keeper", "first=2 last=186 increment=2");
setSlice(SliceNum);
run("Duplicate...", "use");
run("Subtract Background...", "rolling=50");
run("Maximum 3D...", "x=1 y=1 z=2");
saveAs("Tiff", CD153_name);

selectWindow(fname);
run("Slice Keeper", "first=1 last=186 increment=2");
setSlice(SliceNum);
run("Duplicate...", "use");
run("Subtract Background...", "rolling=50");
run("Maximum 3D...", "x=1 y=1 z=2");
saveAs("Tiff", TCR_name);
close("\\Others");

