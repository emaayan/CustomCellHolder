n=-1;
spacing=0.7;
simpleOne=[                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]
        ,[n]      
         
        ];
cellHeight=66;
cellDiameter=18.85;
holderDiameter=cellDiameter+spacing;
holderRadius=holderDiameter/2;
stripLength=holderDiameter; 
angle=60;    

manArr=simpleOne; fromCol=1; fromRow=0; toCol=4;   toRow=0;
main();

module overlap(h,dup=false){    
     overlap=0.001;
     translate([0,0,-overlap]){                                              
        resize([0,0,h+(overlap*2)]){           
            children();
        }
    }
}
module main(){  
       
     difference(){                
            linear_extrude(height=8){
            hull(){
                drawHoles(manArr){                            
                       circle(d=holderDiameter);                                       
                } 
            }  
            }          
             
             drawHoles(manArr){                    
                overlap(8){
                   cylinder(d=cellDiameter,h=0.1);      
                }
             } 
             
     }       
}

 
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
