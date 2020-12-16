let main-div =
   \(padding : Text)->
   \(alignment : Text)->
   \(content : Text)->
''
<div id="main-div" style="padding: ${padding}; text-align: ${alignment}; overflow: auto;">
${content}
</div>''

let twoThirdsContainer =
    \(smallContent : Text)->
    \(largeContent : Text)->
''
<div class="w3-col m8 w3-padding">${smallContent}</div>
<div class="w3-col m4 w3-padding">${largeContent}</div>''

let overlappingImageContainer = 
    \(content : Text)->
    \(image : Text)->
''
<div class="w3-row" style="padding-left: 5%;">
<div class="w3-col m7">
<div class="w3-center">${content}</div>
</div>
<div class="w3-col m5 absolute-position-image">
<img src="${image}" style="width: 100%;">
</div>
</div>''

let purpleBackgroundContainer =
    \(content : Text)->
''
<div class="w3-row w3-theme-l4" style="padding: 32px 0 64px 0">
<div class="w3-col m10 w3-bottombar w3-border-indigo" style="padding-left: 5%;">${content}</div>
</div>''

let fiveRings = 
    \(text1 : Text)->
    \(text2 : Text)->
    \(text3 : Text)->
    \(text4 : Text)->
    \(text5 : Text)->
''
<span class="table-container">
<span style="display: table-row">
<span class ="table-item table-item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text1}
</span>
<span class="table-item table-item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text2}
</span>
<span class="table-item table-item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text3}
</span>
</span>
</span>
<span class="table-container">
<span style="display: table-row">
<span class ="table-item table-item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text4}
</span>
<span class="table-item table-item-small w3-circle w3-border-yellow w3-bottombar w3-topbar w3-leftbar w3-rightbar">
${text5}
</span>
</span>
</span>''

let coloredCircle =
    \(color : Text)->
    \(content : Text)->
''
<div class="w3-${color} w3-circle box-item box-item-large">${content}</div>''

let coloredHeader = 
    \(color : Text)->
    \(size : Text)->
    \(content : Text)->
''
<h1 class="w3-text-${color} w3-${size}">${content}</h1>''

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
\(image : Text)->
''
<img class="flexbox-item" src="${image}">''

let leftAlign =
\(content : Text)->
''
<div class="w3-left-align w3-padding-small">
${content}
</div>''

let image =
\(filename : Text) ->
''
<img src="${filename}"
style="width:100%;" />''

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
    \(image : Text)->
''
<div class="my-slides w3-row-padding">
<div class="w3-display-container" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-left w3-hover-opacity" onclick="plusDivs(-1); return false;"><strong>&#10094;</strong></a>
<img src="${image}" style="width: 100%;">
<a href="#" class="w3-text-indigo w3-jumbo w3-display-right w3-hover-opacity" onclick="plusDivs(+1); return false;"><strong>&#10095;</strong></a>
</div>
</div>''

in
