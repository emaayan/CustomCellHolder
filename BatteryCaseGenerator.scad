cellHeight=65;
cellDiameter=18.85;
holderHeight=7;
spacing=0.7;
stripTabHeight=1.5;
stripWidth=8;

stripDiff=0;// how small make the strip in plus side

rimThicnkess=5;
startOffset=0;//1;
rightOffset=4;//;
endOffset=0;//;
leftOffset=16;//;

coverThickness=2;
bodyThickness=2;

boltDiameter=4.5;
boltSpacingFromCell=3.5;


bmxXoffset=4;
bmsWidth=16;
bmsLength=109.5;
bmsHeight=67;
bmsSpacingFromCells=3;
bmsSenseHolesDistance=2;
makeRightHoles=false;

makeHolders=true;
makeLeftHolder=makeHolders && false;
makeRightHolder=makeHolders && true;

makeCovers=false;
makeLeftCover=makeCovers && true;
makeRightCover=makeCovers && true;

makeBody=true;
makeBMS=true;


senseHolesDiameter=4; //for sense wires


////////

s=0;
n=-1;
p=1;

trangle14s6p
    =[ 
     [p,p,p,p,p,p,p,p,p,p,p,n]
    ,[p,p,p,p,p,p,p,p,p,p,p,n,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n]
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

        
mine14s6p=[
         [n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]       
            ];        

simpleOne=[                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]
        ,[n]        
        
        ];

jacob=[ 
        [n,n,n,n,p,p,p,n,n,n,n,p,p,p,n,n,n,n,p,p]
       ,[undef,n,n,n,p,p,p,p,n,n,n,p,p,p,p,n,n,n,p,p,undef]
       ,[undef,n,n,n,n,p,p,p,n,n,n,n,p,p,p,n,n,p,p,n]
       ,[undef,undef,n,n,n,p,p,p,p,n,n,n,p,p,p,p,n,n,p,n,n]
       ,[undef,undef,n,n,n,n,p,p,p,n,n,n,n,p,p,p,n,n,p,p]
       ,[undef,undef,undef,n,n,n,p,p,p,p,n,n,n,p,p,p,p,n,p,p]
       ,[undef,undef,undef,n,n,n,n,p,p,p,n,n,n,n,p,p,p,p]
       ,[undef,undef,undef,undef,n,n,n,p,p,p,p,n,n,n,p,p,p]
       ];
manArr=simpleOne;

debug=false;


function countPolarity(manArr,d)
    =[for(x=[0:len(manArr)-1])
        for(y=[0:len(manArr[x])-1])
            if(manArr[x][y]==d) 1             
    ];


holderDiameter=cellDiameter+spacing;
stripLength=holderDiameter+0.001; 
angle=60;    
radius=holderDiameter/2;         

holderActuallHeight=holderHeight+0.002;
stripZ=holderHeight+(stripTabHeight/2);                            

outerRimHeight=holderHeight+stripTabHeight-0.001;

bodyHeight=cellHeight;
rimOffset=radius+spacing +rimThicnkess;// from where to drawe holer's rim
actuallBodyThickness=rimOffset+0.001+bodyThickness;



negatives=len(countPolarity(manArr,n));
positives=len(countPolarity(manArr,p));
total=negatives+positives;


group=6; 
            
echo("**********");
echo("Negatives",negatives," Positives",positives,"Total :",total,"Serial: ",total/group ,"Group: " ,group);
echo("**********");
echo("");

    
start=[for(x=[0:len(manArr[0])-1])
    [0,x]
];
echo("start",start);

right=[for(x=[0:len(manArr)-1])
    if(len(manArr[x])-1 >0) [x,len(manArr[x])-1]
];
echo ("right",right);

end=[for(x=[len(manArr[len(manArr)-1])-1:-1:0])
    [len(manArr)-1,x]  
];
echo ("end",end);

left =[for(x=[len(manArr)-1:-1:0])
   [x,0]
];
echo ("left",left);


function startOutline()
    =[for(i=start) calc2D(i,-rimThicnkess- startOffset,0)];
        
function rightOutline()
  = [for(i=right) calc2D(i,0,rimThicnkess+ rightOffset)]  ;
      
function endOutline()
    =[for(i=end)  calc2D(i,rimThicnkess+ endOffset,0)] ;
        
function leftOutline()
    =[for(i=left) calc2D(i,0,-rimThicnkess-leftOffset)];    
        
function createOutline()
    =concat( startOutline()
            ,rightOutline()
            ,endOutline()
            ,leftOutline());


difference(){
    union(){       
            translate([0,0,coverThickness]){
                if (makeRightCover){         
                    makeCover(false);
                }
            }
            translate([0,0,-coverThickness-outerRimHeight-0.1]){
                 if (makeRightHolder){ 
                    drawHolder(false);
                 }
            }
            translate([0,0,-coverThickness-bodyHeight-0.1]){
              /*  
                if (makeBody){                             
                    difference(){       
                        translate([-rimOffset+4,0,0]){
                          //  drawOutline(startOutline(),bodyHeight-outerRimHeight,rimOffset/4)     ;
                            linear_extrude(bodyHeight-outerRimHeight){
                                offset(delta=rimOffset/4){                
                                        polygon(startOutline());
                                }
                            } 
                        }
                        //drawRim(bodyHeight,actuallBodyThickness);                                            
                        translate([0,0,-0.001]){                                
                            //drawRim(bodyHeight+0.01,rimOffset);                    
                        }             
                    }                    
                } 
            */      
            }
            translate([0,0,-coverThickness-bodyHeight+outerRimHeight]){
                mirror([0,0,90]){
                     if (makeLeftHolder){                   
                        drawHolder(true);
                     }
                }
            }
            translate([0,0,-coverThickness-coverThickness-bodyHeight-outerRimHeight]){
                if (makeLeftCover){
                    makeCover(makeBody);
                }
            }
        
    }
    
    if (makeBMS){
            startPos=start[0];         
            coord=calc2D(startPos);                        
            bmsX=coord[0]-radius+spacing+bmxXoffset;
            bmsY=coord[1]-radius-bmsWidth-spacing;    
            
            translate([bmsX,bmsY-bmsSpacingFromCells,-coverThickness-bmsHeight]){            
               cube([bmsLength,bmsWidth,bmsHeight]);
            }
    }   
  
}
 
      

module drawHolder(leftSide=true){
     difference(){
   
        drawRim(outerRimHeight,rimOffset);  
                       
        for(a=[0:len(start)-1]){//draw sense wires holes                                
            isOuter= (a %2)==0;
            if (isOuter){
                coord=calc2D(start[a]);                

                translate([coord[0]-radius-(senseHolesDiameter/1.6),coord[1],-0.001]){                
                    cylinder(d=senseHolesDiameter,h=holderActuallHeight+ stripTabHeight);                                               
                    translate([0,0,stripZ]){
                        cube([senseHolesDiameter+1.6,senseHolesDiameter,stripTabHeight+0.001],center=true);                             
                    }
                }                                    
            }
        }           
                 for(a=[1:len(left)-1]){//left sense wires
                      isInner= (a %2)==1;
                     
                          coord=calc2D(left[a]);                        
                          translate([coord[0]+radius,coord[1]-(senseHolesDiameter*2)-bmsSenseHolesDistance,-0.001]){                
                            cylinder(d=senseHolesDiameter,h=holderActuallHeight+stripTabHeight);                      
                              
                            translate([0,(-bmsSpacingFromCells/2)+bmsSenseHolesDistance+0.0001,stripZ]){
                               cube([senseHolesDiameter*2,(senseHolesDiameter*2)+bmsSpacingFromCells,stripTabHeight+0.001],center=true);                             
                            }
                        }  
                    
                 } 
        drawAllBoltHoles();
        drawHoles(manArr,leftSide);
      
    }
}
module drawAllBoltHoles(){
        drawBoltHoles(start,-1,boltDiameter);
        if (makeRightHoles){
            arrEdge=right;
            isInnerPrm=1;
            spaceFactor=-1;   
            for(a=[1:len(arrEdge)-1]){// draw right bolt diameter                     
                coord=calc2D(arrEdge[a]);          
                boltX=coord[0]+spaceFactor*(radius+(boltDiameter/2)+(boltSpacingFromCell/2));
                boltY=coord[1]-spaceFactor*(radius+(boltDiameter/2)+boltSpacingFromCell);
                translate([boltX,boltY,-0.001]){
                  cylinder(d=boltDiameter,h=holderActuallHeight+ stripTabHeight+coverThickness);
                }          
              }
            }
        drawBoltHoles(end,1,1,boltDiameter);
}

module makeCover(withBody=false){
   difference(){   
        drawRim(coverThickness,actuallBodyThickness);                                          
        drawAllBoltHoles();         
    }
    if (withBody){
        
        difference(){
            drawRim(bodyHeight,actuallBodyThickness);                                            
            translate([0,0,-0.001]){                                
                drawRim(bodyHeight+0.01,rimOffset);                    
            }        
        }
    }
}
module drawBoltHoles(arrEdge,spaceFactor){
     for(a=[0:len(arrEdge)-1]){   
        coord=calc2D(arrEdge[a]);         
        isInner= (a%2)==1;                    
        if (isInner){
            boltX=coord[0]+spaceFactor*(radius+(boltDiameter/2)+boltSpacingFromCell);
            boltY=coord[1];
            translate([boltX,boltY,-0.001]){
                cylinder(d=boltDiameter,h=holderActuallHeight+ stripTabHeight+coverThickness);
            }        
        }
      }
}

    
module drawRim(rimHeight,rOffset){
    drawOutline(createOutline(),rimHeight,rOffset);    
}
module drawOutline(outline,rimHeight,rOffset){
    if (!debug){
        linear_extrude(rimHeight){
            offset(r=rOffset){                
                polygon(outline);
            }
        }      
    }
}
module drawHoles(manArr,left=true){
    for(c=[0:len(manArr)-1]){
         col= manArr[c];
         for(r=[0:len(col)-1]){
             cell=col[r];
             drawCell([c,r],cell,left);               
         }     
    }  
}
function calc2D(coord,xOffset=0,yOffset=0)
    =[ ((radius*(coord[1]%2))+(coord[0]*holderDiameter))+xOffset
       ,(sin(angle)*holderDiameter*coord[1])+yOffset ];


module drawCell(pos,cell,left=true){
       
    col=pos[0];
    row=pos[1];              
    
    position=concat(calc2D(pos),0);
    x=position[0];
    y=position[1];
    z=position[2];
    positiveCell=cell==p;
    negativeCell=cell==n;
    drawNegative=stripDiff!=0 && (negativeCell && left || positiveCell && !left  );
    
    holderZ=z-0.001; 
    actuallstripWidth= stripWidth+ (drawNegative ?0:stripDiff);
    if(negativeCell || positiveCell){
        translate([x,y,z]){
            
            translate([0,0,stripZ]){               
               actuallstripWidth= stripWidth+ (drawNegative ?0:stripDiff);
               cube([stripLength,actuallstripWidth,stripTabHeight],center=true);
                
               rotate(angle){
                    cube([stripLength,actuallstripWidth,stripTabHeight],center=true);
               }
               
               rotate(angle*2){
                    cube([stripLength,actuallstripWidth,stripTabHeight],center=true);
               }
            }           
        }
        
        translate([x,y,holderZ]){       
            clr=drawNegative ? "black" :"red";
            color(clr){
                cylinder(d=cellDiameter,h=holderActuallHeight);
                translate([0,-3,0]){
                    rotate([0,0,90]){
                        #text(str(col,",",row),size=4);                   
                    }
                }
            }
        }       
    }else{
    }  
    
   
    
}    
    