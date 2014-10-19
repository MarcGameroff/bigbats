/*
Matthew Epler, 2014
For "BIG BATS" project by The ACME Catalog 
http://theacmecatalog.com

No license. Use this for whatever you want. 
*/
import java.util.*;

PrintWriter output;

// change this to point to your data directory
String dataPath = "/Users/matthewepler/Desktop/MLB_bigBats/MLB_stats_sketch/data/MLB_stats/";

ArrayList<Player> allPlayers = new ArrayList<Player>();


void setup() {
  output = createWriter("OPS_collected_15plus.csv");
  
  // get all WS filenames
  File WSdir = new File(dataPath + "world_series");
  if (WSdir.isDirectory()) {
    println("loaded directory " + WSdir.getName());
  } 
  else {
    println("no directory loaded");
  }

  String[] WSfileNames = WSdir.list();
  for (int i=0; i<WSfileNames.length; i++) {
    String s = WSfileNames[i];
    if (!s.contains("DS_Store")) {
      // create a new player object for each row in every WS file
      String[] rows = loadStrings(WSdir.getAbsolutePath() + "/" + s);
      for (int j=3; j<rows.length-1; j++) { // names start on row 3, and excludes totals row at bottom
        Player newPlayer = new Player(rows[j], s);
        allPlayers.add(newPlayer);
      }
    }
  }
  
 
 // I don't know how to use Comparators. Suggestions welcome! 
 // I just print this out as a CSV file and then sort in Excel or similar.
 for(int i=0; i<allPlayers.size(); i++) {
   Player p = allPlayers.get(i);
   output.println(p.year + "," + p.team + "," + p.name + "," + p.rOPS + "," + p.pOPS + "," 
                   + p.OPSdiff + "," + p.upDown + "," + p.outcome);
 }
 output.flush();
 output.close();
 println("DONE");
 exit();

}

void draw() {
  // nothing here
}

