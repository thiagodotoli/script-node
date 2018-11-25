(function() {

    function aAdd(matriz,item) { matriz.push(item); } module.exports.aAdd = aAdd;
    function val(text) { return parseInt(text); } module.exports.val = val;
    function upper(string) { return string.toUpperCase(); } module.exports.upper = upper;
    function lower(string) { return string.toLowerCase(); } module.exports.lower = lower;
    function allTrim(stringToTrim) { return stringToTrim.replace(/^\s+|\s+$/g,""); } module.exports.allTrim = allTrim; 
    function trim(stringToTrim) { return stringToTrim.replace(/^\s+|\s+$/g,""); } module.exports.trim = trim; 
    function lTrim(stringToTrim) { return stringToTrim.replace(/^\s+/,""); } module.exports.lTrim = lTrim;
    function rTrim(stringToTrim) { return stringToTrim.replace(/\s+$/,""); } module.exports.rTrim = rTrim;
    function len(text) { return length(text); } module.exports.len = len; 
    function substr(text,posIni,posFim) { return text.substr(posIni-1,posFim); } module.exports.substr = substr;
    function strzero(nr, n, str) { return Array(n-String(nr).length+1).join(str||'0')+nr; } module.exports.strzero = strzero;
    function strTran(target, search, replacement) {return target.replace(new RegExp(search, 'g'), replacement); } module.exports.strTran = strTran;
    function chr(charNumber) { if(charNumber==10) {return "\n";} return ""; } module.exports.chr = chr; 
    function at(find,text) { return text.indexOf(find)+1; } module.exports.at = at;
    function rAt(find,text) { return text.lastIndexOf(find)+1; } module.exports.rAt = rAt;

})();