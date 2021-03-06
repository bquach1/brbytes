let body =
''
<div class="w3-container w3-center"
     x-data="loginForm()"
>

${w "h1" "Spring 2021"}

${w "h3" "Computing Pathway Courses"}

  <div class="w3-panel">
    <label>Section Code:</label>
    <input type="text" name="sec" x-model="formData.sec">
  </div>

  <div class="w3-panel">
    <label>Student Code:</label>
    <input type="text" name="stu" x-model="formData.stu">
  </div>

  <div x-show="!foundLink">
    <button x-text="submitLabel()" :disabled="loading"
            x-on:click="submitData()"></button>
  </div>

  <div x-show="foundLink" w3-panel>
    <a x-text="message" x-bind:href="courseUrl"></a>
  </div>

  <div x-show="problem">

    <div class="w3-panel w3-pale-green">
      <p>
        If the form above does not take you to your course,
        please select it from the list below
      </p>
    </div>
  
    <div style="background-image: url('images/hacking.jpg');background-size: cover; transform: scale(0.75);">
      ${courseList}
    </div>

  </div>
</div>

<script src="assets/js/students.js"></script>

''

in
