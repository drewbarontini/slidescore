(function(){var n;null==this.Slidescore&&(this.Slidescore={}),n=function(){var n,e,t,r,o,i,c,s,u,a,l,d,f,h;return d={},e=0,f={h:72,j:74,k:75,l:76,next:39,prev:37,space:32,q:16,esc:27},h=0,t=function(){return h=d.slides.length,s(),window.location.hash?u():void 0},a=function(n){return d=n},s=function(){return $(document).on("keydown",function(n){switch(n.which){case f.h:return l(1);case f.j:return o();case f.next:return o();case f.space:return o();case f.k:return i();case f.prev:return i();case f.l:return l(h);case f.q:return r("open");case f.esc:return r("close")}}),d.modal.on("click",function(n){return n.preventDefault(),r("close")})},u=function(){return e=window.location.hash.replace("#",""),c(e)},l=function(t){return e=t,c(),n()},o=function(){return e!==h?(e++,c(),n()):void 0},i=function(){return 1!==e?(e--,c(),n()):void 0},c=function(n){var t;return null==n&&(n=e),t=$("section[data-id='"+n+"']"),$("body, html").animate({scrollTop:parseInt($(t).offset().top-d.offsetPadding)},d.scrollSpeed)},n=function(){return window.location.href="#"+e},r=function(n){return"open"===n&&d.modal.toggleClass("is-active"),"close"===n?d.modal.removeClass("is-active"):void 0},{init:t,setOptions:a}}(),$(function(){var e;return e={slides:$("section"),scrollSpeed:250,offsetPadding:40,modal:$(".modal")},n.setOptions(e),n.init(e)})}).call(this);