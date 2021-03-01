let placeholder = "placeholder.jpg"
in

''
---
title: "BRBytes Home"
---

<div class="w3-row-padding plain-links">
<div class="w3-display-container" style="width: 100%;">

<div class="w3-card">
<header class="w3-container w3-brown">
<h1>It is time to think about computing classes for next year.</h1>
</header>
<div class="w3-container">
<p>Students, teachers, and everyone else can help spread the word
<ul>
<li>Tell your peers
<li>Tell your teachers
<li>Tell your students
<li>Tell your counselors
</p>
</div>

</div>
</div>

${x ''
${slideshowImages "Banners/2102/"
    [ "CommunityOfPracticeFebruary.png"
    , "TeacherSummerPD2021.png"
    , "AprilHackAThon.png"
    ]}
''}
${leftAlign
''
BRBytes was formed through a Research Practitioner Partnership between East
Baton Rouge Parish School System (EBRPSS) and Louisiana State University (LSU)
to bridge the gap in computer science and computational thinking education in
Louisiana. The program does this by developing and implementing several middle
and high school courses in EBRPSS and surrounding school districts.''}

${flexBoxContainer ''
    ${flexBoxItem "What We Offer" ''
        ${leftAlign ''
            The BRBytes curriculum offers an array of courses that teach
            students skills to be successful in the 21st century job market.
            These courses fit the interests of a variety of students by providing
            education on different subjects, such as cybersecurity, programming,
            and data manipulation and analysis.
            ''}
        ''}
    ${flexBoxImage placeholder}
    ${flexBoxItem "Computer Science in Louisiana Schools" ''
        ${leftAlign ''
            Computer and mathematical occupations are projected to have
            the largest 10-year growth in Louisiana. However, currently
            only 16% of public schools are teaching computer science courses.
            BRBytes is working to expand the reach of computer science until
            all Louisiana public schools offer these courses.
            ''}
        ''}
    ''}

${flexBoxContainer ''
    ${flexBoxItem "CS for ALL" ''
        ${image "MikeTheCodingTiger.png"}
        Everyone can code!
        ''}
    ${flexBoxItem "Progress We Have Made" ''
        ${leftAlign ''
            - Developed 7 computer science and computational thinking courses for 7-12th grade students
            - Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
            - Trained 41 teachers
            - Currently educating 1837 students
            ''}
        ''}
    ${flexBoxItem "Student Gallery" ''
        ${image "canvas.png"}
        Coding is fun!
        ''}
    ''}
${slideshowScript}
''
