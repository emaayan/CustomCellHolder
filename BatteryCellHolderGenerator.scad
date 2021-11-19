
cellHeight=64.2;
cellDiameter=18.7 ; //19.35;
cellUpperDiameter=18.45;//cellDiameter-0.45
holderHeight=10;  
spacing=0.75;
stripTabHeight=1.6;
stripWidth=8.2;
bodySpacing=0.4; 
bodyHeight=(cellHeight-(holderHeight*2))-bodySpacing;
//$fa=4;
innerSpacing=0;
s=0;
n=-1;
p=1;

makeWalls=true;
makeTopHolder=true;
makeBottomHolder=true;
makeHolder=makeTopHolder || makeBottomHolder ;
makeBMS=true;
makeLid=false;
lidThickness=1.5;
coverThicness= makeLid? lidThickness: 0;//1.2;

boltDiameter=4.6;
boltRadius=boltDiameter/2;  

bmsWireHole=3;
spacingInBody=2;//bmsWireHole;

bmsSpacingFromCells=(spacing*2)+boltRadius/2;


holderDiameter=cellDiameter+spacing;
holderRadius=holderDiameter/2;
stripLength=holderDiameter; 
angle=60;    

rimOffset=boltDiameter+spacing;
holderActuallHeight=holderHeight;
actuallHeight=holderHeight+stripTabHeight; 


*translate([650,500,0]) //bigone
    rotate([0,0,180])
        main([ 
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
    ] 
    ,[0,0],[0,6.5],16,makeTopHolder,makeBottomHolder,coverThicness); 



*translate([600,100,0])  //10s6p
    rotate([0,0,90])
        main([ 
         [n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ,[n,p,n,p,n,p,n,p,n,p,n,p,n,p]
        ]
        ,[0,0],[0,5],16,makeTopHolder,makeBottomHolder,coverThicness); 
        

*translate([50,50,0]) //10s1p
    rotate([0,0,90])       
        main([                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]             
        ] 
        ,[-0.0,0],[5.5,0],16,makeTopHolder,makeBottomHolder,coverThicness); 
   

    

*translate([300,0,0])    //14s1p
    rotate([0,0,0])
        main([                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]        
        ,[n,n]                     
        ,[n]                     
        ,[n]                     
        ,[n] 
        ]     
        ,[0,0],[6.5,0],17.5,makeTopHolder,makeBottomHolder,coverThicness); 
    


translate([500,0,0])   //small no bms
    rotate([0,0,0])
        main([                  
         [n,n,n,n]
        ,[n,n,n]
        ,[n]
        ]     
        ,[0,0],[0,0],0,makeTopHolder,makeBottomHolder,coverThicness); 


*translate([700,0,0])    //10s5p
    rotate([0,0,0])
        main([
     [n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]    
    ,[n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ]  
    ,[0,0],[4.3,0],16,makeTopHolder,makeBottomHolder,coverThicness);     


*translate([50,-100,0])   //10s3p 
    rotate([0,0,-90])
        main([
     [n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n,n]
    ]  
    ,[0,0],[0,6.1],10,makeTopHolder,makeBottomHolder,coverThicness);    



*translate([300,-100,0]) //triangle14s8p
    rotate([0,0,270])
        main([ 
     [p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n]
    ,[p,p,p,p,p,p,p,p,p,p,p,n,n,n,n,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n,n,n,n,n]
    ,[p,n,p,p,n,p,p,n,p,n,p,n,n,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n,n,n]
    ,[p,n,n,n,n,p,p,n,n,n,n]
    ,[n,n,n,n,n,n,n,n,n]    
    ,[n,n,n,n,n,n,n]    
    ,[n,n,n,n,n,n]  
    ] 
    ,[0,0],[5.5,0],16,makeTopHolder,makeBottomHolder,coverThicness);    
    
        


//TODO: shave off the body for bms wwires


module main(arr,bmsFrom,bmsTo,bmsThickness,makeLeftHolder,makeRightHolder,coverThicness){ 
          
     
     translate([0,0,actuallHeight]){
         drawHoles(arr){
             debugText();
         }
     }
     
     if (makeLeftHolder){
        translate([0,0,actuallHeight+20]){
           Cover(arr,bmsFrom,bmsTo,bmsThickness,coverThicness,false);
        }    
        CellHolder(arr,bmsFrom,bmsTo,bmsThickness,actuallHeight);
     }
     
     translate([0,0,-bodyHeight-5]){      
          if (makeRightHolder){
              translate([0,0,-actuallHeight-0.1]){      
                mirror([0,0,90]){
                    translate([0,0,actuallHeight+20]){
                        Cover(arr,bmsFrom,bmsTo,bmsThickness,coverThicness);
                    }    
                    CellHolder(arr,bmsFrom,bmsTo,bmsThickness,actuallHeight);          
                }
              }
          }
           if(makeWalls){               
               difference(){                   
                    OuterRim(arr,bmsFrom,bmsTo,bmsThickness,bodyHeight);
                     translate([0,0,-0.1]){ 
                         linear_extrude(height=bodyHeight+0.2){
                             offset(r=spacingInBody){                            
                                 drawHoles(arr){
                                        rotate(30){                                            
                                            circle(d=(holderDiameter/sin(60))+0.001,$fn=6);                                    
                                        }
                                 }
                             }
                         }
                         
                         Bms(bmsFrom,bmsTo,bmsThickness){         
                                
                                if($bmsH &&  $isBmsInStart){                            
                                    cube([$bmsXSize+holderRadius+bmsSpacingFromCells,$bmsYSize,bodyHeight+0.2]);     
                                }
                                if($bmsV && $isBmsInLeft){
                                    cube([$bmsXSize,$bmsYSize+holderRadius+bmsSpacingFromCells,bodyHeight+0.2]);     
                                }
                                if($bmsH &&  $isBmsInEnd){
                                    translate([-holderRadius-bmsSpacingFromCells,0,0]){
                                        cube([$bmsXSize+holderRadius+bmsSpacingFromCells,$bmsYSize,bodyHeight+0.2]);     
                                    }
                                }else{
                                   // cube([$bmsXSize,$bmsYSize,bodyHeight+0.2]); 
                                }
                                
                             
                                
                         }
                         Bolts(arr,bmsFrom,bmsTo,bmsThickness){
                            Bolt(bodyHeight+0.2);
                         };   
                         
                        bmsWires(arr,bmsFrom,bmsTo,bmsThickness,false){
                               translate([0,-0,(bodyHeight/2)+0.01]){
                                   cube([bmsWireHole*2,holderDiameter,bodyHeight+0.2],center=true);                                                           
                               }
                         }
                     }                                 
                     slice(arr,bmsThickness);
                                                              
                translate([0,0,-0.1]){   
                    Bolts(arr,bmsFrom,bmsTo,bmsThickness){
                        Bolt(bodyHeight+1);
                    };   
                }
              }           
               }
           }        
}


module bmsWires(arr,bmsFrom,bmsTo,bmsThickness,inHolder=true){
    drawHoles(arr){   
           fromCol=bmsFrom[0];
           fromRow=bmsFrom[1];
           toCol=bmsTo[0];
           toRow=bmsTo[1];
           
          off=spacing*2;
           if($drawHoles_isStart &&  $drawHoles_isOddRow){                                                 
                translate([-(holderRadius+bmsWireHole),0,-0.001]){                     
                    
                    translate([(bmsWireHole/2)-1,0,0]){
                        if (!$drawHoles_isRight){
                            children();
                        }else{
                            translate([0,-(holderRadius/4)-(bmsWireHole),0]){                                        
                                children();
                            }
                        }
                    }
                    
                    if (inHolder){
                        *cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);//wireHole 
                        ccube([bmsWireHole,stripWidth,holderHeight+stripTabHeight]);
                        if (!$drawHoles_isRight){
                            translate([0,0,holderHeight]){
                                ccube([bmsWireHole*2,holderDiameter,stripTabHeight]);
                            }                                                
                        }else{
                            translate([0,-(0)-(bmsWireHole),holderHeight]){                                        
                                ccube([bmsWireHole*2,holderDiameter,stripTabHeight]);
                            }
                        }                        
                        *translate([0,-holderRadius/2,0]){                             
                            cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);  //wireHole    
                            rotate([0,0,270]){
                                translate([bmsWireHole/2,0,holderHeight]){                           
                                    ccube([bmsWireHole,bmsWireHole,stripTabHeight]);
                                };
                            }  
                        }
                    }
                }                                                                                                               
           }           
           
           if($drawHoles_isLeft ){                       
                 if(!$drawHoles_isStart){                     

                         translate([-holderRadius,-holderRadius,0]){                                                            
                            translate([0,off,0]){                                
                                 rotate([0,0,90]){
                                    children();
                                 }
                             }
                             
                             if(inHolder){
                                 ccube([bmsWireHole*2,bmsWireHole,holderHeight+stripTabHeight]);                            
                                 translate([0,0,holderHeight]){                                 
                                    ccube([holderRadius,bmsWireHole*2,stripTabHeight]);
                                 } 
                             }
                         }
                     
                }
           }
           
           *if(!($drawHoles_isLeft && $drawHoles_isRight) &&   $drawHoles_isEnd   && !$drawHoles_isOddRow){
               
               translate([holderRadius+bmsWireHole,0,-0.001]){
                    translate([-(bmsWireHole/2)+1,0,0]){
                        if (!$drawHoles_isLeft ){
                            if (!$drawHoles_isRight){                                        
                                children();
                            }else{
                                translate([0,-(bmsWireHole/2),0]){                                         
                                    children();
                                }
                            }
                        }else{
                            //translate([0,(holderRadius-bmsWireHole),0]){//this was a bug shown 10s that cuts a gap
                            translate([0,(bmsWireHole),0]){
                              //  #cube([1,1,1],center=true);
                                children();
                            }
                        }
                    }
                    
                    cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);
                    rotate([0,0,180]){
                        translate([bmsWireHole/2,0,holderHeight]){                           
                            ccube([bmsWireHole,bmsWireHole,stripTabHeight]);
                        }  
                    } 
                   
                    translate([0,holderRadius/2,0]){                             
                        cylinder(d=bmsWireHole,holderHeight+stripTabHeight,$fn=20);
                        if(!$drawHoles_isRight){
                            rotate([0,0,90]){
                                translate([bmsWireHole/2,0,holderHeight]){                           
                                    ccube([bmsWireHole,bmsWireHole,stripTabHeight]);
                                };
                            }
                        }else{
                            rotate([0,0,180]){
                                translate([bmsWireHole,0,holderHeight]){                           
                                    ccube([bmsWireHole*2,bmsWireHole,stripTabHeight]);
                                };
                            }
                        }
                    }                         
                }  
            
                                     
                                
           }
           
           
           if($drawHoles_isRight && !$drawHoles_isEnd  ){             
            
           }
      
  }
}

module Cover(arr,bmsFrom,bmsTo,bmsThickness,coverThicness,isTop=false){
     if (coverThicness>0){
         difference(){
            CellHolder(arr,bmsFrom,bmsTo,bmsThickness,coverThicness,true);
            Bolts(arr,bmsFrom,bmsTo,bmsThickness){
                if (isTop){
                    cylinder(d1=boltDiameter,d2=boltDiameter+boltDiameter,h=coverThicness,$fn=20);     // d2 us based on m4 countersunk dimentions
                }else{
                    Bolt(coverThicness+0.2);
                }
            };     
         }
    }
}

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

module Bms(fromPoint,toPoint,bmsThickness){   
    if (makeBMS && bmsThickness>0){
        echo("Making BMS ",bmsThickness);            
        
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
            //    echo(fromPoint,toPoint,"Start");
                actuallFromPoint=[fromPoint[0]- (1  +(fromPoint[1] %2 ==0 ? 0: 0.5)),fromPoint[1]];                
                actuallToPoint=  [toPoint[0]-1,toPoint[1]];      
              //     echo(actuallFromPoint,toPoint,"Start");
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
            //    echo(fromPoint,toPoint,"ENd");                
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
              //  echo(fromPoint,toPoint,"left");
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



module CellHolder(arr,bmsFrom,bmsTo,bmsThickness,h,makeCover=false){
    echo("Cell Holder");
    difference(){
         
            translate([0,0,0.1]){                     
                 OuterRim(arr,bmsFrom,bmsTo,bmsThickness,h-0.2);                   
            }
            if(!makeCover){                      
                translate([0,0,-0.001]){               
                    
                    echo("Holder ");    
                    drawHoles(arr){
                        Cell();   
                    }
        
                    Bms(bmsFrom,bmsTo,bmsThickness){                                                                              
                        cube([$bmsXSize,$bmsYSize,h]); 
                        /*
                        if ($bmsH){
                            translate([$bmsX+15,-$bmsY/2,5]){                                             
                                rotate([0,90,0]){//TODO: MAKE SURE IT WORKS WITH BMS WITH ALL AXIS
                                    #cylinder(h=30,d=3.5,center=true);
                                    
                                }                                
                            }
                           
                       }
                       if($bmsV){
                           translate([$bmsX+15,$bmsY/2,5]){                                             
                                rotate([90,0,0]){//TODO: MAKE SURE IT WORKS WITH BMS WITH ALL AXIS
                                    #cylinder(h=30,d=3.5,center=true);
                                    
                                }                               
                            }
                           translate([$bmsX+15+50,-10,5]){ //50 is just test, should be variable for distance between bolts in bms                                            
                                rotate([90,0,0]){//TODO: MAKE SURE IT WORKS WITH BMS WITH ALL AXIS
                                    #cylinder(h=30,d=3.5,center=true);
                                    
                                }                                
                            }
                       }*/
                    } 
        
                    Bolts(arr,bmsFrom,bmsTo,bmsThickness){
                        Bolt(h);
                    };   
                    bmsWires(arr,bmsFrom,bmsTo,bmsThickness);
               }  
           }           
   } 
}




module OuterRim(arr,bmsFrom,bmsTo,bmsThickness,h){

    echo ("Outer Rim");
    linear_extrude(height=h){
       offset(r=rimOffset){
            hull(){              
              drawHoles(arr){
                rotate(30){                                           
                    circle(d=holderDiameter/sin(60),$fn=6);                                    
                }
              }
              Bms(bmsFrom,bmsTo,bmsThickness){                                                                                                                    
                    square([$bmsXSize,$bmsYSize]); 
              }
              Bolts(arr,bmsFrom,bmsTo,bmsThickness){
                     circle(d=boltDiameter);     
              };              
           }
       }
     }     
}                 

 

module Bolt(boltsHeight){
    cylinder(d=boltDiameter,boltsHeight,$fn=20);     
}

module Bolts(arr,bmsFrom,bmsTo,bmsThickness){       
     echo ("Bolts");
     drawHoles(arr){   
           fromCol=bmsFrom[0];
           fromRow=bmsFrom[1];
           toCol=bmsTo[0];
           toRow=bmsTo[1];
           
           off=rimOffset/1.5;// spacing*2;
           if($drawHoles_isStart && $drawHoles_isOddRow){                               
               translate([-cellDiameter,0,0]){    
                    if(  $drawHoles_col==fromCol && $drawHoles_col==toCol &&
                         $drawHoles_row>=fromRow && $drawHoles_row<=toRow 
                        ){
                                                    
                        translate([-(bmsSpacingFromCells+off+bmsThickness+boltRadius),0,0]){ 
                            children();                                    
                        }
                    }else{
                        children();
                    }
               }           
           }                      
           if(!($drawHoles_isLeft && $drawHoles_isRight) && $drawHoles_isEnd &&  !$drawHoles_isOddRow){
                 translate([cellDiameter,0,0]){
                      if( $drawHoles_col==fromCol && $drawHoles_col==toCol &&
                          $drawHoles_row>=fromRow && $drawHoles_row<=toRow ){
                              
                            translate([(bmsSpacingFromCells+off+bmsThickness+boltRadius),0,0]){ 
                                children();
                            }                            
                        }else{                          
                            children();
                        }                                                            
                 }                               
           }
           if($drawHoles_isLeft){                                     
                 if( $drawHoles_row==fromRow && $drawHoles_row==toRow &&
                     $drawHoles_col>=fromCol && $drawHoles_col<=toCol
                  ){

                     translate([-holderRadius,-holderRadius-bmsSpacingFromCells-off-bmsThickness-boltRadius,0]){                              
                        children();
                     }     
                 }else{
                     translate([-holderRadius,-holderRadius-off-spacingInBody,0]){                              
                       children();
                     }                              
                 }                                    
           }
           
           if($drawHoles_isRight 
               && !$drawHoles_isEnd 
               ){ 
             
             translate([holderRadius,holderRadius+off+spacingInBody,0]){                                                          
                 children();
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


    



module Cell(){
    actuallstripWidth= stripWidth;
    actuallStripLength=stripLength+0.001;
                       
   translate([0,0,holderHeight]){
       ccube([actuallStripLength,actuallstripWidth,stripTabHeight]);
        
       rotate(angle){
            ccube([actuallStripLength,actuallstripWidth,stripTabHeight]);
       }
       
       rotate(angle*2){
            ccube([actuallStripLength,actuallstripWidth,stripTabHeight]);//this creates a small invisible objects in s3d seperated connected mesh
       }                              
   } 
                         
   translate([0,0,0.1]){
      //cylinder(d=cellDiameter,h=holderHeight);
       cylinder(d1=cellDiameter,d2=cellUpperDiameter,h=holderHeight,$fn=90);//anything higher than 100 causes "ghost surfaces" in s3d after seperated connected surfaces
   }
}  


module ccube(dimentions){

    height=dimentions[2];
    translate([0,0,height/2]){
        cube(dimentions,center=true);
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

module slice(arr,bmsThickness){
    echo("Slice");
    sliceThickness=0.5;
    drawHoles(arr){                       
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
                if($drawHoles_isEnd 
                    && $drawHoles_isLeft
                    //&& !$drawHoles_isRight 
                ){
                
                   translate([holderRadius,0,-0.1]){
                       rotate([0,0,270]){
                            cube ([sliceThickness,holderDiameter+bmsThickness+rimOffset,bodyHeight+0.2]); 
                       }
                   }
                }
                
                
                if($drawHoles_isEnd && $drawHoles_isRight && !$drawHoles_isLeft  ){
                   translate([0,holderRadius,-0.1]){
                       // #cube ([sliceThickness,holderRadius,bodyHeight+0.2]); 
                   }
                }
            }
}                    


module drawHoles(arr){
    $drawHoles_colLength=len(arr)-1;
    for($drawHoles_col=[0:len(arr)-1]){
        
         colArr= arr[$drawHoles_col];        
        
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
             || $drawHoles_isRight && arr[$drawHoles_col+1][$drawHoles_row]==undef                      
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
