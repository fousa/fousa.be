/**
 * inViewport jQuery plugin by Roko C.B. stackoverflow.com/questions/24768795/
 *
 * Returns a callback function with an argument holding
 * the current amount of px an element is visible in viewport
 * (The min returned value is 0 (element outside of viewport)
 * The max returned value is the element height + borders)
 */
;(function($, win) {
  $.fn.inViewport = function(cb) {
     return this.each(function(i,el) {
       function visPx(){
         var elH = $(el).outerHeight(),
             H = $(win).height(),
             r = el.getBoundingClientRect(), t=r.top, b=r.bottom;
         return cb.call(el, Math.max(0, t>0? Math.min(elH, H-t) : (b<H?b:H)));  
       }
       visPx();
       $(win).on("resize scroll", visPx);
     });
  };
}(jQuery, window));
