(function() {

    function aAdd(matriz,item) {
        matriz.push(item);
    }

    function upper(string) {
        return string.toUpperCase();
    }
    function lower(string) {
        return string.toLowerCase();
    }

    function allTrim(stringToTrim) {
        return stringToTrim.replace(/^\s+|\s+$/g,"");
    }
    function trim(stringToTrim) {
        return stringToTrim.replace(/^\s+|\s+$/g,"");
    }
    function lTrim(stringToTrim) {
        return stringToTrim.replace(/^\s+/,"");
    }
    function rTrim(stringToTrim) {
        return stringToTrim.replace(/\s+$/,"");
    }
    function len(text) {
        return length(text);
    }
    
    function substr(text,posIni,posFim) {
        return text.substr(posIni-1,posFim);
    }

    function strzero(nr, n, str) {
        return Array(n-String(nr).length+1).join(str||'0')+nr;
    }
    
    function strTran(target, search, replacement) {
        return target.replace(new RegExp(search, 'g'), replacement);
    }

    function chr(charNumber) {
        if(charNumber==10)
            return "\n";

        return "";
    }
    function at(find,text) {
        return text.indexOf(find)+1;
    }
    function rAt(find,text) {
        return text.lastIndexOf(find)+1;
    }

    module.exports.aAdd = aAdd; 
    module.exports.upper = upper; 
    module.exports.lower = lower; 
    module.exports.allTrim = allTrim; 
    module.exports.trim = trim; 
    module.exports.rTrim = rTrim; 
    module.exports.lTrim = lTrim;
    module.exports.chr = chr; 
    module.exports.len = len;
    module.exports.substr = substr;
    module.exports.strzero = strzero;
    module.exports.at = at;
    module.exports.rAt = rAt;
})();