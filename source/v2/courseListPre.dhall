let concatMapSep = https://prelude.dhall-lang.org/v9.0.0/Text/concatMapSep

let Course =
    { desc : Text
    , course : Text
    , version : Text
    , hash : Text
    }

let courses : List Course = [
    { desc = "Intro to STEM Pathways and Careers"
    , course = "cew"
    , version = "20c"
    , hash = lessons-cew/20c
    }
,   { desc = "Computing Everywhere (without Intro to STEM)"
    , course = "cew"
    , version = "20b"
    , hash = lessons-cew/20b
    }
,   { desc = "Survey of Computer Science"
    , course = "scs"
    , version = "20c"
    , hash = lessons-scs/20c
    }
,   { desc = "Intro to Computational Thinking (For sections that started in January 2021)"
    , course = "ict"
    , version = "21a"
    , hash = lessons-ict-21a/21a
    }
,   { desc = "Intro to Computational Thinking (For sections that started in Fall 2020)"
    , course = "ict"
    , version = "20c"
    , hash = lessons-ict-21a/20c
    }
,   { desc = "Cyber Security (For sections that started in January 2021)"
    , course = "cyb"
    , version = "21a"
    , hash = lessons-cyb-21a/21a
    }
,   { desc = "Cyber Security (For sections that started in Fall 2020)"
    , course = "cyb"
    , version = "20c"
    , hash = lessons-cyb-20c/20c
    }
,   { desc = "Data Manipulation and Analysis"
    , course = "dma"
    , version = "20c"
    , hash = lessons-dma/20c
    }
,   { desc = "Programming for STEM"
    , course = "prg"
    , version = "20c"
    , hash = lessons-prg/20c
    }

]

let format =
    \(item : Course) ->
''
<li>
<a class="pure-link" href="/courses/${item.hash}/">${item.desc}</a>
</li>
''

let template = ''
<div class="w3-row">
<div class="w3-col s0 l3 w3-container">
</div>
<div class="w3-col s12 l6">
<div class="w3-cell-row">
<div class="w3-cell plain-links">
<ul class="pure-list">
${concatMapSep "\n" Course format courses}
</ul>
</div>
</div>
</div>
<div class="w3-col s0 l3 w3-container">
</div>
</div>
''

in template
