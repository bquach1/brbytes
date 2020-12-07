<div class="my-slides w3-cell-row">
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(-1)"><strong>&#10094;</strong></a>
</div>
<div class="w3-cell w3-cell-middle w3-grey">
<img width="100%" src="slideshow1.png">
</div>
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(+1)"><strong>&#10095;</strong></a>
</div>
</div>
<div class="my-slides w3-cell-row">
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(-1)"><strong>&#10094;</strong></a>
</div>
<div class="w3-cell w3-cell-middle w3-grey">
<img width="100%" src="slideshow2.jpg">
</div>
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(+1)"><strong>&#10095;</strong></a>
</div>
</div>
<div class="my-slides w3-cell-row">
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(-1)"><strong>&#10094;</strong></a>
</div>
<div class="w3-cell w3-cell-middle w3-grey">
<img width="100%" src="slideshow3.jpg">
</div>
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(+1)"><strong>&#10095;</strong></a>
</div>
</div>
<div class="w3-left-align">
BRBytes was formed through a Research Practitioner Partnership between East Baton Rouge Parish School System (EBRPSS) and Louisiana State University (LSU) to bridge the gap in computer science and computational thinking education in Louisiana. The program does this by developing and implementing several middle and high school courses in EBRPSS and surrounding school districts.
</div>
<div class="flexbox-container">
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align">
- Developed 7 computer science and computational thinking courses for 7-12th grade students
- Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
- Trained 41 teachers
- Currently educating 1837 students
</div> 
</div>
<img class="flexbox-item" src="placeholder.jpg">
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align">
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
<img src="placeholder.jpg"
style="border: #000000 4px solid; width:100%; max-width:300px;" />

Test image in box 
</div>
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>Progress We Have Made</strong></h3>
</div>
<div class="w3-left-align">
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
<img src="placeholder.jpg"
style="border: #000000 4px solid; width:100%; max-width:300px;" />

Test image in box 
</div>
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>State of Computer Science in Louisiana</strong></h3>
</div>
<img src="placeholder.jpg"
style="border: #000000 4px solid; width:100%; max-width:300px;" />

Test image in box 
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

