
cellHeight=66;
cellDiameter=18.85;
holderHeight=7;
spacing=0.7;
stripTabHeight=1.5;
stripWidth=8;

stripDiff=0.5;// how small make the strip in plus side

s=0;
n=-1;
p=1;


holderDiameter=cellDiameter+spacing;
holderRadius=holderDiameter/2;
stripLength=holderDiameter; 
angle=60;    
stripZ=holderHeight+(stripTabHeight/2);                            
holderActuallHeight=holderHeight+0.002;

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

simpleOne=[                  
         [n,n,n]
        ,[n,n,n]
        ,[n,n,n]
        ,[n,n]
        ,[n,n]
        ,[n]      
        
        ];
 

manArr=trangle14s8p;         
//manArr=mine14s6p;         
//manArr=simpleOne;         

rimOffset=12;

row=0;
col=0;        
bmsSpacingFromCells=2;
bmsWidth=20;
bmsLength=110;
ov=0;
oh=90;
orientation=ov;



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


boltDiameter=4.7;
boltRadius=boltDiameter/2;
boltSpacingFromCell=5;

module drawBolts(arr,from,step,stopPos,xCol,yCol,xOffset,yOffset,Z){

    for(i=[from:step:len(arr)+stopPos] ){
       a=arr[i];
        
       translate (concat(calc2D([a[0]+xCol,a[1]+yCol],xOffset,yOffset),-0.001  )){           
            cylinder(d=boltDiameter,h=Z);              
       }
    }
                    
}
module bolts(Z){
    //drawBolts(start,1,2,-2,-0.5,   0 ,  -holderRadius+boltSpacingFromCell,0,Z);          
    drawBolts(start,0,2,-1,-0.5,   0 ,  -holderRadius+boltSpacingFromCell,0,Z);          
    
    //drawBolts(end  ,0,2,-2, 0.5,  -0 ,   holderRadius-boltSpacingFromCell,0,Z);                
    drawBolts(end  ,1,2,-1, 0.5,  -0 ,   holderRadius-boltSpacingFromCell,0,Z);      
    
   // drawBolts(right,0,1,-2,+0.5,   0 ,   0,    holderRadius+boltSpacingFromCell,Z);
    drawBolts(right,0,1,-2,0,   0 ,   holderRadius,    holderRadius+boltSpacingFromCell,Z);
    
    drawBolts(left, 1,1,-1,-0.5,   0 ,   0,   -holderRadius-boltSpacingFromCell-bmsWidth-(boltDiameter/2),Z);
}
module design(){
                  
        Z=holderActuallHeight+0.002;
        pos=calc2D([row,col]);                  
        x=pos[0]-holderRadius;//-bmsSpacingFromCells;
        y=pos[1]-holderRadius-(orientation==ov ? bmsWidth:0)-bmsSpacingFromCells; 
        translate([x,y,holderActuallHeight]){                    
            rotate(orientation){
              translate([0,0,-Z]){
                    cube([bmsLength,bmsWidth,Z+0.001]); 
              }
            }
        }
        
        
        translate([0,0,holderActuallHeight]){
            drawHoles(manArr){                 
                translate([0,0,0]){                                  
                   translate([0,0,-stripZ]){               
                        cylinder(d=cellDiameter,h=holderHeight+0.001);
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
module holder(){
     difference(){
          linear_extrude(holderActuallHeight){            
               offset(r=rimOffset){
                   hull(){        
                      projection(){
                        design();                                                                                 
                      }                   
                   }                    
               }                              
           }
           translate([0,0,-cellHeight+holderActuallHeight+1.1]){
              bolts(cellHeight+0.002);
           }      
           design();      
           
    }       
}

    holder();
    body=cellHeight-(holderActuallHeight*2);

    translate([0,0,-body-1]){  
      
         linear_extrude(body){
             difference(){
               offset(r=rimOffset){
                   hull(){        
                      projection(){
                        design();                     
                      }                   
                   }     
               }
               offset(r=-0.1){
                   hull(){        
                      projection(){
                        design();                     
                      }                   
                   }     
               }
               projection(){
                   translate([0,0,-cellHeight]){
                       bolts(cellHeight+0.002);
                    }
               }       
      
        
        yPos=len(start)/2;//todo: find the widest palce otherwise won't fit
        from=calc2D([-2,yPos]);
        to=calc2D([len(left)+1,0]);        
        l=to[0]-from[0];
        cc=calc2D([-2,0]);  
                       
        translate(concat(from,0)){
            echo(to[0]-from[0]);
                projection(){
                    #cube([l,0.5,cellHeight-holderActuallHeight*2],center=false); //slice the body 
                }
            }           
         }          
    }
                            
   }         
     translate([0,0,-body-2]){   
         mirror([0,0,90]){
             holder();
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
                        children(0);                    
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


 
    