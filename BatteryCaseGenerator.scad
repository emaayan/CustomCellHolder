cellHeight=65;
cellDiameter=18.90;
holderHeight=8;
spacing=0.7;
stripTabHeight=1.5;
stripWidth=8;
outerRimThicness=3;
stripDiff=-1;// how small make the strip in plus side
bmsThickness=15.5;
coverThickness=2;
boltDiameter=4;
holderDiameter=cellDiameter+spacing;
stripLength=holderDiameter+0.001; 
angle=60;    
radius=holderDiameter/2;         

holderActuallHeight=holderHeight+0.002;
stripZ=holderHeight+(stripTabHeight/2);                            


outerRimHeight=holderHeight+stripTabHeight-0.001;

bodyHeight=cellHeight-(holderHeight*2);
rimOffset=radius+spacing+3+outerRimThicness;// from where to drawe holer's rim


makeHolders=true;
makeLeftHolder=makeHolders && true;
makeRightHolder=makeHolders && true;

makeBody=true;

makeCovers=true;
makeLeftCover=makeCovers && true;
makeRightCover=makeCovers && true;

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

simpleOne=[                  
        [n,n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n,p,n]
        ];
        
mine14s6p=[
         [n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]       
            ];        
            
manArr=simpleOne;

debug=false;


function countPolarity(manArr,d)
    =[for(x=[0:len(manArr)-1])
        for(y=[0:len(manArr[x])-1])
            if(manArr[x][y]==d) 1             
    ];

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


left =[for(x=[0:len(manArr)-1])
   [x,0]
];
right=[for(x=[0:len(manArr)-1])
    [x,len(manArr[x])-1]
];
end=[for(x=[0:len(manArr[len(manArr)-1])-1])
    [len(manArr)-1,x]  
];

all=concat(start,right,left,end);


    
conv=[for(x=[0:len(all)-1])
     calc2D(all[x][0],all[x][1])      
];

if (makeRightCover){
    translate([0,0,holderActuallHeight+8]){
        makeCover();
    }
}

if (makeLeftCover){
    translate([0,0,-bodyHeight-2-holderActuallHeight-8]){
        makeCover();
    }
}

module makeCover(){
       difference(){            
            drawRim(conv,coverThickness,rimOffset+outerRimThicness);            
            drawStartHoles(boltDiameter);
            drawEndHoles(boltDiameter);
        }
}
    
if (makeRightHolder){
     drawHolder(false);
}


if (makeLeftHolder){
    translate([0,0,-bodyHeight-2]){
        mirror([0,0,90]){
          drawHolder(true);
        }
    }
}


if (makeBody){
    translate([0,0,-bodyHeight-holderHeight]){
        difference(){
            actuallBodyHeight=bodyHeight+(holderHeight*2);
            drawRim(conv,actuallBodyHeight,rimOffset+outerRimThicness);
            
            translate([0,0,-0.001]){            
               linear_extrude(actuallBodyHeight+0.002,center=false){                   
                    offset(r=rimOffset){
                        polygon(conv);
                    }
                }
            }               
            drawBMS(actuallBodyHeight);        
        }       
    }
}

module drawBMS(h=outerRimHeight){
        startPos=left[0];
        coord=calc2D(startPos[0],startPos[1]);        
        endPos=left[len(left)-1];
        coordStop=calc2D(endPos[0],endPos[1]);                
        bmsWidth=20;
        bmsLength=coordStop[0]-coord[0];        
        bmsX=coord[0];
        bmsY=coord[1]-radius-bmsWidth-spacing;
        
        translate([bmsX,bmsY,-0.001]){
            cube([bmsLength,bmsWidth,h+0.002]);
        }
}

module drawHolder(leftSide=true){
     difference(){
        drawRim(conv,outerRimHeight);  
         
       // drawBMS();
        
        for(a=[0:len(start)-1]){
            col=start[a][0];
            row=start[a][1];
            coord=calc2D(col,row);                
            rimHolesDiameter=2;
            translate([coord[0]-radius-(rimHolesDiameter/2),coord[1],-0.001]){                
                cylinder(d=rimHolesDiameter,h=holderActuallHeight+ stripTabHeight);                             
                //TODO: make smaller cube only strip size to fully lead wires
            }                    
        
            }           
        //TODO:makes holes account for covers, enlarge covers to body size 
        //TODO: makes this across all fours corners,take direction and signs into considaration
            
        drawStartHoles(boltDiameter);
        drawEndHoles(boltDiameter);
        drawHoles(manArr,leftSide);
    }
}
module drawStartHoles(boltDiameter){

        for(a=[0:len(start)-1]){
            col=start[a][0];
            row=start[a][1];
            coord=calc2D(col,row);
            isInner= (row %2)==1;
            if (isInner){
                spacingFromCellHole=1;
                boltX=coord[0]-(radius+boltDiameter+spacingFromCellHole) ;
                boltY=coord[1];
                translate([boltX,boltY,-0.001]){
                  cylinder(d=boltDiameter,h=holderActuallHeight+ stripTabHeight+coverThickness);
                }
            }
        }
}
module drawEndHoles(boltDiameter){
      for(a=[0:len(end)-1]){
            col=end[a][0];
            row=end[a][1];
            coord=calc2D(col,row);
            isInner= (row %2)==0;
            if (isInner){
                spacingFromCellHole=1;
                boltX=coord[0]+(radius+boltDiameter+spacingFromCellHole);
                boltY=coord[1];
                translate([boltX,boltY,-0.001]){
                  cylinder(d=boltDiameter,h=holderActuallHeight+ stripTabHeight+coverThickness);
                }
            }
        }
}
    
module drawRim(conv,rimHeight,offset=rimOffset){
    if (!debug){
        linear_extrude(rimHeight){
            offset(r=offset){
                polygon(conv);
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
function calc2D(col,row)
    =[ (radius*(row%2))+(col*holderDiameter)
       ,sin(angle)*holderDiameter*row];

function calcAbsolutePostion(col,row)
    =concat(calc2D(col,row),0);

module drawCell(pos,cell,left=true){
       
    col=pos[0];
    row=pos[1];              
       
    position=calcAbsolutePostion(col,row);
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
            }
        }       
    }else{
    }  
    
   
    
}    
    