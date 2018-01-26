cellHeight=65;
cellDiameter=19.2;
holderHeight=7;
spacing=0.7;
stripTabHeight=1.5;
stripWidth=8;
coverThickness=2;
outerRimThicness=3;
stripDiff=-2;

holderDiameter=cellDiameter+spacing;
stripLength=holderDiameter+0.001; 
angle=60;    
radius=holderDiameter/2;         

holderActuallHeight=holderHeight+0.002;
stripZ=holderHeight+(stripTabHeight/2);                            


outerRimHeight=holderHeight+stripTabHeight-0.001;

bodyHeight=cellHeight-(holderHeight*2);
rimOffset=radius+spacing+outerRimThicness;


makeHolders=true;
makeLeftHolder=makeHolders && true;
makeRightHolder=makeHolders && false;

makeBody=false;

makeCovers=false;
makeLeftCover=makeCovers && true;
makeRightCover=makeCovers && true;




s=0;
n=-1;
p=1;

manArr=[
     [s,p,p,p,p,p,p,p,p,p,p,p,n,n]
    ,[s,p,p,p,p,p,p,p,p,p,p,p,n,n,n]
    ,[s,p,n,p,p,n,p,p,n,p,n,p,n,n,n]
    ,[s,p,n,p,p,n,p,p,n,p,n,p,n,n]
    ,[s,p,n,n,n,n,p,p,n,n,n,n,n]
    ,[s,p,n,n,n,n,p,p,n,n,n]
    ,[s,n,n,n,n,n,n,n,n]
    ];


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
echo("Negatives",negatives," Positives",positives,"Total :",total,"Serial: ",total/group );
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
        drawHoles(manArr);
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
            drawHoles(manArr);
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
module drawHoles(manArr){
    for(c=[0:len(manArr)-1]){
         col= manArr[c];
         for(r=[0:len(col)-1]){
             cell=col[r];
             //if (cell){              
                 drawCell([c,r],cell);  
             //}else{
               
             //}
         }     
    }  
}
function calc2D(col,row)
    =[ (radius*(row%2))+(col*holderDiameter)
       ,sin(angle)*holderDiameter*row];

function calcAbsolutePostion(col,row)
    =concat(calc2D(col,row),0);

module drawCell(pos,cell=true){
       
    col=pos[0];
    row=pos[1];              
       
    position=calcAbsolutePostion(col,row);
    x=position[0];
    y=position[1];
    z=position[2];
    holderZ=z-0.001;      
    if(cell==n || cell==p){
        translate([x,y,z]){
            
            translate([0,0,stripZ]){               
               actuallstripWidth= stripWidth+ (cell==n ?0:stripDiff);
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
            clr= cell==n ? "black" :"red";
            color(clr){
                cylinder(d=cellDiameter,h=holderActuallHeight);
            }
        }
        
    }  
    else{        
        
        translate([x,y-outerRimThicness,holderZ+holderActuallHeight-holderHeight]){       
           cube([stripLength,cellDiameter-spacing,stripTabHeight+holderActuallHeight],center=true);
        }   
    }   
    
   
    
}    
    