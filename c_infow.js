(function() {
    clipper = require('./clipper');

    function cEmpty(str) { return (str === undefined || str === null || str === "" || str.length==0);} module.exports.cEmpty = cEmpty;
    function cStrToMatriz(str) { 
        return (str === undefined || str === null || str === "" || str.length==0);
    } module.exports.cStrToMatriz = cStrToMatriz;
    

    function cStrToMatriz(wString,wChar,wTpVar,wNull) {
        var wMatrix = [] , wItem , wCharLen;

        // wTpVar := iIf(cEmpty(wTpVar),"C",wTpVar)
        wTpVar = clipper.valType(wTpVar)!="C" ? "C"   : wTpVar;
        wNull  = clipper.valType(wNull) !="L" ? false : wNull;

        wCharLen = clipper.len(wChar);
        wString  = wString + wChar;
        while(!cEmpty(wString)) { 
            wItem   = clipper.substr(wString,1,clipper.at(wChar,wString)-1);
            //wString := SubStr(wString,At(wChar,wString)+1)
            wString = clipper.substr(wString,clipper.at(wChar,wString)+wCharLen);
            if(!wNull) {
                if(cEmpty(wItem)) { 
                    continue;
                }
            }
            if        (wTpVar=="C") {
                aAdd(wMatrix , wItem );
            } else if (wTpVar=="N") {
                aAdd(wMatrix , clipper.val(wItem) );
            } else if (wTpVar=="D") {   /// **** problema para saber tipo Date - rever - tdb
                aAdd(wMatrix , cTod(wItem) );
            }
        }

    return wMatrix

})();