
cellHeight=66;
cellDiameter=18.85;
holderHeight=7;
spacing=0.6;
stripTabHeight=1.5;
stripWidth=8.5;
bodyHeight=cellHeight-(holderHeight*2);

stripDiff=0.5;// how small make the strip in plus side
innerSpacing=0;
s=0;
n=-1;
p=1;

makeHolder=true;
makeLeftHolder=makeHolder && true;
makeRightHolder=makeHolder && true;
makeBMS=true;
boltDiameter=4.7;
boltRadius=boltDiameter/2;  


bmsSpacingFromCells=spacing+boltRadius/2;




trangle14s8p
    =[ 
     [p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n,n]
    ,[p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n]
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
         [n,n,n,n]
        ,[n,n,n,n,n]
        ,[n,n,n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]      
        
        ];
 


//manArr=trangle14s8p; from=[0,0]; to=[5,0]; bmsThickness=16;
//manArr=custom20s10p;
manArr=mine14s6p; from=[0,0]; to=[5,0];  bmsThickness=16;

//manArr=std10s3p; from=[0,0]; to=[0,6]; bmsThickness=16;
//manArr=std10s3p; from=[2,0]; to=[2,6.1];bmsThickness=16;
//manArr=simpleOne; from=[0,0]; to=[4,0]; bmsThickness=10;
 



holderDiameter=cellDiameter+spacing;
holderRadius=holderDiameter/2;
stripLength=holderDiameter; 
angle=60;    

rimOffset=boltDiameter+spacing;
holderActuallHeight=holderHeight;



//translate([holderDiameter,holderDiameter+bmsThickness+rimOffset,0]){    
    main();
//}

$bmsLength=undef;
$bmsWidth=undef;
$bmsHeight=undef;
$bmsX=undef;
$bmsY=undef;  
$bmsXSize=undef;
$bmsYSize=undef;
$isBmsInStart=undef;
$isBmsInEnd=undef;
$isBmsInLeft=undef;
$bmsH=undef;
$bmsV=undef;

module Bms(fromPoint,toPoint){   
    if (makeBMS){
        senseWires=1;                       
        $bmsHeight=holderActuallHeight+stripTabHeight;//+0.002;
        
        
        $bmsH=fromPoint[0]==toPoint[0];
        $bmsV=fromPoint[1]==toPoint[1];        
        
        $isBmsInStart=$bmsH && toPoint[0]==0;
        $isBmsInEnd=$bmsH && !$isBmsInStart;
        $isBmsInLeft=$bmsV && toPoint[1]==0;        
        isRight=$bmsV && !$isBmsInLeft;
        
            bmsActuallThickness=bmsThickness;
            pointDiff= toPoint[1]-fromPoint[1];
            if ($isBmsInStart){
                echo(fromPoint,toPoint,"Start BMS");
                actuallFromPoint=[fromPoint[0]- (1  +(fromPoint[1] %2 ==0 ? 0: 0.5)),fromPoint[1]];                
                actuallToPoint=  [toPoint[0]-1,toPoint[1]];      
                
                fromCoord=calc2D(actuallFromPoint);
                
                toCoord=calc2D(actuallToPoint);
                echo(fromCoord[0],actuallFromPoint,fromCoord);
                $bmsX=fromCoord[0]+holderRadius-(bmsThickness+bmsSpacingFromCells);
                $bmsY=fromCoord[1]-holderRadius;
                $bmsZ=-0.001;
                
                $bmsYSize=toCoord[1]-fromCoord[1]+holderDiameter;
                $bmsXSize=bmsActuallThickness;
                translate([$bmsX,$bmsY,0]){                       
                   children();
                }
           
            } 
            if ($isBmsInEnd){ 
                echo(fromPoint,toPoint,"ENd");                
                actuallFromPoint=[fromPoint[0]+ (1  -(fromPoint[1] %2 ==0 ? 0: 0.5)),fromPoint[1]];                
                actuallToPoint=  [toPoint[0]+    1,                                  toPoint[1]];      
                
                fromCoord=calc2D(actuallFromPoint);
                toCoord=calc2D(actuallToPoint);
                
                $bmsX=fromCoord[0]+bmsSpacingFromCells;
                $bmsY=fromCoord[1]-holderRadius;
                $bmsZ=-0.001;
                
                $bmsYSize=toCoord[1]-fromCoord[1]+holderDiameter;
                $bmsXSize=bmsActuallThickness;
                translate([$bmsX,$bmsY,0]){                       
                   children();
                }
           
            }
            if ($isBmsInLeft){                               
                echo(fromPoint,toPoint,"left");
                actuallFromPoint=[fromPoint[0],fromPoint[1]];
                actuallToPoint= [toPoint[0],toPoint[1]];
          
                fromCoord=calc2D(actuallFromPoint);
                toCoord=calc2D(actuallToPoint);
                
                $bmsX=fromCoord[0]-holderRadius;
                $bmsY=fromCoord[1]-holderRadius-bmsSpacingFromCells-bmsThickness;
                $bmsZ=-0.001;
                               
                $bmsXSize=toCoord[0]-fromCoord[0]+holderDiameter;
                $bmsYSize=bmsActuallThickness;
                
                translate([$bmsX,$bmsY,0]){                                           
                   children();                                      
                }
            }
                        
    }
}          
module ccube(dimentions){

    height=dimentions[2];
    translate([0,0,height/2]){
        cube(dimentions,center=true);
    }
}

module CellHolder(){
    difference(){
         
            translate([0,0,0.1]){                     
                 OuterRim(actuallHeight-0.2);                   
            }
            
           
            translate([0,0,-0.001]){               
                Holder(actuallHeight); 
           }                              
     } 
}
actuallHeight=holderHeight+stripTabHeight; 
module main(){ 
   
     translate([0,0,actuallHeight]){
         drawHoles(manArr){
             debugText();
         }
     }
     
         if (makeLeftHolder){
            CellHolder();
         }
      translate([0,0,-bodyHeight-0.1]){      
          if (makeRightHolder){
          translate([0,0,-actuallHeight-0.1]){      
            mirror([0,0,90]){
                CellHolder();          
            }
          }
      }
      
           difference(){
                 OuterRim(bodyHeight);
                 translate([0,0,-0.1]){ 
                     drawHoles(manArr){
                            rotate(30){
                                cylinder(d=(holderDiameter/sin(60))+0.1,h=bodyHeight+01,$fn=6);                                    
                            }
                     }
                     Bms(from,to){         
                            
                            if($bmsH &&  $isBmsInStart){
                                cube([$bmsXSize+holderRadius,$bmsYSize,bodyHeight+0.2]);     
                            }
                            if($bmsV && $isBmsInLeft){
                                cube([$bmsXSize,$bmsYSize+holderRadius,bodyHeight+0.2]);     
                            }
                            if($bmsH &&  $isBmsInEnd){
                                translate([-holderDiameter,0,0]){
                                    cube([$bmsXSize+holderDiameter,$bmsYSize,bodyHeight+0.2]);     
                                }
                            }else{
                                cube([$bmsXSize,$bmsYSize,bodyHeight+0.2]); 
                            }
                            
                         
                            
                     }
                     makeBolts(bodyHeight+0.2){
                         cube([bmsWireHole*2,(holderDiameter/sin(60)),bodyHeight+0.3],center=true);
                     }
                 }                                 
                 #slice();
                     
                    
                   
            translate([0,0,-0.1]){   
                makeBolts(bodyHeight+1);
                
            }
          }      
     }
         
}
module slice(){
    sliceThickness=0.5;
    drawHoles(manArr){                       
                if($drawHoles_isStart && $drawHoles_isLeft ){
                   translate([0,0,-0.1]){
                       rotate([0,0,90]){
                        cube ([sliceThickness,holderDiameter+bmsThickness+rimOffset,bodyHeight+0.2]); 
                       }
                   }
                }
                 if($drawHoles_isStart && $drawHoles_isRight ){
                   translate([0,holderRadius,-0.1]){
                       cube ([sliceThickness,holderDiameter,bodyHeight+0.2]); 
                   }
                }
                if($drawHoles_isEnd && $drawHoles_isLeft && !$drawHoles_isRight ){
                   translate([holderRadius,0,-0.1]){
                       rotate([0,0,270]){
                            cube ([sliceThickness,holderDiameter+bmsThickness+rimOffset,bodyHeight+0.2]); 
                       }
                   }
                }
                if($drawHoles_isEnd && $drawHoles_isRight && !$drawHoles_isLeft  ){
                   translate([0,holderRadius,-0.1]){
                 //       cube ([sliceThickness,holderRadius,bodyHeight+0.2]); 
                   }
                }
            }
}                    
module OuterRim(h){
    
    linear_extrude(h){
                   offset(r=rimOffset){
                        hull(){
                          projection(){
                              drawHoles(manArr){
                                rotate(30){
                                    cylinder(d=holderDiameter/sin(60),h=1,$fn=6);                                    
                                }
                              }
                              Bms(from,to){                                                                              
                                  cube([$bmsXSize,$bmsYSize,1]); 
                              }
                              makeBolts(bodyHeight); 
                          }
                       }
                   }
                 }     
}                 
module Cells(){
     drawHoles(manArr){
               actuallstripWidth= stripWidth;
               actuallStripLength=stripLength+0.001;
                       
                           translate([0,0,holderHeight]){
                               ccube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                                
                               rotate(angle){
                                    ccube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                               }
                               
                               rotate(angle*2){
                                    ccube([actuallStripLength,actuallstripWidth,stripTabHeight],center=true);
                               }                              
                           } 
                                             
                       translate([0,0,0.1]){
                           cylinder(d=cellDiameter,h=holderHeight);                                                                                     
                       }
     }
}

module Holder(h){
    Cells();
    Bms(from,to){                                                                              
        cube([$bmsXSize,$bmsYSize,h]); 
    } 
    
    translate([0,0,0]){
        makeBolts(h);
    }    
}
bmsWireHole=2.5;
module makeBolts(boltsHeight){
     drawHoles(manArr){   
           fromCol=from[0];
           fromRow=from[1];
           toCol=to[0];
           toRow=to[1];
           
           off=spacing*2;
           if($drawHoles_isStart && $drawHoles_isOddRow){
               
                    if(!$drawHoles_isRight){                            
                        if( $drawHoles_col==fromCol && $drawHoles_col==toCol &&
                             $drawHoles_row>=fromRow && $drawHoles_row<=toRow 
                            ){
                            xMe=-holderDiameter-bmsSpacingFromCells-bmsThickness-boltDiameter-off;//-off-()-boltDiameter;
                            translate([xMe,0,0]){ 
                                cylinder(d=boltDiameter,boltsHeight);                                                        
                            }
                        }else{
                            translate([-holderDiameter+boltRadius,0,0]){ 
                                cylinder(d=boltDiameter,boltsHeight);                                                        
                            }
                        }
                    }
                    
                    translate([-holderRadius-bmsWireHole,(-holderRadius*sin(60))+bmsWireHole,-0.001]){               
                            cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);      
                    }
                    translate([-holderRadius-bmsWireHole,0,-0.001]){                     
                        cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);
                        
                        translate([bmsWireHole/2,0,bodyHeight/2]){
                            if (!$drawHoles_isRight){
                                children();
                            }
                            
                        }
                        translate([bmsWireHole/2,0,holderHeight]){                           
                            ccube([bmsWireHole,bmsWireHole,stripTabHeight],center=true);
                        }                                                
                    }                   
                                                     
             
           }            
           if($drawHoles_isEnd && !$drawHoles_isLeft){
             translate([cellDiameter-off,0,0]){ 
                 if(!$drawHoles_isOddRow){
                      if( $drawHoles_col==fromCol && $drawHoles_col==toCol &&
                          $drawHoles_row>=fromRow && $drawHoles_row<=toRow ){
                            translate([(bmsSpacingFromCells+bmsThickness+boltDiameter+off),0,0]){ 
                                cylinder(d=boltDiameter,boltsHeight);                                                        
                            }
                            
                        }else{
                            translate([0,0,0]){ 
                                cylinder(d=boltDiameter,boltsHeight);                                                        
                            }                            
                        }
                        
                        translate([-holderRadius+bmsWireHole,0,-0.001]){
                            translate([off,(-holderRadius*sin(60))+bmsWireHole,-0.001]){               
                                cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);      
                            }
                            translate([off,0,0]){                                 
                                cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);                                                            
                                 translate([-(bmsWireHole/2),0,bodyHeight/2]){
                                    if (!$drawHoles_isRight){
                                        children();
                                    }
                            
                                 }
                            }
                            translate([0,0,holderHeight]){                           
                                ccube([bmsWireHole,bmsWireHole,(stripTabHeight)],center=true);
                            }                                                
                         }
                 }
             }
                                     
                                
           }
           if($drawHoles_isLeft && !$drawHoles_isStart){                       
               
             if( $drawHoles_row==fromRow && $drawHoles_row==toRow &&
                 $drawHoles_col>=fromCol && $drawHoles_col-1<=toCol
              ){

                 translate([-holderRadius,-holderRadius-bmsSpacingFromCells-bmsThickness-boltDiameter-off,0]){                              
                   cylinder(d=boltDiameter,boltsHeight);                        
                 }     
             }else{
                 translate([-holderRadius,-holderRadius-off-bmsWireHole,0]){                              
                   cylinder(d=boltDiameter,boltsHeight);
                 }     
                 
             }
             translate([-holderRadius,-holderRadius+off,0]){  
                cylinder(d=bmsWireHole,boltsHeight);
                 translate([0,0,holderHeight]){                           
                    ccube([holderRadius,bmsWireHole,(stripTabHeight)],center=true);
                 } 
             }
           }
           
           if($drawHoles_isRight && !$drawHoles_isEnd  ){ 
             
             translate([holderRadius,holderRadius+off,0]){                                                          
                 cylinder(d=boltDiameter,boltsHeight);                        
             }
           }
      
  }
}




module debugText(){
    size=4;
     translate([0,-3,0]){
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
             
            $drawHoles_isStart=$drawHoles_col==0;
            $drawHoles_isRight=$drawHoles_row==$drawHoles_rowLength;
            $drawHoles_isLeft = $drawHoles_row==0;
            $drawHoles_isEnd  = $drawHoles_col==$drawHoles_colLength 
             || $drawHoles_isRight && manArr[$drawHoles_col+1][$drawHoles_row]==undef                      
             ;
                                   
            translate([$drawHoles_x,$drawHoles_y,0]){                      
                 children();                                       
            }
        }
   }                   
}    
   



function calc2D(coord)
    =[  ((holderRadius *(coord[1]%2))+(coord[0]*holderDiameter))
       ,( sin(angle)   *holderDiameter*coord[1]) ];
