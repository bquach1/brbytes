<div id="main-div" style="padding: 100px 10%; text-align: center; overflow: auto;">
<div class="my-slides w3-row-padding">
<div class="w3-display-container" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-left w3-hover-opacity" onclick="plusDivs(-1); return false;"><strong>&#10094;</strong></a>
<img src="images/slideshow1.png" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-right w3-hover-opacity" onclick="plusDivs(+1); return false;"><strong>&#10095;</strong></a>
</div>
</div>
<div class="my-slides w3-row-padding">
<div class="w3-display-container" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-left w3-hover-opacity" onclick="plusDivs(-1); return false;"><strong>&#10094;</strong></a>
<img src="images/slideshow2.jpg" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-right w3-hover-opacity" onclick="plusDivs(+1); return false;"><strong>&#10095;</strong></a>
</div>
</div>
<div class="my-slides w3-row-padding">
<div class="w3-display-container" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-left w3-hover-opacity" onclick="plusDivs(-1); return false;"><strong>&#10094;</strong></a>
<img src="images/slideshow3.jpg" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-right w3-hover-opacity" onclick="plusDivs(+1); return false;"><strong>&#10095;</strong></a>
</div>
</div>
<div class="w3-left-align w3-padding-small">
BRBytes was formed through a Research Practitioner Partnership between East Baton Rouge Parish School System (EBRPSS) and Louisiana State University (LSU) to bridge the gap in computer science and computational thinking education in Louisiana. The program does this by developing and implementing several middle and high school courses in EBRPSS and surrounding school districts.
</div>

<div class="flexbox-container">
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align w3-padding-small">
- Developed 7 computer science and computational thinking courses for 7-12th grade students
- Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
- Trained 41 teachers
- Currently educating 1837 students

</div>
 
</div>
<img class="flexbox-item" src="images/placeholder.jpg">
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align w3-padding-small">
- Developed 7 computer science and computational thinking courses for 7-12th grade students
- Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
- Trained 41 teachers
- Currently educating 1837 students

</div>
 
</div>

</div>


<div class="flexbox-container">
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>State of Computer Science in Louisiana</strong></h3>
</div>
<img src="images/placeholder.jpg"
style="width:100%; max-width:500px;" />

Test image in box
 
</div>
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align w3-padding-small">
- Developed 7 computer science and computational thinking courses for 7-12th grade students
- Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
- Trained 41 teachers
- Currently educating 1837 students

</div>
 
</div>
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>State of Computer Science in Louisiana</strong></h3>
</div>
<img src="images/placeholder.jpg"
style="width:100%; max-width:500px;" />

Test image in box
 
</div>

</div>


</div>

<script>                                                                                                
var slideIndex = 0;
showDivs(slideIndex);                                                                                   
function plusDivs(n) {
    showDivs(slideIndex += n);
}                                                                                                       
function showDivs(n) {    
    var x = document.getElementsByClassName("my-slides");                                                   
    if (n >= x.length) {
        slideIndex = 0;
    }
    if (n < 0) {
        slideIndex = x.length-1;
    } 
    for (var i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex].style.display = "table";
}
</script>

