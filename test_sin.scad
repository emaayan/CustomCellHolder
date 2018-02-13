diameter=20;
r=diameter/2;
//circle(d=diameter,center=true);

translate([0,0,0]){
    hull(){
        projection(cut=true){
            cylinder(d=10,h=20);
            translate([10,2,0]){
                cube(d=10,h=20);
            }
        }
    }
        

}
z=0;

translate([-r,sin(-90)*r,z]){
    #circle(d=1);
}
translate([sin(-90)*r,r,z]){
    #circle(d=1);
}