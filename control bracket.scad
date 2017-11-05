partialPrint = false;
postWidth = 8.5;
postDepth = 2;
postHeight = 24.6;
nubWidth = 5;
nubDepth = 4.5;
nubHeight = 5;
shelfHeight = 8.5;
difference()
{
    union()
    {
        difference()
        {
            cube(size=[44,38,2]);
            translate([15.5, (38-29)/2, 0])
            cube(size=[16,29,2]);
        }
        translate([44-11,0,0])
        cube(size=[11,38,shelfHeight]);
        translate([1,0,0]) postPair();
        translate([26.75,0,0]) postPair();
    }
    if (partialPrint)
    {
        translate([36,0,0])
        cube([1000,1000,1000]);
        translate([0,5.5,0])
        cube([1000,1000,1000]);
    }
}

module post() 
{
    cube([postWidth,postDepth,postHeight], true);
    translate([0,nubDepth/4,postHeight/2 + nubHeight/2])
        cube([nubWidth,nubDepth,nubHeight], true);
}
module postPair()
{
translate([postWidth/2,postDepth/2,postHeight/2])
    post();
translate([postWidth/2,38 - postDepth + postDepth/2,postHeight/2])
    rotate([0,0,180])
    post();
}