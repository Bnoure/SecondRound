var n={};var r;
/**
* @link https://github.com/gajus/sister for the canonical source repository
* @license https://github.com/gajus/sister/blob/master/LICENSE BSD 3-Clause
*/r=function(){var n={},r={};n.on=function(n,e){var a={name:n,handler:e};r[n]=r[n]||[];r[n].unshift(a);return a};n.off=function(n){var e=r[n.name].indexOf(n);-1!==e&&r[n.name].splice(e,1)};n.trigger=function(n,e){var a=r[n],t;if(a){t=a.length;while(t--)a[t].handler(e)}};return n};n=r;var e=n;export default e;

