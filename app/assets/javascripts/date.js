Date.prototype.yyyymmdd = function() {
 var yyyy = this.getFullYear().toString();
 var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
 var dd  = this.getDate().toString();
 return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]); // padding
};


function stringToTime(str){
  if (str === ""){
    return ""
  };
  var hhmmss = str.match(/T(.*)Z/)[1];
  var hour = hhmmss.split(":")[0];
  var min = hhmmss.split(":")[1];
  var sec = hhmmss.split(":")[2];
  return hour + ":" + min;
};
