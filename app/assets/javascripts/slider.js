const pics_src = ["top-banner-1.jpg","top-banner-2.png"];
let num = -1;


function slideshow_timer(){
  if (num === 1){
    num = 0;
  } 
  else {
    num ++;
  }
  document.getElementById("mypic").src = pics_src[num];
}

setInterval(slideshow_timer, 4000);