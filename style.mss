@bold: 'Roboto Bold';
@regular: "Roboto Regular";
@italic: "Roboto Italic";
@bound-pol: beige;
@halo: beige;
@bound-line: #ba68c8;
@water: #C1D6DC;
@water-bound: #4593AB;
@roads: dimgray;
@labels: #735A7D;

Map {
  background-color: white;
  srs: '+proj=tmerc +lat_0=0 +lon_0=33 +k=1 +x_0=6500000 +y_0=0 +ellps=krass +towgs84=24.47,-130.89,-81.56,-0,-0,0.13,-0.22 +units=m +no_defs';
  font-directory: url(./fonts/);
}

/*---BOUNDARIES--*/
#boundaries-pol {
  polygon-fill: @bound-pol;
}
#boundaries-line {
  ::outline{
    line-color:@bound-line;
    line-width: 0.5;
  }
  line-offset: -2;
  line-opacity: 0.2;
  line-width: 3;
  line-color:@bound-line;
  line-cap: round;
  line-join: round;
}
#coloured_boundaries [zoom<9] {
  [colour=0]{polygon-fill:#f1dae5;}
  [colour=1]{polygon-fill:#dee7ed;}
  [colour=2]{polygon-fill:#e9fcee;}
  [colour=4]{polygon-fill:#ffe8e6;}
  [colour=5],[colour=3]{polygon-fill:#FAE7CB;}
  
}
#boundaries_labels [zoom>6][zoom<9] {
  text-face-name:@bold;
  text-name: '[name]';
  text-size: 8;
  text-halo-fill: @halo;
  text-halo-radius: 3;
  text-allow-overlap: false;
  text-fill: @labels;
  text-wrap-width: 30;
  text-min-distance: 5;
  text-transform: uppercase;
  text-character-spacing:0.5;
}  
#boundaries_in_water {
  line-color: @water-bound;
  line-dasharray: 4,6;
  line-width: 0.5;
}

/*--WATER--*/
#water_pol{
  polygon-fill: @water;
}
#water_pol_labels [zoom>6] {
  [name="Онежское озеро"],[name="Ладожское озеро"] {
    text-face-name: @bold;
    text-fill: @water-bound;
    text-halo-fill: @halo;
    text-halo-radius: 2;
    text-name: '[name]';
    text-wrap-width: 30;
    text-size: 8;
    text-transform: uppercase;
    text-character-spacing:0.5;
    }
}  
#water_pol_labels [zoom>=10][area>=15000000] {
    text-face-name: @regular;
    text-fill: @water-bound;
    text-halo-fill: @halo;
    text-halo-radius: 1;
    text-name: '[name]';
    text-wrap-width: 30;
    text-size: 10;
}
#water_pol_labels [zoom>=13][area<=15000000] {
  text-face-name: @regular;
  text-fill: @water-bound;
  text-halo-fill: @halo;
  text-halo-radius: 1;
  text-name: '[name]';
  text-wrap-width: 30;
  }

/*---RIVERS---*/
#rivers [waterway!='drain'] {
  line-color:@water;
  line-width: 0.3;
}  
#rivers_labels [zoom>=14] {
  text-face-name: @regular;
  text-fill: @water-bound;
  text-halo-fill: @halo;
  text-halo-radius: 1;
  text-name: '[name]';
  text-size: 8;
  text-wrap-width: 30;
  text-placement: line;
  text-dy:-5;
  text-min-distance: 700;
  text-spacing: 700;
  }
  
/*--LANDUSE--*/
#landuse [zoom>=11] {
  [landuse='residential'],
  [landuse='allotments'],
  [landuse='industrial'] {
    polygon-fill: dimgray;
    opacity: 0.1;
  }
}

/*--BUILDINGS--*/
#buildings [zoom>=16] {
  polygon-fill:#C1C1C7;
  }
#buildings_labels [zoom>=17] {
  text-fill:@labels;
  text-size:8;
  text-face-name:@regular;
  text-halo-radius: 1;
  text-halo-fill: @halo;
  text-name: '[a_hsnmbr]';
  text-allow-overlap: true;
}

/*--HIGHWAYS--*/
#highways { 
  [zoom=8] {
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary']{line-color:@roads; line-width: 0.3;}
    }
  [zoom=9] {
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary']{line-color:@roads; line-width: 0.7;}
    [highway='tertiary']{line-color:@roads; line-width: 0.2;}
    [highway='unclassified']{line-color:@roads; line-width: 0.1;}
   }
  [zoom>9][zoom<12] {
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary']{
      line-color:@roads;
      line-width:2;
      line-join: round;
      ::outline {
        line-color:#FFB435;
        line-width:0.7;
        line-join:round;
        }
      }
    [highway='tertiary'],
    [highway='unclassified']{line-color:@roads; line-width: 0.2;}
    [highway='motorway_link'],
    [highway='trunk_link'],
    [highway='primary_link'],
    [highway='secondary_link']{line-color:@roads; line-width: 0.7;}
   }
  [zoom>=12][zoom<15] {
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'],
    [highway='tertiary'],
    [highway='motorway_link'],
    [highway='trunk_link'],
    [highway='primary_link'],
    [highway='secondary_link']{
      line-color:@roads;
      line-width:1.7;
      line-join: round;
      ::outline {
        line-color:#FFB435;
        line-width:0.5;
        line-join:round;
        }
      } 
    [highway='unclassified']{line-color:@roads; line-width: 0.3;}
    [highway='living_street'],
    [highway='service'],
    [highway='pedestrian'],
    [highway='residential']{line-color:@roads; line-width: 0.1;}
  }
  [zoom>=15]{
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'] {
      line-color:@roads;
      line-width:3.5;
      line-join: round;
      ::outline {
        line-color:#FFB435;
        line-width:1.8;
        line-join:round;
        }
      } 
    [highway='secondary'],
    [highway='tertiary'],
    [highway='motorway_link'],
    [highway='trunk_link'],
    [highway='primary_link'],
    [highway='secondary_link'],
    [highway='unclassified'] {
      line-color:@roads;
      line-width:1.5;
      line-join: round;
      ::outline {
        line-color:#FFB435;
        line-width:0.5;
        line-join:round;
        }
      } 
    [highway='living_street'],
    [highway='pedestrian'],
    [highway='residential']{line-color:@roads; line-width: 0.5;}
    [highway='service'],
    [highway='track']{line-color:@roads; line-width: 0.3;}
  }
}
#highways_labels [ref!=''][zoom>=9][zoom<12] {
  [highway='motorway'],
  [highway='trunk'] {
    shield-file: url(icons/shields/shield-road_20.svg);
    shield-fill: white;
    shield-size: 8;
    shield-allow-overlap: false;
    shield-face-name: @regular;
    shield-name: '[ref]';
    shield-min-distance: 100;
    shield-spacing: 100;
   }
}
#highways_labels [ref!=''][zoom>=12] {
  [highway='motorway'],
  [highway='trunk'] {
    shield-file: url(icons/shields/shield-road_20.svg);
    shield-fill: white;
    shield-size: 8;
    shield-allow-overlap: false;
    shield-face-name: @regular;
    shield-name: '[ref]';
    shield-min-distance: 300;
    shield-spacing: 300;
   }
}
#highways_labels [zoom>=16] {
  [highway='living_street'],
  [highway='residential'],
  [highway='pedestrian'],
  [highway='primary'] {
    text-face-name: @italic;
    text-name: [name];
    text-size: 9;
    text-fill: dimgray;
    text-character-spacing: 0.7;
    text-placement: line;
    text-halo-radius: 1.5;
    text-halo-fill:@halo;
    text-allow-overlap: false;
    text-min-distance:500;
    text-spacing: 500; 
    text-dy: -6;
    } 
}

/*--RAILWAYS--*/
#railways [zoom>7][zoom<10][service!='siding'] {
  line-color:#b3b3b3;
  line-width:3;
  line-join:round;
  line-cap:round;
  ::outline {
    line-color:white;
    line-width:2;
    line-dasharray: 4,6;
    line-join:round;
    }
}

/*----SETTLEMENTS---*/
#settlements [zoom>=9][zoom<14] {
  [place='town'],
  [place='city'] {
    text-face-name: @bold;
    text-name: '[name]';
    text-size: 9;
    text-fill:@labels;
    text-halo-radius: 2;
    text-halo-fill:@halo;
    text-allow-overlap: true;
    text-horizontal-alignment: right;
    text-transform: uppercase; 
    text-dx: 5;
    text-character-spacing:0.7;
    marker-fill: @labels;
    marker-width: 6;
    marker-allow-overlap:true;
    text-min-distance: 20;
    }
} 
#settlements [zoom>=14] {
  [place='town'],
  [place='city'] {
    text-face-name: @bold;
    text-name: '[name]';
    text-size: 10;
    text-fill:@labels;
    text-halo-radius: 2;
    text-halo-fill:@halo;
    text-allow-overlap: true;
    text-horizontal-alignment: right;
    text-transform: uppercase; 
    text-dx: 5;
    text-character-spacing:0.7;
    marker-fill: @labels;
    marker-width: 6;
    marker-allow-overlap:true;
    text-min-distance: 20;
    }
} 
#settlements [zoom>=11] {
  [place='village'] {
    text-face-name: @regular;
    text-name: '[name]';
    text-size:10;
    text-fill: @labels;
    text-character-spacing:0.5;
    text-halo-radius: 2;
    text-halo-fill:@halo;
    text-allow-overlap: false; 
    text-horizontal-alignment: right;
    text-dx: 5;
    text-wrap-width: 35;
    marker-file: url(icons/circle-stroked-15.svg);
    marker-fill: @labels;
    marker-width: 5;
    marker-allow-overlap:false;
  }
} 
#settlements [zoom>=13] {
  [place='hamlet'] {
    text-face-name: @italic;
    text-name: '[name]';
    text-size:9;
    text-fill: @labels;
    text-character-spacing:0.5;
    text-halo-radius: 2;
    text-halo-fill:@halo;
    text-allow-overlap: false; 
    text-wrap-width: 35;
    }
}