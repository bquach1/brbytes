let part1 = ''
    ${coloredHeader "indigo" "xxlarge" "Current Newsletter"}

    ${pdf "docs/nl/NewsLetter-Dec20.pdf" "December 2020"}
    ''

let part2 = ''
    ${coloredHeader "indigo" "xxlarge" "All Newsletters"}

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
