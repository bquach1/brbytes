let title = "Courses 2021-22 - Teacher Confirmation"

let logo = ''
<img src="images/ddem.png"
     class="w3-left"
     alt="LSU STEM Pathways logo"
     style="max-width: 20vw">
''

let desc = ''
<div class="w3-center">
  <ul class="w3-cell w3-ul">
    <li>Biomedical Studies</li>
    <li>Computing</li>
    <li>Digital Design and Emergent Media</li>
    <li>Pre-Engineering</li>
  </ul>
</div>
''

let main = ''
<div class="w3-container"
     x-data="mainForm()">

  <div class="w3-card">
    <h1>Teacher Confirmation</h1>
    <p class="w3-container w3-left-align">
      Please enter your email address in the box below to confirm
      which LSU STEM Pathways courses you will teach in 2021-22.
    </p>

    <p>
      <div class="w3-panel w3-center">
        <label>Email Address:</label>
        <input type="text" name="email" x-model="formData.email"
               x-on:change="submitEmail()">
      </div>
      
      <div x-show="state === 0">
        <button x-text="submitLabel()" :disabled="loading"
                x-on:click="submitEmail()"></button>
      </div>

      <div x-show="state === 2">
        Your school has you teaching the following courses:
        <div class="w3-container w3-border">
          <ul class="w3-ul">
            <template x-for="item in teacherInfo" :key="item">
              <li x-text="item.course" class="w3-light-green"></li>
            </template>
          </ul>
        </div>
        <div class="w3-panel">
          <p>
            Please select one of these options:
          </p>
          <button class="w3-green">Confirm these courses</button>
          <button class="w3-red">The list is incomplete or incorrect</button>
        </div>
      </div>

      <div x-show="state === 10"
           x-text="JSON.stringify(teacherInfo)">
      </div>

      <div x-show="state === 3">
        <h1>NOT FOUND</h1>
        <button x-on:click="tryAgain()">Try Again</button>
      </div>
        
    </p>
  </div>
</div>
''

let layout = ''
<div class="w3-row-padding plain-links">
  <div class="w3-display-container" style="width: 100%; max-height: 100px">
    <div class="w3-card">
      <header class="w3-container w3-purple">
        <h1>LSU STEM Pathways</h1>
        <h2>Courses 2021-22</h2>
      </header>
      <div class="w3-row">
        <div class="w3-col s3">
          ${logo}
        </div>
        <div class="w3-col s9">
          ${main}
        </div>
      </div>

    </div>
  </div>
</div>
''

let body =
''

${layout}

<script src="assets/js/caincenter.js"></script>

''

in
