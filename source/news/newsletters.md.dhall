let part1 = ''
    ${coloredHeader "indigo" "xxlarge" "Current Newsletter"}

    ${pdf "docs/nl/NewsLetter-Mar21.pdf" "February 2021"}
    ''

let part2 = ''
    ${coloredHeader "indigo" "xxlarge" "All Newsletters"}

    ### [March 2021](docs/nl/NewsLetter-Mar21.pdf)
    ### [February 2021](docs/nl/NewsLetter-Feb21.pdf)
    ### [December 2020](docs/nl/NewsLetter-Dec20.pdf)
    ### [November 2020](docs/nl/NewsLetter-Nov20.pdf)
    ### [October 2020](docs/nl/NewsLetter-Oct20.pdf)
    ''

in

''
---
title: Newsletters
---

${twoThirdsContainer part1 part2}
''
