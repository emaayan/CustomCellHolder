
cellHeight=66;
cellDiameter=18.85;
holderHeight=7;
spacing=0.6;
stripTabHeight=2;
stripWidth=8;

stripDiff=0.5;// how small make the strip in plus side
innerSpacing=0;
s=0;
n=-1;
p=1;

makeBMS=true;
row=0;
col=0;        
bmsSpacingFromCells=2;
bmsWidth=11;
bmsLength=74;
ov=0;
oh=90;
orientation=ov;



trangle14s8p
    =[ 
     [p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n]
    ,[p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n,n,n,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n]    
    ,[n,n,n,n,n,n,n]    
    ,[n,n,n,n,n]    
    
    ];

mine14s6p=[
         [n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]       
];

custom20s10p
=[ 
     [p,n,p,p,p,n,p,p]
    ,[p,n,p,p,p,n,p,p,n]
    ,[p,n,p,n,p,n,p,p,n]
    ,[p,n,p,n,p,n,p,p,n,n]
    ,[p,n,p,n,p,n,p,p,p,p,n,n]
    ,[p,n,p,n,p,n,p,p,p,p,n,n]
    ,[p,n,p,n,p,n,p,p,p,p,n,n]
    ,[p,n,p,n,p,n,p,p,p,p,n,n]
    ,[p,n,p,n,n,n,p,p,p,p,n,n]
    ,[p,n,p,n,n,n,p,p,p,p,n,n]
    ,[n,p,n,n,n,p,n,p,n,p,n]
    ,[n,p,n,n,n,p,n,p,n,p,n]
    ,[n,p,n,p,n,p,n,p,n,p,n]
    ,[n,p,n,p,n,p,n,p,n,n]
    ,[n,p,n,p,n,p,n,n,n,n]
    ,[n,p,n,p,n,p,n,n,n,n]    
    ,[n,p,n,p,n,p,n,n]
    ,[n,p,n,p,n,p,n]
    ,[n,p,n,p,p,p]
    ,[n,p,n,p]
    ,[n,p,p,p]
    ];
    
std10s3p=[
    [n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ];
simpleOne=[                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]
        ,[n]      
        
        ];
 

manArr=trangle14s8p;         
//manArr=custom20s10p;
//manArr=mine14s6p;         
manArr=simpleOne;         
//manArr=std10s3p;

boltDiameter=4.7;
boltRadius=boltDiameter/2;

holderDiameter=cellDiameter+spacing;
holderRadius=holderDiameter/2;
stripLength=holderDiameter; 
angle=60;    

rimOffset=boltRadius+spacing;
holderActuallHeight=holderHeight+0.002;




start=[for(x=[0:len(manArr[0])-1])
    [0,x]
];
echo("start",start);

right=[for(x=[0:len(manArr)-1])
     [x,len(manArr[x])-1]
];
echo ("right",right);

//end=[for(x=[len(manArr[len(manArr)-1])-1:-1:0])
end=[for(x=[0:1:len(manArr[len(manArr)-1])-1])
    [len(manArr)-1,x]  
];
echo ("end",end);

left =[for(x=[0:1:len(manArr)-1])
   [x,0]
];
echo ("left",left);


function startOutline()
    =[for(i=start) calc2D(i)];
        
function rightOutline()
  = [for(i=right) calc2D(i)]  ;
      
function endOutline()
    =[for(i=end)  calc2D(i)] ;
        
function leftOutline()
    =[for(i=left) calc2D(i)];    
        
function createOutline()
    =concat( startOutline()
            ,rightOutline()
            ,endOutline()
            ,leftOutline());




    
main(); 
    
module main(){
    
    holder();
    
    bodyZ=cellHeight-(holderHeight*2);
    makeBody(bodyZ);
    
     translate([0,0,-bodyZ-2]){   
         mirror([0,0,90]){
             holder();
         }
     }
}
module makeBody(bodyZ){
    translate([0,0,-bodyZ-1]){  
         difference(){    
             shell(bodyZ);
           
             
             translate([0,0,-0.1]){
                rim(cellHeight+0.2,innerSpacing);
             }
             
         }
         
        linear_extrude(bodyZ){
            difference(){
                yPos=len(start)/2;//todo: find the widest palce otherwise won't fit
                from=calc2D([-2,yPos]);
                to=calc2D([len(left)+1,0]);        
                l=to[0]-from[0];
                cc=calc2D([-2,0]);  
                           
                translate(concat(from,0)){                
                     #cube([l,0.5,bodyZ],center=false); //slice the body 
                }           
             }          
        }
                            
   }         
}
module drawBolts(arr,from,step,stopPos,xCol,yCol,xOffset,yOffset,Z){

    for(i=[from:step:len(arr)+stopPos] ){
       a=arr[i];
        
       translate (concat(calc2D([a[0]+xCol,a[1]+yCol],xOffset,yOffset),-0.001  )){           
            cylinder(d=boltDiameter,h=Z);              
       }
    }
                    
}
module bolts(Z){

    drawBolts(start,1,2,-2,-0.5,   0 ,   -holderRadius+(boltDiameter/2),0,Z);                 
    drawBolts(end  ,0,2,-2, 0.5,   0 ,    holderRadius-(boltDiameter/2),0,Z);                       
    drawBolts(right,0,1,-2,+0.5,   0 ,   0,                             holderRadius+(boltDiameter/2),Z);      
    drawBolts(left, 1,1,-1,-0.5,   0 ,   0,                            -holderRadius-(boltDiameter/2),Z);
}
orientation=ov;
bmsSpacingFromCells=4.7+spacing;//boltDiameter;
module bms(pos,Z){
    if (makeBMS){
        numOfCells=4;
                
        
        if(orientation==ov){
            endPos= calc2D([row+numOfCells ,col,0]);                        
            bmsLength=(endPos[0]-pos[0]);
            x=pos[0]-holderRadius;            
            y=pos[1]-holderRadius-bmsSpacingFromCells-bmsWidth; 
            translate([x,y,-0.001]){                    
                rotate(orientation){
                  translate([0,0,-Z]){
                        cube([bmsLength,bmsWidth,holderActuallHeight+0.002]); 
                  }
                }
            }    
        }
        
        if (orientation==oh){
            x=pos[0]-holderRadius-bmsSpacingFromCells;
            y=pos[1]-holderRadius;
            translate([x,y,-0.001]){                    
                rotate(orientation){
                  translate([0,0,-Z]){
                        cube([bmsLength,bmsWidth,holderActuallHeight+0.002]); 
                  }
                }
            }  
        }
        
        
    }
}        
module shell(h){
     linear_extrude(h){
       hull(){
           offset(rimOffset){
               projection(){               
                  design(true);          
               }
           }
       }
     } 
}
module rim(h,r=rimOffset){
          linear_extrude(h){
               offset(r){ 
                   projection(){
                        design(true);          
                   }
               }
           }
}
module holder(){
     difference(){
           shell(holderActuallHeight);
           translate([0,0,-cellHeight+holderActuallHeight+1.1]){
              bolts(cellHeight+0.002);               
           }     
           
           translate([0,0,0]){
                design();                 
           }
    }      
}

module design(isHull=false){
                  
        Z=holderActuallHeight;
        
        pos=calc2D([row,col,Z]);                  
        bms(pos);
         
        translate([0,0,holderActuallHeight]){            
            stripZ=holderHeight+(stripTabHeight/2);                                    
            translate([0,0,0]){
                   bolts(cellHeight+holderHeight);
         }         
            drawHoles(manArr){                  
               
                if (isHull){
                    translate([0,0,-stripZ]){
                        rotate(30){
                            cylinder(d=holderDiameter/sin(60),h=holderHeight+stripTabHeight-0.001,$fn=6);                        
                        }
                    }
                }else{
                   translate([0,0,-stripZ-0.01]){                          
                        cylinder(d=cellDiameter,h=holderHeight+0.1);
                   }     
                   
                   actuallstripWidth= stripWidth;
                   actuallStripLength=stripLength+0.001;
                   cube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                    
                   rotate(angle){
                        cube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                   }
                   
                   rotate(angle*2){
                        cube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                   }                                  
               }
            }; 
                           
    }
                    
}
    
     
module drawHoles(manArr,left=true){
    for(c=[0:len(manArr)-1]){
         col= manArr[c];
         for(r=[0:len(col)-1]){
            cell=col[r];
            pos=[c,r];
            col=pos[0];
            row=pos[1];              
   
            position=concat(calc2D(pos),0);
            x=position[0];
            y=position[1];
            z=position[2];
            positiveCell=cell==p;
            negativeCell=cell==n;
            drawNegative=stripDiff!=0 && (negativeCell && left || positiveCell && !left  );
    
            holderZ=z; 
            actuallstripWidth= stripWidth+ (drawNegative ?0:stripDiff);
            if(negativeCell || positiveCell){              
                translate([x,y,0]){       
                   clr=drawNegative ? "black" :"red";                                         
                        children();                    
                        rotate([0,0,90]){
                              color(clr){                                  
                                    #text(str(col,",",row),size=4);                                                     
                             }                    
                        }                                
                }       
            }           
         }     
    }  
}

function calc2D(coord,xOffset=0,yOffset=0)
    =[  ((holderRadius *(coord[1]%2))+(coord[0]*holderDiameter))+xOffset
       ,(sin(angle)*holderDiameter*coord[1]) +yOffset];


 
    