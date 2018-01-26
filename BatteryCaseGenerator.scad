cellHeight=65;
cellDiameter=18.95;
holderHeight=8;
spacing=0.7;
stripTabHeight=1.5;
stripWidth=8;
outerRimThicness=3;
stripDiff=-1;// how small make the strip in plus side

coverThickness=2;

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
makeRightHolder=makeHolders && false;

makeBody=false;

makeCovers=false;
makeLeftCover=makeCovers && true;
makeRightCover=makeCovers && false;

s=0;
n=-1;
p=1;

trangle14s6p
    =[ 
     [s,p,p,p,p,p,p,p,p,p,p,p,n,n]
    ,[s,p,p,p,p,p,p,p,p,p,p,p,n,n,n]
    ,[s,p,n,p,p,n,p,p,n,p,n,p,n,n,n]
    ,[s,p,n,p,p,n,p,p,n,p,n,p,n,n]
    ,[s,p,n,n,n,n,p,p,n,n,n,n,n]
    ,[s,p,n,n,n,n,p,p,n,n,n]
    ,[s,n,n,n,n,n,n,n,n]
    ];
    
custom20s10p
=[ 
     [s,p,n,p,p,p,n,p,p]
    ,[s,p,n,p,p,p,n,p,p,n]
    ,[s,p,n,p,n,p,n,p,p,n]
    ,[s,p,n,p,n,p,n,p,p,n,n]
    ,[s,p,n,p,n,p,n,p,p,p,p,n,n]
    ,[s,p,n,p,n,p,n,p,p,p,p,n,n]
    ,[s,p,n,p,n,p,n,p,p,p,p,n,n]
    ,[s,p,n,p,n,p,n,p,p,p,p,n,n]
    ,[s,p,n,p,n,n,n,p,p,p,p,n,n]
    ,[s,p,n,p,n,n,n,p,p,p,p,n,n]
    ,[s,n,p,n,n,n,p,n,p,n,p,n]
    ,[s,n,p,n,n,n,p,n,p,n,p,n]
    ,[s,n,p,n,p,n,p,n,p,n,p,n]
    ,[s,n,p,n,p,n,p,n,p,n,n]
    ,[s,n,p,n,p,n,p,n,n,n,n]
    ,[s,n,p,n,p,n,p,n,n,n,n]    
    ,[s,n,p,n,p,n,p,n,n]
    ,[s,n,p,n,p,n,p,n]
    ,[s,n,p,n,p,p,p]
    ,[s,n,p,n,p]
    ,[s,n,p,p,p]
    ];

simpleOne=[
         [p,p,n,s]
        ,[p,p,n,s]
        ,[n,n,p,s]
        ,[n,n,p,s]
        ,[n,n,p,s]
        ,[n,n,p,s]
        ];
manArr=simpleOne;

function countPolarity(manArr,d)
    =[for(x=[0:len(manArr)-1])
        for(y=[0:len(manArr[x])-1])
            if(manArr[x][y]==d) 1             
    ];

negatives=len(countPolarity(manArr,n));
positives=len(countPolarity(manArr,p));
total=negatives+positives;
group=10;
            
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
        drawRim(conv,coverThickness);
    }
}

if (makeRightHolder){
    difference(){
        drawRim(conv);
        drawHoles(manArr,false);
    }
}

if (makeBody){
    translate([0,0,-bodyHeight-1]){
        difference(){
            drawRim(conv,bodyHeight);        
            translate([0,0,-0.001]){            
               linear_extrude(bodyHeight+0.002,center=false){
                    offset(r=rimOffset-outerRimThicness,chamfer=true){
                        polygon(conv);
                    }
                }
            }               
        }       
    }
}
if (makeLeftHolder){
    translate([0,0,-bodyHeight-2]){
        mirror([0,0,90]){
          difference(){
            drawRim(conv);
            drawHoles(manArr,true);
          }
        }
    }
}

if (makeLeftCover){
    translate([0,0,-bodyHeight-2-holderActuallHeight-8]){
        drawRim(conv,coverThickness);
    }
}

module drawRim(conv,rimHeight=outerRimHeight){
    linear_extrude(rimHeight){
        offset(r=rimOffset){
            polygon(conv);
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

module drawCell(pos,cell=true,left=true){
       
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
        
    }  
    else{   
        translate([x,y+spacing+1,holderZ+holderActuallHeight-(holderHeight/1.5)]){       
           cube([stripLength+spacing,16,stripTabHeight+holderActuallHeight],center=true);
        }           
        *translate([x,y-outerRimThicness,holderZ+holderActuallHeight-holderHeight]){       
           cube([stripLength,cellDiameter-spacing,stripTabHeight+holderActuallHeight],center=true);
        }   
    }   
    
   
    
}    
    