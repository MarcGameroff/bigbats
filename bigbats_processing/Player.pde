class Player {
  
 String[] pStats;
 
 // Data included in filename
 String filename;
 int year;
 String team;
 String outcome;
 
 // Existing data points 
 // r = regular season
 // p = playoffs
 String name;
 int pG, pAB, pR, pH, p2B, p3B, pHR, pRBI, pBB, pSO, pSB;
 float pBA, pOBP, pSLG, pOPS, pCS;
 int rG, rAB, rR, rH, rHR, rRBI, rSB;
 float rBA, rOPS;
 int E;

 // data points to be created
 float OPSdiff;
 String upDown; // result of the series for this player's team
 

 Player(String row, String _filename) {
   filename = _filename;
   pStats = row.split(",");
   name = pStats[0];
   setYearAndTeamName(filename);
   setStats();

   // Test = difference in regular season OPS and post-season OPS
   // Conditions =>
   // AB:  regular season >= 100 , post season >15 
   // OPS: regular season > 0, post season > 0
   if(rAB >= 100 && pAB > 15 && rOPS > 0 && pOPS > 0) {
     OPSdiff = abs(rOPS - pOPS);
     if(rOPS > pOPS) {
       upDown = "down"; 
     } else if(pOPS > rOPS) {
       upDown = "up"; 
     }
   }
 } 
 
 
 void printBasic() {
   println(name + " - " + year + ", " + team);
 }
 
 float getOPSdiff() {
   return OPSdiff; 
 }
 
 void printData() {
   println(name + " - " + year + ", " + team);
   println("PLAYOFF SERIES");
   println("G: " + pG);
   println("AB: " + pAB);
   println("R: " + pR);
   println("H: " + pH);
   println("2B: " + p2B);
   println("3B: " + p3B);
   println("HR: " + pHR);
   println("RBI: " + pRBI);
   println("BB: " + pBB);
   println("SO: " + pSO);
   println("BA: " + pBA);
   println("OBP: " + pOBP);
   println("SLG: " + pSLG);
   println("OPS: " + pOPS);
   println("SB: " + pSB);
   println("CS: " + pCS);
   println();  
   println("REGULAR SEASON");
   println("G: " + rG);
   println("AB: " + rAB);
   println("R: " + rR);
   println("H:" + rH);
   println("HR:" + rHR);
   println("RBI: " + rRBI);
   println("SB:" + rSB);
   println("BA:" + rBA);
   println("OPS: " + rOPS); 
   println();
   println("Errors: " + E);
   println();
 }
  
  
 void setStats() {
   pG   = int(pStats[1]);
   pAB  = int(pStats[2]);
   pR   = int(pStats[3]);
   pH   = int(pStats[4]);
   p2B  = int(pStats[5]);
   p3B  = int(pStats[6]);
   pHR  = int(pStats[7]);
   pRBI = int(pStats[8]);
   pBB  = int(pStats[9]);
   pSO  = int(pStats[10]);
   pBA  = float(pStats[11]);
   pOBP = float(pStats[12]); 
   pSLG = float(pStats[13]);
   pOPS = float(pStats[14]);
   pSB  = int(pStats[15]);
   pCS  = float(pStats[16]);
   
   E    = int(pStats[17]);
   
   rG   = int(pStats[18]);
   rAB  = int(pStats[19]);
   rR   = int(pStats[20]);
   rH   = int(pStats[21]);
   rHR  = int(pStats[22]);
   rRBI = int(pStats[23]);
   rSB  = int(pStats[24]);
   
   if(pStats.length > 25) {
     rBA  = float(pStats[25]);
     rOPS = float(pStats[26]);
   } else {
     rBA = 0;
     rOPS = 0; 
   }
 } 
  
 void setYearAndTeamName(String f) {
   String[] filenameSplit = split(f, '_');
   year = int(filenameSplit[1]);
   outcome = filenameSplit[5];
   
   String tempName = "";
   for(int i=6; i<filenameSplit.length; i++) {
     tempName += filenameSplit[i] + " ";
   }
   tempName.trim();
   team = tempName.substring(0, tempName.length()-5);
   if(debug) {
   }
 }

}
