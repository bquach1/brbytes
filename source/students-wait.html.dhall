let title = "Students Wait"
let body = ''
<div class="w3-card-4" style="font-size: 100%; font-family: serif;">

  <header class="w3-container w3-red"><span id="timer">WARNING!</span></header>

  <p>The credentials you entered do not exist.</p>
  
  <p>Please check your spelling and pay attention to characters that are
    similar. Here are some groups of characters that are often confused
    with each other:

    <div class="w3-panel">
      <ul class="w3-ul w3-border">
        <li>${b "0"} and ${b "O"}</li>
        <li>${b "1"}, ${b "l"}, and ${b "I"}</li>
        <li>Uppercase and lowercase versions of a letter, such as 
          <ul>
            <li>${b "j"} and ${b "J"}</li>
            <li>${b "k"} and ${b "K"}</li>
            <li>${b "p"} and ${b "P"}</li>
          </ul>
      </ul>
    </div>
  </p>

  <p>
    If the problem persists, please try choosing the course
    from the <a href="students-fallback.html">course list.</a>
  </p>

  <footer class="w3-container w3-red">
    Wait <span id="initial"></span> seconds before trying again.
  </footer>

</div>

<script src="assets/js/moment.js"></script>
<script>
  let time = 15;
  document.getElementById('initial').innerText = time;
  setInterval(() => {
  if(time > 0) { document.getElementById('timer').innerText = time; time--; }
  else { window.location.replace('students.html'); }
  }, 1000);
  
</script>
''
