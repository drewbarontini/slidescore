(function(){var n;null==this.Slidescore&&(this.Slidescore={}),n=function(){var t,e,i,o,r,s,c,u,l,a;return e=0,a={h:72,j:74,k:75,l:76},i=function(t){return n.options=t,n.slidesLength=n.options.slides.length,c(),window.location.hash?u():void 0},c=function(){return $(document).on("keydown",function(t){switch(t.which){case a.h:return l(1);case a.j:return o();case a.k:return r();case a.l:return l(n.slidesLength)}})},u=function(){var n;return n=window.location.hash.replace("#",""),s(n)},l=function(n){return e=n,s(),t()},o=function(){return e!==n.slidesLength?(e++,s(),t()):void 0},r=function(){return 1!==e?(e--,s(),t()):void 0},s=function(t){var i;return null==t&&(t=e),i=$("section[data-id='"+t+"']"),$("body, html").animate({scrollTop:parseInt($(i).offset().top)},n.options.scrollSpeed)},t=function(){return window.location.href="#"+e},{init:i}}(),$(function(){var t;return t={slides:$("section"),scrollSpeed:250},n.init(t)})}).call(this);