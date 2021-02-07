random_seed = floor(rands(1,9999999,1)[0]);
custom_seed = 0;
nBranches = 4;
// set the random snowflake seed
seed = (custom_seed==0) ? random_seed : custom_seed;
maxSteps=100*1;
randomWidth = rands(15,55,maxSteps,seed);
randomDepth = rands(1,6, maxSteps, seed);
randomSymmetry = rands(-2,2, seed);
branchLength = rands(30, 40, seed)[0];
branchThickness = 2;

raisinBoxWidth = 36;
raisinBoxDepth = 18;
raisinBoxHeight = 48;

echo(seed);

module snowflakyfy(){
    for (angle = [0, 60, 120, 180, 240, 300])
        rotate(angle)
            children();
}

module singleBranch(){
    translate([0, -0.5*2*branchThickness, 0])
        cube([branchLength, 2*branchThickness, branchThickness]);
    
    for (i = [0:nBranches]){  
        translate([branchLength/10 + branchLength/nBranches* i, 0, 0])
            secundaryBranche(randomWidth[i], randomDepth[i], 0);
    }

}


module secundaryBranche(size, thickness, half){
    difference(){
        cylinder(d = size, $fn=6, h=branchThickness);
            translate([thickness, ,0,0])
                cylinder(d = size, $fn=6, h=branchThickness);
        
        if (half < -1.5)
            translate([-size/2, 0, 0])
                cube(size);
        
        if (half > 1.5)      
            translate([-size/2, -size, 0])
                cube(size);          
    }

}

module drawSnowflake(){    
    //cylinder(d=6, $fn=6);
    bt = 2;
    difference(){
        union(){
            translate([-raisinBoxWidth/2-bt/2, -raisinBoxDepth/2-bt/2, 0]){
                cube([raisinBoxWidth+bt, raisinBoxDepth+bt, 10]);
            }        
            snowflakyfy()
                singleBranch();
        }
        translate([-raisinBoxWidth/2, -raisinBoxDepth/2, 0]){
            cube([raisinBoxWidth, raisinBoxDepth, raisinBoxHeight]);
        }
    }
}

drawSnowflake();
