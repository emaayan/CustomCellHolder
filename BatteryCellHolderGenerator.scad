
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
    
  
    drawHoles(manArr){
     size=4;
     translate([0,-3,10]){
         rotate([0,0,90]){
             color("green"){
                %text(str(,$drawHoles_col,",",$drawHoles_row),size=size);
                 translate([8,0,0]){
                     if ( $drawHoles_isStart){                                                  
                            %text(str("^"),size=size);             
                     }
                     if ( $drawHoles_isRight){                
                        %text(str(">"),size=size);                                                                     
                     }
                     if ( $drawHoles_isLeft){                
                        %text(str("<"),size=size);                                                                     
                     }
                     if ( $drawHoles_isEnd){               
                        %text(str("_"),size=size);                                                                     
                     }
                 }
             }
       } 
     }                                                   
   }
   
  
       holder();
       bodyZ=cellHeight-(holderHeight*2);
       makeBody(bodyZ);
       translate([0,0,-bodyZ-2]){   
         mirror([0,0,90]){
            holder();
         }
       }
   
   
   
   /*
   holder();
    bodyZ=cellHeight-(holderHeight*2);
   difference(){
        makeBody(bodyZ);
       makeBolts();
   }
    */
     
}
module makeBolts(boltsHeight,z){
     drawHoles(manArr){   
            bmsWireHole=4;

           off=spacing*2;
           if($drawHoles_isStart){                       
               if($drawHoles_isOddRow){                                
                    translate([-cellDiameter+off,0,z]){ 
                        cylinder(d=boltDiameter,boltsHeight);                                                        
                    }
                    
                    translate([-holderRadius-(bmsWireHole/2),0,0.003]){
                        rotate([0,0,60]){
                            cylinder(d=bmsWireHole,holderHeight+0.006,$fn=3);
                        }
                    }
               }                         
           }
           if($drawHoles_isEnd && !$drawHoles_isLeft){
             translate([cellDiameter-off,0,z]){ 
                 if(!$drawHoles_isOddRow){                                
                     cylinder(d=boltDiameter,boltsHeight);                                
                 }
             } 
           }
           if($drawHoles_isLeft && !$drawHoles_isStart){                       
             translate([-holderRadius,-holderRadius-off,z]){                              
               cylinder(d=boltDiameter,boltsHeight);                        
             } 
           }
           
           if($drawHoles_isRight && !$drawHoles_isEnd ){                                                
             translate([holderRadius,holderRadius+off,z]){                                                          
                 cylinder(d=boltDiameter,boltsHeight);                        
             }
           }
      
  }
}
module profile(r){
       offset(r){ 
           projection(){
                design(){
                  drawHoles(manArr){                                      
                    cover=holderDiameter/sin(60);
                    translate([0,0,-(holderHeight+(stripTabHeight/2))]){
                        rotate(30){
                          cylinder(d=cover,h=holderHeight+stripTabHeight-0.001,$fn=6);                                                   
                        }
                     
                    }
                  }
               
                };          
           }
       }
}        
module makeBody(bodyZ){
    translate([0,0,-bodyZ-1]){  
         difference(){    
             shell(bodyZ);
             
             
             translate([0,0,-0.1]){
                  linear_extrude(cellHeight+0.2){
                    profile(innerSpacing);
                  }
             }
             makeBolts(cellHeight-(holderHeight*2)+0.002,-0.001);     
         //  makeBolts(cellHeight-(holderHeight*2));
         }
         
        linear_extrude(bodyZ){//slice
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
       pos=calc2D([a[0]+xCol,a[1]+yCol],xOffset,yOffset);
       coord=concat(pos,-0.001  );
       translate (coord){           
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
                profile(rimOffset);
           }
     } 
}

module holder(){
     difference(){
           shell(holderActuallHeight);
           makeBolts(holderActuallHeight+0.002,-0.001);    
           translate([0,0,-cellHeight+holderActuallHeight+1.1]){
              //#bolts(cellHeight+0.002);                              
               
           }     
           
           
           translate([0,0,0]){
                design(){                    
                       drawHoles(manArr){                                                     
                           translate([0,0,-(holderHeight+(stripTabHeight/2))]){                          
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
}

module design(){
                  
    //    Z=holderActuallHeight;       
    //    pos=calc2D([row,col,Z]);                  
   //     bms(pos);
         
        translate([0,0,holderActuallHeight]){               
            //bolts(cellHeight+holderHeight);
            children();                                      
        }                    
}
    
$drawHoles_cell=undef;
$drawHoles_col=undef;
$drawHoles_row=undef;
$drawHoles_isOddRow=undef;
$drawHoles_x=undef;
$drawHoles_y=undef;
$drawHoles_z=undef;
$drawHoles_colLength=undef;
$drawHoles_rowLength=undef;
$drawHoles_isStart=undef;
$drawHoles_isRight=undef;
$drawHoles_isEnd=undef;
$drawHoles_isLeft=undef;

module drawHoles(manArr){
    $drawHoles_colLength=len(manArr)-1;
    for($drawHoles_col=[0:len(manArr)-1]){
        
         colArr= manArr[$drawHoles_col];        
        
         $drawHoles_rowLength=len(colArr)-1;
         for($drawHoles_row=[0:$drawHoles_rowLength]){
            $drawHoles_isOddRow=($drawHoles_row%2)==1;            
            $drawHoles_cell=colArr[$drawHoles_row];                                
            position=concat(calc2D([$drawHoles_col,$drawHoles_row]),0);
             
            $drawHoles_x=position[0];
            $drawHoles_y=position[1];
            $drawHoles_z=position[2];
             
            $drawHoles_isStart=$drawHoles_col==0;
            $drawHoles_isRight=$drawHoles_row==$drawHoles_rowLength;
            $drawHoles_isLeft = $drawHoles_row==0;
            $drawHoles_isEnd  = $drawHoles_col==$drawHoles_colLength 
             || $drawHoles_isRight && manArr[$drawHoles_col+1][$drawHoles_row]==undef                      
             ;
            
            
            //echo($drawHoles_col,$drawHoles_row,$drawHoles_isStart,$drawHoles_isRight);
            translate([$drawHoles_x,$drawHoles_y,$drawHoles_z]){                      
                 children();                                      
            }
        }
   }                   
}    
   


function calc2D(coord,xOffset=0,yOffset=0)
    =[  ((holderRadius *(coord[1]%2))+(coord[0]*holderDiameter))+xOffset
       ,(sin(angle)*holderDiameter*coord[1]) +yOffset];


 
    