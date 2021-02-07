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
    , hash = "85e4eef9bf5e4a3c"
    }
,   { desc = "Computing Everywhere (without Intro to STEM)"
    , course = "cew"
    , version = "20b"
    , hash = "cd1c69d9536ec340"
    }
,   { desc = "Survey of Computer Science"
    , course = "scs"
    , version = "20c"
    , hash = "a9fc3327b82d46ec"
    }
,   { desc = "Intro to Computational Thinking (For sections that started in January 2021)"
    , course = "ict"
    , version = "21a"
    , hash = "78e1b071fbfbd063"
    }
,   { desc = "Intro to Computational Thinking (For sections that started in Fall 2020)"
    , course = "ict"
    , version = "20c"
    , hash = "349c342b10acee11"
    }
,   { desc = "Cyber Security (For sections that started in January 2021)"
    , course = "cyb"
    , version = "21a"
    , hash = "815f835313394be3"
    }
,   { desc = "Cyber Security (For sections that started in Fall 2020)"
    , course = "cyb"
    , version = "20c"
    , hash = "334912b5cdea76d8"
    }
,   { desc = "Data Manipulation and Analysis"
    , course = "dma"
    , version = "20c"
    , hash = "51e58dec5d699dc9"
    }
,   { desc = "Programming for STEM"
    , course = "prg"
    , version = "20c"
    , hash = "4c24169bcb4c324c"
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
