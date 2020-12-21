let placeholder = "placeholder.jpg"
in

''
---
title: "Landing"
---
${slideshowImages "Banners/2101/"
    [ "CommunityOfPracticeJanuary.png"
    , "HackAThon.png"
    , "NewsletterBannerDecember.png"
    , "HackAThon2.png"
    ]}
${leftAlign
''
BRBytes was formed through a Research Practitioner Partnership between East
Baton Rouge Parish School System (EBRPSS) and Louisiana State University (LSU)
to bridge the gap in computer science and computational thinking education in
Louisiana. The program does this by developing and implementing several middle
and high school courses in EBRPSS and surrounding school districts.''}

${flexBoxContainer ''
    ${flexBoxItem "Progress We Have Made" ''
        ${leftAlign ''
            - Developed 7 computer science and computational thinking courses for 7-12th grade students
            - Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
            - Trained 41 teachers
            - Currently educating 1837 students
            ''}
        ''}
    ${flexBoxImage placeholder}
    ${flexBoxItem "Progress We Have Made" ''
        ${leftAlign ''
            - Developed 7 computer science and computational thinking courses for 7-12th grade students
            - Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
            - Trained 41 teachers
            - Currently educating 1837 students
            ''}
        ''}
    ''}

${flexBoxContainer ''
    ${flexBoxItem "State of Computer Science in Louisiana" ''
        ${image placeholder}
        Test image in box
        ''}
    ${flexBoxItem "Progress We Have Made" ''
        ${leftAlign ''
            - Developed 7 computer science and computational thinking courses for 7-12th grade students
            - Implemented BRBytes curriculum in 30 schools across 6 districts in Louisiana
            - Trained 41 teachers
            - Currently educating 1837 students
            ''}
        ''}
    ${flexBoxItem "State of Computer Science in Louisiana" ''
        ${image placeholder}
        Test image in box
        ''}
    ''}
${slideshowScript}
''
