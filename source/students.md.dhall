''
---
title: Students
---

${w "h1" "Spring 2021"}

${w "h3" "Computing Pathway Courses"}

<div class="w3-container"
    x-data="loginForm()">

SubmitLabel 1 is <span x-text="message"></span>

  <div class="w3-panel">
    <label>Section Code:</label>
    <input type="text" name="sec" x-model="formData.sec">
  </div>

  <div class="w3-panel">
    <label>Student Code:</label>
    <input type="text" name="stu" x-model="formData.stu">
  </div>

SubmitLabel 2 is <span x-text="message"></span>

  <div x-show="!foundLink">
  <button x-text="submitLabel()" :disabled="loading"></button>
  </div>

  <div x-show="foundLink" w3-panel>
  <a x-text="message" x-bind:href="courseUrl"></a>
  </div>

</form>

SubmitLabel 3 is <span x-text="message"></span>

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

<script src="assets/js/students.js"></script>

''
