let title = "Students"
let body =
''

${slideshowImages "Banners/2103/"
    [ "Computing21-22Students.png"
    ]}


<div class="w3-container w3-center"
     x-data="loginForm()"
>

${w "h1" "Computing Pathway Courses"}

${w "h3" "Please enter your section code and student code here"}

  <div class="w3-panel">
    <label>Section Code:</label>
    <input type="text" name="sec" x-model="formData.sec">
  </div>

  <div class="w3-panel">
    <label>Student Code:</label>
    <input type="password" name="stu" x-model="formData.stu">
  </div>

  <div x-show="!foundLink">
    <button x-text="submitLabel()" :disabled="loading"
            x-on:click="submitData()"></button>
  </div>

  <div x-show="foundLink" w3-panel>
    <a x-text="message" x-bind:href="courseUrl"></a>
  </div>

  <img src="images/hacking.jpg" style="width: 50%; margin-top: 4ex; " alt="classroom photo">
</div>

<script src="assets/js/students.js"></script>

''

in
