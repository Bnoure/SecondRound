var e={};var t=document.createElement("p").style,r="O ms Moz webkit".split(" "),i=/^(o|ms|moz|webkit)/,a=/([A-Z])/g,n={};function get(e){return e in n?n[e]:n[e]=prefix(e)}function prefix(e){var i=e.replace(/-([a-z])/g,(function(e,t){return t.toUpperCase()})),a=r.length,n;if(void 0!==t[i])return i;i=capitalize(e);while(a--){n=r[a]+i;if(void 0!==t[n])return n}throw new Error("unable to prefix "+e)}function capitalize(e){return e.charAt(0).toUpperCase()+e.slice(1)}function dashedPrefix(e){var t=get(e),r=/([A-Z])/g;r.test(t)&&(t=(i.test(t)?"-":"")+t.replace(r,"-$1"));return t.toLowerCase()}e=get;e.dash=dashedPrefix;var o=e;const p=e.dash;export default o;export{p as dash};

