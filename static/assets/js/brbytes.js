
function randomUrl(eid,base) {
    let elem = document.getElementById(eid);
    elem.href = base + '?v=' + Math.random().toString(36).slice(2);
}

window.addEventListener('load', function() { 
    randomUrl("navigation-header-students", "/students.html"); // "/school-list.html"
    randomUrl("navigation-menu-students", "/students.html"); // "/school-list.html"
});

window.addEventListener('click', function(e) { // closes all dropdown menus if user clicks outside a dropdown menu
    var obj = e.target.parentNode;
    if(!(obj.className.includes("dropdown-content") || obj.className.includes("dropdown-button"))) {
        x = document.getElementsByClassName("dropdown-content");
        for(i = 0; i < x.length; i++) { // gets all dropdown-content objects and hides them
            if(x[i].className.includes("w3-show")) {
                x[i].className = x[i].className.replace(" w3-show","");
            }
        }
    }
})

function toggleDropdown(dropdown) {
    var x = document.getElementById(dropdown);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
} 
