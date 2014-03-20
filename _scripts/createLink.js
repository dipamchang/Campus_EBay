$(function () {
    // wrapping links with anchor
    var pattern = /http:\/\/[^\s]*|www.[^\s]*/gi;
    var content = $("body").text();
    var linkMatches = content.match(pattern);
    if (linkMatches != null) {
        for (var i = 0; i < linkMatches.length; i++) {
            $("body").makeLink(linkMatches[i]);
        }
    }
});
$.fn.makeLink = function (pat) {
    function innerLink(node, pat) {
        var skip = 0;
        var pat1 = pat;
        if (node.nodeType == 3 && node.parentNode.nodeName != "A") {
            var pos = node.data.toUpperCase().indexOf(pat);
            if (pos >= 0) {
                var spannode = document.createElement('a');
                if (pat.indexOf("http:\/\/") < 0 && pat.indexOf("HTTP:\/\/") < 0) {
                    pat1 = "http:\/\/" + pat;
                }
                spannode.setAttribute("href", pat1);
                spannode.setAttribute("target", "_blank");
                spannode.setAttribute("title", "Opens in a new window/tab!");
                var middlebit = node.splitText(pos);
                var endbit = middlebit.splitText(pat.length);
                var middleclone = middlebit.cloneNode(true);
                spannode.appendChild(middleclone);
                middlebit.parentNode.replaceChild(spannode, middlebit);
                skip = 1;
            }
        }
        else if (node.nodeType == 1 && node.childNodes && !/(script|style)/i.test(node.tagName)) {
            for (var i = 0; i < node.childNodes.length; ++i) {
                i += innerLink(node.childNodes[i], pat);
            }
        }
        return skip;
    }
    return this.each(function () {
        innerLink(this, pat.toUpperCase());
    });
};