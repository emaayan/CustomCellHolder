
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

makeHolder=true;
makeLeftHolder=makeHolder && false;
makeRightHolder=makeHolder && true;
makeBMS=true;

  

bmsThickness=10;
bmsSpacingFromCells=5;




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
manArr=std10s3p;
fromCol=0; fromRow=0; toCol=0;   toRow=6;
//manArr=simpleOne;         
//fromCol=0; fromRow=0; toCol=5;   toRow=0;
 
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
   
   if (makeLeftHolder){
       holder();
   }
       bodyZ=cellHeight-(holderHeight*2);
   
       makeBody(bodyZ);
       translate([0,0,-bodyZ-2]){   
         mirror([0,0,90]){
             if (makeRightHolder){
                    holder();
             }
         }
       }
           
}
module makeBolts(boltsHeight,z,bmsWires=true){
     drawHoles(manArr){   
           bmsWireHole=2.5;
           off=spacing*2;
           if($drawHoles_isStart){
               if($drawHoles_isOddRow){                    
                    if(!$drawHoles_isRight){                       
                        translate([-cellDiameter+off,0,z]){ 
                            cylinder(d=boltDiameter,boltsHeight);                                                        
                        }
                    }
               }                                       
               if(!$drawHoles_isOddRow){
               if(bmsWires){
                    translate([-holderRadius-(bmsWireHole),0,-0.001]){
                        rotate([0,0,45]){
                            #cylinder(d=bmsWireHole,holderHeight+0.004,$fn=20);                            
                        }
                        translate([bmsWireHole/2,0,holderHeight-(stripTabHeight/4)]){                           
                            cube([bmsWireHole,bmsWireHole,(stripTabHeight/2)+0.02],center=true);
                        }                                                
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
           
           if($drawHoles_isRight && !$drawHoles_isEnd  ){                                                
             translate([holderRadius,holderRadius+off,z]){                                                          
                 cylinder(d=boltDiameter,boltsHeight);                        
             }
           }
      
  }
}
module profile(r){
       offset(r){ 
           projection(){
                design(true){
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
             makeBolts(cellHeight-(holderHeight*2)+0.002,-0.001,false);     

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




$bmsLength=undef;
$bmsWidth=undef;
$bmsHeight=undef;
$bmsX=undef;
$bmsY=undef;

//bms([0,0],[0,4]); //Start 
//bms([2,1],[2,5]); //End
//bms([1,0],[2,0]);// left



module bms(fromPoint,toPoint,isBody=false){
   

    if (makeBMS){
                                    
        $bmsHeight=holderActuallHeight;//+0.002;
        
        
        isHorizontal=fromPoint[0]==toPoint[0];
        isVertical=fromPoint[1]==toPoint[1];        
        
        isStart=isHorizontal && toPoint[0]==0;
        isEnd=isHorizontal && !isStart;
        isLeft=isVertical && toPoint[1]==0;        
        isRight=isVertical && !isLeft;
        
            bmsActuallThickness=bmsThickness+ (isBody? holderRadius+rimOffset+bmsSpacingFromCells :0);       
            pointDiff= toPoint[1]-fromPoint[1];
            if (isStart){
                echo(fromPoint,toPoint,"Start");
                actuallFromPoint=[fromPoint[0]- (1  +(fromPoint[1] %2 ==0 ? 0: 0.5)),fromPoint[1]];                
                actuallToPoint=  [toPoint[0]-1,toPoint[1]];      
                
                fromCoord=calc2D(actuallFromPoint);
                toCoord=calc2D(actuallToPoint);
                
                $bmsX=fromCoord[0]-bmsSpacingFromCells;
                $bmsY=fromCoord[1];
                $bmsZ=-0.001;
                
                $bmsYSize=toCoord[1]-fromCoord[1];
                $bmsXSize=bmsActuallThickness;
                translate([$bmsX,$bmsY,$bmsZ]){     
                  cube([$bmsXSize,$bmsYSize,$bmsHeight+0.003]);         
                }
           
            } 
            if (isEnd){ 
                echo(fromPoint,toPoint,"ENd");                
                actuallFromPoint=[fromPoint[0]+ (1  -(fromPoint[1] %2 ==0 ? 0: 0.5)),fromPoint[1]];                
                actuallToPoint=  [toPoint[0]+    1,                                  toPoint[1]];      
                
                fromCoord=calc2D(actuallFromPoint);
                toCoord=calc2D(actuallToPoint);
                
                $bmsX=fromCoord[0]+bmsSpacingFromCells;
                $bmsY=fromCoord[1];
                $bmsZ=-0.001;
                
                $bmsYSize=toCoord[1]-fromCoord[1];
                $bmsXSize=bmsActuallThickness;
                translate([$bmsX,$bmsY,$bmsZ]){     
                  cube([$bmsXSize,$bmsYSize,$bmsHeight+0.003]);         
                }
           
            }
            if (isLeft){                               
                echo(fromPoint,toPoint,"left");
                actuallFromPoint=[fromPoint[0],fromPoint[1]];
                actuallToPoint= [toPoint[0],toPoint[1]];
          
                fromCoord=calc2D(actuallFromPoint);
                toCoord=calc2D(actuallToPoint);
                
                $bmsX=fromCoord[0];
                $bmsY=fromCoord[1]-holderRadius-bmsSpacingFromCells-bmsThickness;
                $bmsZ=-0.001;
                               
                $bmsXSize=toCoord[0]-fromCoord[0];
                $bmsYSize=bmsActuallThickness;
                translate([$bmsX,$bmsY,$bmsZ-0.001]){     
                  cube([$bmsXSize,$bmsYSize,$bmsHeight+0.003]);         
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

module design(isBody=false){
                      
        
        bms([fromCol,fromRow],[toCol,toRow],isBody);
        translate([0,0,holderActuallHeight]){                           
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
            position=concat(calc2D([$drawHoles_col,$drawHoles_row]));
             
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
   



function calc2D(coord)
    =[  ((holderRadius *(coord[1]%2))+(coord[0]*holderDiameter))
       ,( sin(angle)   *holderDiameter*coord[1]) ];
