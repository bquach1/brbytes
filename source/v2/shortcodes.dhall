let accordionBox =
    \(id : Text)->
    \(heading: Text)->
    \(content : Text)->
''
<div class="w3-grey accordion-box">
<h2 class="w3-yellow w3-text-xlarge clickable" onclick="toggleDropdown('${id}')">${heading}</h2>
<div id="${id}" class="w3-hide">${content}</div>
</div>''

let cellRow =
    \(content : Text)->
''
<div class="w3-cell-row">${content}</div>''

let coloredCircle =
    \(color : Text)->
    \(content : Text)->
''
<div class="w3-${color} w3-circle box-item item-large">${content}</div>''

let coloredHeader = 
    \(color : Text)->
    \(size : Text)->
    \(content : Text)->
''
<h1 class="w3-text-${color} w3-${size}">${content}</h1>''

let fiveRings = 
    \(text1 : Text)->
    \(text2 : Text)->
    \(text3 : Text)->
    \(text4 : Text)->
    \(text5 : Text)->
''
<span class="table-container">
<span style="display: table-row">
<span class ="table-item item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text1}
</span>
<span class="table-item item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text2}
</span>
<span class="table-item item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text3}
</span>
</span>
</span>
<span class="table-container">
<span style="display: table-row">
<span class ="table-item item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text4}
</span>
<span class="table-item item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text5}
</span>
</span>
</span>''

let flexBoxContainer = 
    \(content : Text)->
''
<div class="flexbox-container">
${content}
</div>''

let flexBoxItem =
    \(title : Text)->
    \(content : Text)->
''
<div class="w3-grey w3-padding flexbox-item">
<div class="w3-light-grey w3-text-indigo">
<h3 class="w3-padding"><strong>${title}</strong></h3>
</div>
${content} 
</div>''

let flexBoxImage =
\(filename : Text)->
''
<img class="flexbox-item" src="images/${filename}">''

let image =
\(filename : Text)->
''
<img src="images/${filename}"
style="width:100%;">''

let leftAlign =
\(content : Text)->
''
<div class="w3-left-align w3-padding-small">
${content}
</div>''

let overlappingImageContainer = 
    \(content : Text)->
    \(image : Text)->
''
<div class="w3-row left-padded-div">
<div class="w3-col m7">
<div class="w3-center">${content}</div>
</div>
<div class="w3-col m5 absolute-position-image">
<img src="images/${image}" style="width: 100%;">
</div>
</div>''

let padding = 
\(amount : Text)->
\(content : Text)->
''
<div style="padding: ${amount};">${content}</div>''

let paragraphBlock =
    \(heading : Text)->
    \(content : Text)->
''
<div class="paragraph-block">
${coloredHeader "indigo" "xlarge" "${heading}"}
<h4>${content}</h4>
</div>''

let purpleBackgroundContainer =
    \(firstContent : Text)->
    \(secondContent : Text)->
''
<div class="w3-row w3-theme-l4" style="padding: 32px 5vw 0;">
<div class="w3-col m7">${firstContent}</div>
</div>
<div class="w3-row w3-theme-l4" style="padding: 0 0 64px;">
<div class="w3-col m10 w3-bottombar w3-border-indigo">
<div style="padding-left: 5vw;">${secondContent}</div>
</div>
</div>''

let smallPadding =
\(content : Text)->
''
${padding "8px 0" "${content}"}''

let slideshowScript =
''
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
</script>''

let slideshowImage =
    \(filename : Text)->
''
<div class="my-slides w3-row-padding">
<div class="w3-display-container" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-left w3-hover-opacity" onclick="plusDivs(-1); return false;"><strong>&#10094;</strong></a>
<img src="images/${filename}" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-right w3-hover-opacity" onclick="plusDivs(+1); return false;"><strong>&#10095;</strong></a>
</div>
</div>''

let teamBio =
    \(image : Text)->
    \(name : Text)->
    \(title : Text)->
    \(about : Text)->
''
<div class="w3-cell w3-mobile w3-center" style="width: 33.3%; padding: 32px 0;">
<img class="w3-circle item-medium" src="images/${image}">
<h3 class="w3-text-indigo no-margin w3-margin-top"><strong>${name}</strong></h3>
<h3 class="no-margin" style="font-weight: lighter;"><em>${title}</em></h3>
<h4 style="width: 70%; margin: auto;">${about}</h4>
</div>''

let thirdsContainer =
    \(firstContent : Text)->
    \(secondContent : Text)->
    \(thirdContent : Text)->
''
<div class="w3-row w3-center">
<div class="w3-col m4">${firstContent}</div>
<div class="w3-col m4">${secondContent}</div>
<div class="w3-col m4">${thirdContent}</div>
</div>''

let twoThirdsContainer =
    \(smallContent : Text)->
    \(largeContent : Text)->
''
<div class="w3-col m8 w3-padding">${smallContent}</div>
<div class="w3-col m4 w3-padding">${largeContent}</div>''

let underlinedColoredHeader =
    \(color : Text)->
    \(size : Text)->
    \(content : Text)->
''
<h1 class="w3-text-${color} w3-${size} w3-bottombar w3-border-yellow" style="width: fit-content; padding: 8px 0;">${content}</h1>''

in
