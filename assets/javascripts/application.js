(function(){this.Slidescore={},this.Slidescore=function(){var e,n,t,r,o,c,s,i,a,u,l,d,f,h,p;return l={},c=0,f=0,d={h:72,j:74,k:75,l:76,next:39,prev:37,space:32,q:191,esc:27},e=function(e){return l=$.extend({$slides:$("section"),$modal:$(".modal"),$progress:$(".progress"),scrollSpeed:250,offsetPadding:40,activeClass:"is-active"},e),f=l.$slides.length,a(),window.location.hash&&u(),p(),t()},a=function(){return $(document).on("keydown",function(e){switch(r(e)){case d.h:return o(1);case d.j:return o("next");case d.next:return o("next");case d.space:return o("next");case d.k:return o("prev");case d.prev:return o("prev");case d.l:return o(f);case e.shiftKey&&d.q:return s("open");case d.esc:return s("close")}}),l.$modal.on("click",function(e){return e.preventDefault(),s("close")})},r=function(e){var n;return e=e||window.event,n=e.keyCode||e.which},u=function(){return c=window.location.hash.replace("#",""),i(c)},p=function(){var e;return e=Math.round(c/f*100),l.$progress.css("width",e+"%")},o=function(e){switch(e){case"next":c!==f&&c++;break;case"prev":1!==c&&c--;break;default:c=e}return h()},h=function(){return i(),n(),p()},i=function(e){var n;return null==e&&(e=c),n=$("section[data-id='"+e+"']"),$("body, html").animate({scrollTop:parseInt($(n).offset().top-l.offsetPadding)},l.scrollSpeed)},n=function(){return window.location.href="#"+c},s=function(e){return"open"===e&&l.$modal.toggleClass(l.activeClass),"close"===e?l.$modal.removeClass(l.activeClass):void 0},t=function(){return $("img").error(function(){return $(this).attr("src","http://placehold.it/1024x768/000/000/")})},{init:e}}()}).call(this),function(){jQuery(function(e){return Slidescore.init(),e("img").unveil()})}.call(this),function(){}.call(this);