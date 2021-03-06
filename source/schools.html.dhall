let brbseq = ma (i "BRBytes Sequence") "#brbseq"

let title = "Participating in the BRBytes study"
let body = concatSep "\n"

[ w "h1"  "What is the BRBytes study?"

, p ''
The BRBytes research program is currently supported by 
two Federal grants:
''

, ul
[ ma "The BRBytes Researcher-Practitioner Partnership"
     "https://cloud.brbytes.org/s/9xg9PibrZTWcXAd"
  ++ " - National Science Foundation"

, ma ''
  A Modern Approach to the Integration of Programming and
  Mathematics''
  "https://cloud.brbytes.org/s/NSLMaorzZ7mXHt5"
  ++ " - US Dept. of Education"
]

, w "h1" "Participating in the USDOE Research"

, p ''
The US Dept. of Education granted LSU $4M to study the
impact of ${b "Computational Thinking"} in the learning of
${b "Mathematics"}. If successful, this study will inform
development of future courses nationwide that integrate
the two subjects. This is a high-stakes study with possible
long term benefits.
''

, w "h2" "School requirements"

, ul
[ "Offer the ${brbseq} in your course catalog for at least 2 years"
, "Recruit 2 teachers to teach the BRBytes courses"
, "Designate 1 counselor as point of contact"
, ''
  Enroll between 20% and 50% of students who are taking
  ${b "Algebra I"} to take a BRBytes course concurrently''
]

, p ''
<script>
let preamble = "your school will need ";
let postamble = " students enrolled in the "
              + "<a href=#brbseq>BRBytes Sequence</a>.";

function need(lo,hi) {
    if(Math.abs(lo-hi)<4)
    return preamble
           + "<strong>" + Math.round((lo+hi)/2) + "</strong>"
           + postamble;
    return preamble
           + "between <strong>" + Math.round(lo) + "</strong>"
           + " and "
           + "<strong>" + Math.round(hi) + "</strong>"
           + postamble;
}
function atleast(n) {
    return preamble
           + "<strong>at least " + Math.round(n) + "</strong>"
           + postamble;
}
function estimate(n) {
    if(n < 40) return "please contact us.";
    else if(n < 80) return atleast(40);
    else if(n < 200) return need(40,n/2);
    else return need(0.2*n,n/2);
}
</script>
<div x-data="{ algebra: null }" class="w3-card-4">
  <header class="w3-container w3-brown">
    <h1>Student Number Calculator</h1>
  </header>

  <div class="w3-container">
    Please enter below the expected number of students that
    will be enrolled in ${b "Algebra I"} in the 21-22 Academic Year.
  </div>
  <div class="w3-container w3-padding-24">
    <label>Students in Algebra I</label>
    <input type="text" x-model.number="algebra">
    <template x-if="algebra && algebra>0">
      <p>
        To participate in the study,
        <span x-html="estimate(algebra)"></span>
      </p>
    </template>
  </div>
</div>

${x ''
* Algebra I total | BRBytes enrollment |
* 200 or more | btw 20% and 50% |
* less than 200 | btw 40 and 50% |
* less than 80 | at least 40 |
''}
''

, w "h3" 
  ''
  Suggested language to include in your recruitment
  pamphlets, course request forms and other
  student or parent facing materials:''

, blockquote "" ''
${brbseq}: This is a unique course pairing offered in our
school, which provides students the opportunity to
take two courses:
${b "Introduction to Computational Thinking"}
and another introductory
LSU STEM Pathways course.
Students who join the sequence will take one of the
courses the first year and the other course in the following year.
The two courses focus on essential
STEM skills that are appropriate either for career technical education or
for college preparation.
''

, "<h1 id=brbseq>The BRBytes Sequence</h1>"

, p ''
The ${brbseq} is two-year, two-course sequence containing:
''

, ul
[ "Introduction to Computational Thinking, and"
, ''
  An LSU STEM Pathways course that counts as a ${b "BRBytes elective"}.<br>
  Depending on what each school offers, the options are:
    ${ul [ "Cybersecurity"
         , "Introduction to Engineering Design"
         , "Introduction to Biomedical Sciences, or"
         , "Survey of Computer Science"
         ]}
  ''
]

, p ''
All students will be able to take both courses,
but the order in which each student takes each course
will be determined by a coin flip.
Students and parents will be informed that the course sequence
is two years and that students will be assigned to each
individual course by the school.
''

, p ''
The sequence begins the year the student takes Algebra I. All the
participating students will be divided into 2 groups, and the
courses that the student takes will depend on which group the
student is in, as the following tables illustrate:
''

, p ''
<img src="images/bb_seq09.png" style="width:60%">
<img src="images/bb_seq10.png" style="width:60%">
''

, w "h2" "Counselor requirements"

, p ''
Counselors will receive a $450 stipend
per year for participating.
''

, p "Counselors will:"

, ul
[ "Help recruit students for the study"
, ''
  Coordinate with our team to assign participating students
  to the courses''
, "Track BRBytes students in their progression"
, "About 30 minutes once a month needed for above work"
, ''
  In addition, they will need:
  ${ul [ ''
         Half a day during the recruitment period
         to coordinate enrollment with the BRBytes team''
       , ''
         Half a day before final scheduling (typically July/August)
         for schedule review of BRBytes students''
       ]}
  ''
]

, w "h2" "Teacher requirements"

, p ''
Teachers will receive a $4,100 stipend${w "sup" "1"}
per year for participating.
''

, p "Teachers will:"

, ul
[ "Commit to teach BRBytes courses for at least 2 years"
, ''
  Attend the 5-week virtual summer training institute
  for the BRBytes courses''
, "Participate in monthly Community of Practice sessions"
, "Agree to on-site follow-up for two years"
, ''
  Maintain an open line of communication with the
  LSU Computing Pathway staff''
]

, p "1: The stipend is subject to state-mandated deductions."

]

in
