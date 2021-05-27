let concatMapSep = https://prelude.dhall-lang.org/Text/concatMapSep
let concatSep = https://prelude.dhall-lang.org/Text/concatSep

let padding = env:T_PADDING as Text
let alignment = env:T_ALIGNMENT as Text
let dispatch = env:T_DISPATCH as Text

let b = \(text : Text) -> "<strong>${text}</strong>"
-- let i = \(text:Text) -> "<em>${text}</em>"
-- let x = \(text:Text) -> ""

let MenuStyle = < Wide | Narrow >

let navigation/logoImage = ''
<div id="navigation-logo-image" class="header w3-bar-item" style="padding-right: 0;">
  <a href="/index.html"><img id="navigation-logo-brbytes"
                             src="/images/Logos/brbytes.png" height="50vh"></a>
</div>
''

let navigation/logoHeading = ''
<div id="navigation-logo-heading" class="w3-bar-item">
  <p class="no-margin">Baton Rouge:</p> 
  <p class="no-margin">Bringing Youth Technology,</p>
  <p class="no-margin">Education and Success</p>
</div>
''

let navigation/contact = ''
<div class="w3-row w3-right">
  <p id="navigation-contact"><em>Contact BRBytes: <a href="mailto:info@brbytes.org">info@brbytes.org</a></em></p>
</div>
''

let ImgLink = { file : Text, ref : Text }

let footer/logos =
\(imgs : List ImgLink) ->
let logo = \(img : ImgLink) -> ''
<a href="${img.ref}" target="_blank">
<img class="w3-margin-left w3-margin-right"
     src="/images/Logos/${img.file}.png" height="40vh">
</a>''
in
concatMapSep "\n" ImgLink logo imgs

------------------------------------------------------------
-- MenuStyle components
------------------------------------------------------------

let makeMenu =
\(menu : MenuStyle) ->
\(item : MenuStyle -> Text) ->
item menu

let navigation =
\(items : List (MenuStyle -> Text)) ->
\(menu : MenuStyle) ->
merge
{ Wide = ''
<div id="navigation-header" class="w3-row w3-text-indigo">
${concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items}
</div>''
, Narrow = ''
<div x-data="{ open: false }">
  <div class="dropdown-content w3-text-indigo w3-center w3-padding w3-large plain-links"
       x-on:hamburger.window="open = !open"
       x-bind:class="{ 'w3-hide': !open }">
    ${concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items}
  </div>
</div>''
} menu

let navigation/wide = 
\(items : List (MenuStyle -> Text)) ->
''
<div class="w3-bar-block w3-rest w3-right plain-links">
  ${navigation/contact}
  ${navigation items MenuStyle.Wide}
</div>
''

let navigation/narrow =
\(items : List (MenuStyle -> Text)) ->
navigation items MenuStyle.Narrow

let navigation/hamburger = 
''
<div id="navigation-hamburger"
     class="header dropdown-button w3-bar-item w3-right" 
     style="padding-top: 0;">
  <a href="#" class="header dropdown-button w3-xlarge w3-bar-item w3-button"
     x-data
     x-on:click="${dispatch}('hamburger',null)">${b "&#9776"}</a>
</div>
''

let item =
\(desc : Text) ->
\(link : Text) ->
\(menu : MenuStyle) ->
merge
{ Wide = ''
<a class="w3-padding" href="${link}">${b desc}</a>''
, Narrow = ''
<a href="${link}">${b desc}</a><br>''
} menu

let random =
\(desc : Text) ->
\(label : Text) ->
\(menu : MenuStyle) ->
merge
{ Wide = ''
<a id="navigation-header-${label}" class="w3-padding" href="/">${b desc}</a>''
, Narrow = ''
<a id="navigation-menu-${label}" href="/">${b desc}</a><br>''
} menu

let dropdown =
\(desc : Text) ->
\(extra : Text) ->
\(items : List (MenuStyle -> Text)) ->
\(menu : MenuStyle) ->
merge
{ Wide =
''
<div class="dropdown-button" style="display: inline-block; ${extra}"
     x-data="{ open: false }"
     x-on:click.away="open = false">
     <a class="dropdown-button w3-padding" href="#" 
     x-on:click="open = !open">${b desc}</a>
  <div class="dropdown-content w3-dropdown-content accent-color w3-bar-block"
       x-bind:class="{ 'w3-show': open }">
    ${concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items}
  </div>
</div>
''
, Narrow =
''
<div x-data="{ open: false }">
  <a class="dropdown-button" href="#" 
     x-on:click="open = !open">${b desc}</a><br>
  <div class="dropdown-content"
       x-bind:class="{ 'w3-hide': !open }">
    ${concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items}
  </div>
</div>
''
} menu

let subitem =
\(desc : Text) ->
\(link : Text) ->
\(menu : MenuStyle) ->
merge
{ Wide = ''
<a href="${link}" class="w3-bar-item">${desc}</a>''
, Narrow = ''
<a href="${link}">${desc}</a><br>''
} menu

------------------------------------------------------------
-- Main
------------------------------------------------------------

let hold1 = subitem "BRBytes Research Study" "https://cloud.brbytes.org/s/zamoYXtqBNs3GCs"

let menuItems =
  [ item "TEACHERS" "teachers.html"
  , item "STUDENTS" "students.html"
  , dropdown "PARENTS" ""
        [ subitem "Pathways" "pathways.html"
        , subitem "LSU Computing Brief" "ComputingBrief.pdf"
        , subitem "Course Descriptons" "course-descriptions.html"
        , subitem "Careers in Computing"
                  "https://cloud.brbytes.org/s/DEA47SQAbw7Rwws"
        ]
  , dropdown "SCHOOLS" ""
        [ subitem "LSU Computing Brief" "ComputingBrief.pdf"
        , subitem "BRBytes Research Study" "schools.html"
        ]
  , dropdown "NEWS" ""
        [ subitem "March 2021" "nl2103.html"
        , subitem "Newsletters" "newsletters.html"
        , subitem "Announcements" "announcements.html"
        ]
  , dropdown "ABOUT" ""
        [ subitem "About BRBytes" "overview.html"
        , subitem "Participating Schools"
                  "https://cloud.brbytes.org/s/5ZkGY4PkZTNXWqE"
        , subitem "Contact" "contact.html" 
        , subitem "Course Descriptions" "course-descriptions.html"
        ]
  ]

let navigation/content = ''
<div class="header accent-color w3-bar w3-row">
  <div class="w3-col" style="width: fit-content; width: -moz-fit-content;">
    ${navigation/logoImage}
    ${navigation/logoHeading}
  </div>
  ${navigation/hamburger}
  ${navigation/wide menuItems}
</div>
${navigation/narrow menuItems}
''

let navigation/footer = ''
${footer/logos [ { file = "usdoe", ref = "https://www.ed.gov/" }
               , { file = "lsu",   ref = "https://www.lsu.edu/" }
               , { file = "ebrpss",ref = "https://ebrschools.org/" }
               , { file = "nsf",   ref = "https://www.nsf.gov/" }
               , { file = "csforall", ref = "https://www.csforall.org/" }
               ]}
''

in
''
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="BRBytes Main Page">
    <title>BRBytes &ndash; LSU Computing Pathway &ndash; ${title}</title>
    <link rel="stylesheet" href="/assets/css/w3.css">
    <link rel="stylesheet" href="/assets/css/w3-theme-indigo.css">
    <link rel="stylesheet" href="/assets/css/landing-styles.css">
    <!-- <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script> -->
    <script src="/assets/js/alpine.js" defer></script>
  </head>
  <body>
    <div class="header accent-color w3-bottombar w3-border-yellow w3-small sticky"
         style="padding: 8px 16px 0;">
      ${navigation/content}
    </div>
    <div class="header accent-color w3-bottombar w3-border-yellow w3-small"
         style="padding: 8px 16px 0;">
      ${navigation/content}
    </div>

    <div id="main-div" style="padding: ${padding}; text-align: ${alignment};">
      <!--this div contains the body of the page-->
${body}
      <!--end of body-->
    </div>

<div class="accent-color w3-center w3-topbar w3-border-yellow w3-padding-large">
      ${navigation/footer}
    </div>
    <div id="sticky-footer"
         class="sticky footer accent-color w3-center w3-topbar w3-border-yellow w3-padding-large w3-hide-small">
      ${navigation/footer}
    </div>

    <script src="assets/js/brbytes.js"></script>
  </body>
</html>
''
