d=18.95;
r=d/2;
space=0.8;

height=10; // height of the entire stock

railThickness=1;// substract it from the total height

stripWidth=8.2;
rim=2;


parallalSpace=space;//0.6;//space between rows (parallal)
serialSpace=parallalSpace+0.01;//space between columns (serial) //muse 0.01 more then parallal

paralallRimfactor=r+parallalSpace+rim;
serialRimFactor=r+serialSpace+rim;

fc=0.85;   //1 for rectangular // less then that collides cicrles in case it's recgunalr
fr=0.5;//0 1 for rectangular, more (fractional ,in between )


ser1=5;
ser2=5;
ser3=5;
ser4=5;
ser5=1;
ser6=0;
ser7=0;
ser8=0;
ser9=0;
ser10=0;
ser11=0;
ser12=0;
ser13=0;
ser14=0;

templateArr=[for(sr=[
 ser1
,ser2
,ser3
,ser4
,ser5
,ser6
,ser7
,ser8
,ser9
,ser10
,ser11
,ser12
,ser13
,ser14])  
if(sr>0) sr];




//templateArr=[for(serial=[1:1:14])    5];// recangular
    
//templateArr=[1,2,2];// for custom shampe
//templateArr=[9,9,9,8,8,7,7,6,6,5,5,4,4,3,3];// triangle for custom shampe
//templateArr=[8,8,9,9,10,10,11,11,12,11,12,11,12,11,12,11,12,11,10,9,9,8,5];// for custom shampe
templateArr=[6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,4];// for custom shampe

echo (templateArr);

arrTop=[for (serial=[0:1:len(templateArr)-1   ])        
     makeParalall(1,serial,templateArr[serial])
];

makeCover=false;
drawBox=true;
translate([0,0,height+1]){
    if (makeCover){
        makeProfile(arrTop,2);
    }
}


translate([0,0,0]){
    gen(arrTop);
}

arrBottom=[for (serial=[0:1:len(templateArr)-1])        
    makeParalall(-1,serial,templateArr[serial])    
];

bottomStartPos=getFirstCell(arrBottom)[0]-(serialRimFactor*2)-10;
translate([bottomStartPos,getFirstCell(arrBottom)[1],0]){
    gen(arrBottom);
}

translate([bottomStartPos,getFirstCell(arrBottom)[1],height+1]){
    if (makeCover){
        makeProfile(arrBottom,2);
    }
}

function makeParalall(reverse,serialIndex,paralalls)
         = [for(paralallIndex=[0:1:paralalls-1])    
                makeCell(reverse,serialIndex,paralallIndex)             
           ];

function makeCell(reverse,serialIndex,paralallIndex)
    = [reverse*((paralallIndex+(serialIndex%2*fr)))  *(d+parallalSpace)    ,(serialIndex*fc  *(d+serialSpace))];
             
            
function getTotalSerials(arr)
       = len(arr);             
             
function getSerial(arr, serialIndex) 
       = arr[serialIndex];

function getFirstCell(arr)
       = getFirstCellInSerial(arr,0);

function getLastCell(arr) 
       = getLastCellInSerial(arr,getTotalSerials(arr)-1);

function getFirstCellInSerial(arr,rowNum)
       = getCell(arr,rowNum,0);

function getLastCellInSerial(arr,rowNum)
       = getCell(arr,rowNum,getSerialSize(arr,rowNum)-1);

function getFirstSerial(arr)
       = getSerial(arr,0);
       
function getLastSerial(arr)
       = getSerial(arr,getTotalSerials(arr)-1);
             
function getSerialSize(arr,serialIndex)
       = len(getSerial(arr,serialIndex));
             
function getCell(arr,serialIndex,paralallIndex)
       = getSerial(arr,serialIndex)[paralallIndex];
             
function flatten(l)
       = [ for (a = l) for (b = a) b ] ;

function defineProfile(arr)
=flatten(
            [
                getFirstSerial(arr)
                ,[for (i=[1:1:getTotalSerials(arr)-2])
                     getLastCellInSerial(arr,i)    
                ]
                ,[getLastCell(arr),getFirstCellInSerial(arr,getTotalSerials(arr)-1)]
                ,[for (i=[getTotalSerials(arr)-2:-1:1])
                    getFirstCellInSerial(arr,i)    
                ]
            ]
      ) ;

if (drawBox){    
    drawBox();
}
module drawBox(){              
    translate ([0,0,20]){
            arrBounds=defineProfile(arrTop);
            h=65-(height*2);
            size=paralallRimfactor;
            difference(){
                linear_extrude(h,center=false){
                    offset(r=size,chamfer=true){
                        polygon(arrBounds);
                    }  
                }   
                translate([0,0,-1]){
                    linear_extrude(h+2,center=false){
                        offset(r=size-rim,chamfer=true){
                            polygon(arrBounds);
                        }  
                    }        
                }
            }
    }
}
module makeProfile(arr,height){        
        arrBounds=defineProfile(arr);
        
        linear_extrude(height,center=false){
            offset(r=paralallRimfactor,chamfer=true){
                polygon(arrBounds);
            }  
        }        
}



module gen(arr){
    difference(){
                

        makeProfile(arr,height);
        
        for (rowNum= [0:1:len(arr)-1] ){
            row=arr[rowNum];
      //      echo (row);
            for(cellIndex = [0 : 1 : len(row)-1 ]){
                cell=row[cellIndex];
      //          echo (rowNum,cellIndex,cell);
              cellDraw(cell);
            }      
        }
                 
    }
}  


module cellDraw(cell){
    x=cell[0];
    y=cell[1];    
       
    //echo (x,y,z);
    offset=0.001;
    translate([x,y,height-(railThickness/2)+offset]){ //because it's centered, so is the z, so lower by half               
            angle=60;
            rotate(90){
                cube([stripWidth,d+serialSpace,railThickness],center=true);
            }
            rotate(90-angle){
                cube([stripWidth,d+parallalSpace,railThickness],center=true);
            }
            rotate(90-(angle*2)){
                cube([stripWidth,d+parallalSpace,railThickness],center=true);
            }                   
            
    }
    
    translate([x,y,-offset]){ 
        cylinder(d=d,h=(height-railThickness)+offset*3,center=false);       
    }
           
}


//echo (arr);            
             /*
    [
                 [
                    [0, 0] , [18.9, 0] , [37.8, 0]
                 ]
             , [
                [9.45, 16.32] , [28.35, 16.32], [47.25, 16.32]
               ]
             , [
                [0, 32.64], [18.9, 32.64], [37.8, 32.64]
               ]
     ]
             */


     /*
arr=[
    [
            [(0+(0%2*fr))  *(d+parallalSpace)    ,0*fc  *(d+serialSpace)]
        ,   [(1+(0%2*fr))  *(d+parallalSpace)    ,0*fc  *(d+serialSpace)]
        ,   [(2+(0%2*fr))  *(d+parallalSpace)    ,0*fc  *(d+serialSpace)]
    ]
,
    [
            [(0+(1%2*fr))  *(d+parallalSpace)    ,1*fc  *(d+serialSpace)] //copy 1* to 1%2
        ,   [(1+(1%2*fr))  *(d+parallalSpace)    ,1*fc  *(d+serialSpace)] 
        ,   [(2+(1%2*fr))  *(d+parallalSpace)    ,1*fc  *(d+serialSpace)] 
    ]
,
    [
            [(0+(2%2*fr))  *(d+parallalSpace)    ,2*fc  *(d+serialSpace)]
        ,   [(1+(2%2*fr))  *(d+parallalSpace)    ,2*fc  *(d+serialSpace)]
        ,   [(2+(2%2*fr))  *(d+parallalSpace)    ,2*fc  *(d+serialSpace)]
 //       ,   [(3+(2%2*fr))  *(d+parallalSpace)    ,2*fc  *(d+serialSpace)]
    ]
,
    [
            [(0+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
        ,   [(1+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
        ,   [(2+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
   //     ,   [(3+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
   //      ,  [(4+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
          //,  [(5+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
          //,  [(6+(3%2*fr))  *(d+parallalSpace)    ,3*fc  *(d+serialSpace)]
    ]
];

*/