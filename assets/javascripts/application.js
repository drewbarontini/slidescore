(function(){var e;null==this.Slidescore&&(this.Slidescore={}),e=function(){var e,n,t,r,o,s,i,c,u,a,l,d,f,p,h,v;return d={},o=0,f={h:72,j:74,k:75,l:76,next:39,prev:37,space:32,q:191,esc:27},p=0,s=function(){return p=d.slides.length,u(),window.location.hash&&a(),v(),n()},l=function(e){return d=e},u=function(){return $(document).on("keydown",function(e){switch(t(e)){case f.h:return r(1);case f.j:return r("next");case f.next:return r("next");case f.space:return r("next");case f.k:return r("prev");case f.prev:return r("prev");case f.l:return r(p);case e.shiftKey&&f.q:return i("open");case f.esc:return i("close")}}),d.modal.on("click",function(e){return e.preventDefault(),i("close")})},t=function(e){var n;return e=e||window.event,n=e.keyCode||e.which},a=function(){return o=window.location.hash.replace("#",""),c(o)},v=function(){var e;return e=Math.round(o/p*100),d.progress.css("width",""+e+"%")},r=function(e){switch(e){case"next":o!==p&&o++;break;case"prev":1!==o&&o--;break;default:o=e}return h()},h=function(){return c(),e(),v()},c=function(e){var n;return null==e&&(e=o),n=$("section[data-id='"+e+"']"),$("body, html").animate({scrollTop:parseInt($(n).offset().top-d.offsetPadding)},d.scrollSpeed)},e=function(){return window.location.href="#"+o},i=function(e){return"open"===e&&d.modal.toggleClass("is-active"),"close"===e?d.modal.removeClass("is-active"):void 0},n=function(){return $("img").error(function(){return $(this).attr("src","http://placehold.it/1024x768/000/000/")})},{init:s,setOptions:l}}(),jQuery(function(n){var t;return t={slides:n("section"),scrollSpeed:250,offsetPadding:40,modal:n(".modal"),progress:n(".progress")},e.setOptions(t),e.init(),n("img").unveil()})}).call(this);