(function() {

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
    function chr(charNumber) {
        if(charNumber==10)
            return "\n";

        return "";
    }

    module.exports.allTrim = allTrim; 
    module.exports.trim = trim; 
    module.exports.rTrim = rTrim; 
    module.exports.lTrim = lTrim;
    module.exports.chr = chr; 
    module.exports.len = len;
    module.exports.substr = substr;
})();