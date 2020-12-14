let flexBoxContainer = 
    \(content : Text)->
''
<div class="flexbox-container">
${content}
</div>
''

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
<div class="w3-left-align w3-container">
${content}
</div>''

let image =
\(filename : Text) ->
''
<img src="${filename}"
style="border: #000000 4px solid; width:100%; max-width:300px;" />
''

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
<div class="my-slides w3-cell-row">
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(-1)"><strong>&#10094;</strong></a>
</div>
<div class="w3-cell w3-cell-middle w3-grey">
<img width="100%" src="${image}">
</div>
<div class="w3-cell w3-cell-middle w3-jumbo">
<a href="#" class="w3-text-indigo" onclick="plusDivs(+1)"><strong>&#10095;</strong></a>
</div>
</div>''

in
