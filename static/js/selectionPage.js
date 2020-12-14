var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}

function loginSel(){ 
   let coursePrefixes = document.getElementById("coursePrefixes").value.split(",");
   let coursePrefix = document.getElementById("section_prefix"); 
   for (let prefix of coursePrefixes){
   	coursePrefix.value = prefix;
	login();
   }
}

function studentValidated(stuId){
   // Things to do when student is validated.
}