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

let email = ''
<a href="mailto:info@lsupathways.org"
   style="text-decoration: underline">send us an email</a>''

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
        According to our records,
        your school has you teaching the following courses:
        <div class="w3-container w3-border">
          <ul class="w3-ul">
            <template x-for="item in teacherInfo" :key="item">
              <li x-html="showCourse(item)"></li>
            </template>
          </ul>
        </div>
        <div class="w3-panel">
          <p>
            Please select one of these options:
          </p>
          <button class="w3-green"
                  x-on:click="submitConfirm('confirmed')">Confirm these courses</button>
          <button class="w3-red"
                  x-on:click="submitConfirm('rejected')">The list is incomplete or incorrect</button>
        </div>
      </div>

      <div x-show="state === 10"
           x-text="JSON.stringify(teacherInfo)">
      </div>

      <div x-show="state === 3">
        <h1>NOT FOUND</h1>

        <p>
        We could not find your email address in our records.<br>
        If you think this is a mistake, please ${email},
        and we will try to assist you.
        </p>
        <p>
        You can also try again by clicking the button below.
        </p>
        <button x-on:click="tryAgain()">Try Again</button>
      </div>

      <div x-show="state === 5">
        <h1>THANK YOU</h1>

        <p>
          Your confirmation has been recorded. You will be
          contacted by the summer instructors regarding the
          training for the courses.
        </p>
      </div>

      <div x-show="state === 6">
        <h1>We are sorry</h1>

        <p>
          We apologize for the inconsistency of our records.
          Please ${email},
          and we will to set you up correctly.
        </p>
      </div>

      <div x-show="state === 7">
        <h1>ERROR</h1>

        <p>
          An error occurred while trying to register your response.
          Please ${email},
          and we will assist you in finishing the registration.
        </p>
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

<div class="w3-card">
  <style>
    a { text-decoration: underline }
  </style>

  <h4>LSU Summer Institute Information</h4>

  <p class="w3-left-align">
    For additional information about the LSU Summer Institute, please
    consult the following links:
    
    <ul class="w3-left-align">
      <li><a href="https://lsupathways.org">LSU Pathways Web site</a></li>
      <li><a href="sti-catalog.pdf">Course Catalog</a></li>
    </ul>
  </p>
</div>

<div class="w3-panel">
For any question, problem or concern, please send us an email
to <a href="mailto:info@lsupathways.org">info@lsupathways.org</a>
</div>

<script src="assets/js/caincenter.js"></script>

''

in
