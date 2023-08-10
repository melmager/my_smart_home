module open_therm() {
  difference() {
    cube([39,29,12]);  
    translate([2,2,2]) cube([35,25,10]);   
  } 
  translate([4,4,0]) cylinder(d=5,h=4);
  translate([4,4,0]) cylinder(d=2,h=6);
  
  translate([35,25,0]) cylinder(d=5,h=4);
  translate([35,25,0]) cylinder(d=2,h=6);
}

module hall_pcb() {
  difference() {  
    cube([50,20,20]);
    translate([6.5,2.5,3.5]) cube([30,15,2]);  //pcb ausschnitt
    translate([7.5,3.5,1.5]) cube([28,13,2]); //pb lötseite  
    translate([1.2,1.2,5.5]) cube([47.6,17.6,20]);
  }
}

module hall_top() {
  cube([50,20,1.2]); 
  translate([1.5,1.5,1.2]) cube([47.5,17.5,1.2]);  
}

//noppen,platehöhe
module case_bottom(breit,tief,hoch) {
  difference() {  
    cube([breit*8,tief*8,hoch*3.2]); 
    translate([1.2,1.2,1.2]) cube([breit*8-2.4,tief*8-2.4,hoch*3.2]);  
  }
  translate([0,0,hoch*3.2-6.4]) wand_noppe();  
  translate([breit*8-16,tief*8,hoch*3.2-6.4]) rotate([0,0,270]) wand_noppe(); 
}

module wand_noppe() {
  hull () { 
    difference() {  
    cube([8,16,6.4]);
    translate([1.2,0,0]) cube([8,16,5.2]);    
  }
  }
  $fn=20;
  translate([4,4,6.4]) cylinder(d=3.2,h=1.8);
  translate([4,12,6.4]) cylinder(d=3.2,h=1.8);
}

module case_top(breit,tief,hoch) {
    difference() {  
    cube([breit*8,tief*8,hoch*3.2]); 
    translate([1.2,1.2,0]) cube([breit*8-2.4,tief*8-2.4,hoch*3.2-1.2]);  
  }
}

module hall_sensor() {
    difference() {
      union() {
        translate([0,6,0]) cylinder(d=12,h=18.5);
        // pcb raum
        translate([0,-8,0]) cube([36,20,18.5]); 
        translate([0,12,0]) cube([2,10,18]);  
      }
      //nute
      translate([0,8,1.5]) cube([32,1.6,1.5]);
      
      //innen 
      translate([1.5,-6.5,3]) cube([33,17,16]);
      translate([0,6,1.5]) cylinder(d=9,h=18);
      //stecker
      translate([34,2.5,4]) cube([2,3,15]);
    }
  translate([0,-60,0]) 
    difference() {
    union() {
      cylinder(d=12,h=1.5);
      translate([0,-6,0]) cube([40,20,1.5]);
      translate([0,0,1.5]) cylinder(d=9,h=1.5);  
      translate([1.5,-4.5,1.5]) cube([37,17,1.5]);
      translate([37,0,0]) cube([1.5,10,10]);
    }
    translate([0,-2.5,1.5]) cube([32,2,2]);
    }
}

module open_therm_botton() {
  difference () {
    cube([40,30,14]);
    translate([1.5,1.5,1.5]) cube([37,27,12.5]);  
    translate([0,15,5]) rotate([0,90,0]) cylinder($fn=16,h=2,r=2.5);  
      
  }
  translate([4.5,5,0]) union() {
      cylinder($fn=16,h=4,r=1.5);
      cylinder($fn=16,h=2.5,r=2.5);
  }
  translate([34.5,23,0]) union() {
      cylinder($fn=16,h=4,r=1.5);
      cylinder($fn=16,h=2.5,r=2.5);
  }
}

module mhi_ctrl_botton() {
  difference() {
    box_botton(69,41,8);  
  
  //  cube([69,44,15]); 
  //  translate([1.5,1.5,10]) cube([66,41,15]); 
  //  translate([1.5,2.5,1.5]) cube([65,39,10]); 
    //ausschnitt
    translate([0,14.5,7.5]) cube([7,11,10]); 
    //phase  
    rotate([0,90,0]) cylinder(r=0.75,h=70); 
      
  } 
}

module mhi_ctrl_top() {
  difference() {  
    box_top(64,41,20);
    translate([0,20,-3]) cube([4,12,5]);//bme
    translate([1.2,27,-3]) cube([2,14,16]);//c
    translate([64,12,-3]) cube([5,15,6]);//kabel
  }
  //cover bme280
  translate ([-15,15,-5]) difference() {
    cube([15,20,27]); 
    translate([1.5,1.5,0]) cube([13.5,17.5,25]); 
    for (zl = [4:4:16]) {  
    for (lo = [4:4:16]) { 
      translate([0,lo,zl]) rotate([0,90,0]) cylinder(h=10,r=1.5,$fn=8); 
        
    } 
    }
    //nase
    translate([15,20,0]) rotate([90,0,0]) cylinder(h=20,r=5); 
  }
  
}

module box_botton(pcbx,pcby,pcbh) {
  difference() {
    cube([pcbx+3,pcby+3,pcbh+8]);
    translate([1.5,1.5,pcbh]) cube([pcbx,pcby,10]); 
    translate([1.5,2.5,1.5]) cube([pcbx,pcby-2,pcbh]);  
  }  
}

module box_top(pcbx,pcby,pcbh) {
  // wand 1.2 + 0.25 platz 0.75 rand
  difference() {
    union() {
      cube([pcbx+4.4,pcby+4.4,pcbh+2]); 
      translate([1.45,1.45,pcbh]) cube([pcbx+0.5,pcby+0.5,5]);  
    }
    translate([2.45,2.45,1.5]) cube([pcbx-2,pcby-2,pcbh+10]);
  }
}

module lilygo_botton() {
  difference() {  
    box_botton(117,63,20);
  }
}



//open_therm();
//hall_top();
//case_bottom(8,4,3);
//case_top(8,4,3);
//hall_sensor();
//open_therm_botton();
mhi_ctrl_botton();
//mhi_ctrl_top();
//translate([58,12,0]) cube([4,24,3]);//kabel

//box_botton(64,41,10);
//box_top(64,41,17); 
//lilygo_botton();



//translate([0,0,25]) mhi_ctrl_top();