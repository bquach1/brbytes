''
---
title: "Courses"
---

# Spring 2021

### Computing Pathway Courses

<form action="/invalid" method="POST" x-data="loginForm()" x-on:submit.prevent="submitData">
    <div class="">
    <label>Section Code:</label>
    <input type="text" name="sec" x-model="formData.sec">
    </div>

    <div>
    <label>Student Code:</label>
    <input type="text" name="stu" x-model="formData.stu">
    </div>

    <button x-text="submitLabel" :disabled="loading"></button>

    <a x-text="message" x-bind:src="courseUrl"></a>
</form>

<p>
If the form above does not take you to your course,
please select it from the list below:
</p>

<div style="background-image: url('images/hacking.jpg');background-size: cover;">
${courseList}
</div>


<script src="assets/js/students.js"></script>

''
