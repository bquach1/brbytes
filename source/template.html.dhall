let concatMapSep = https://prelude.dhall-lang.org/v9.0.0/Text/concatMapSep
let concatSep = https://prelude.dhall-lang.org/v9.0.0/Text/concatSep

let b = \(text:Text) -> "<strong>${text}</strong>"
let i = \(text:Text) -> "<em>${text}</em>"

let MenuStyle = < Wide | Narrow >

let navigation/logoImage = ''
<div id="navigation-logo-image" class="w3-bar-item" style="padding-right: 0;">
  <a href="/index.html"><img src="/images/Logos/brbytes.png" height="50vh"></a>
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

let footer/logos =
\(imgs : List Text) ->
let logo = \(img : Text) -> ''
<img class="w3-margin-left w3-margin-right"
     src="/images/Logos/${img}.png" height="40vh">''
in
concatMapSep "\n" Text logo imgs

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
<div id="navigation-header" class="w3-row w3-text-indigo">''
, Narrow = ''
<div id="navigation-menu" class="dropdown-content w3-hide w3-text-indigo w3-center w3-padding w3-large plain-links">''
} menu
++
concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items
++
"</div>"

let navigation/wide = 
\(items : List (MenuStyle -> Text)) ->
''
<div class="w3-bar-block w3-rest w3-right plain-links">
  ${navigation/contact}
  ${navigation items MenuStyle.Wide}
</div>
''

let navigation/narrow = 
\(items : List (MenuStyle -> Text)) -> ''
<div>
  <div id="navigation-hamburger"
       class="dropdown-button w3-bar-item w3-right" 
       style="padding-top: 0;">
    <a href="#" class="dropdown-button w3-xlarge w3-bar-item w3-button"
       x-data="{ open: false }"
       onclick="toggleDropdown('navigation-menu'); return false;">${b "&#9776"}</a>
  </div>
  ${navigation items MenuStyle.Narrow}
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
\(lbl : Text) ->
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
<a class="dropdown-button" href="#" 
   x-data="{ open: false }"
   x-on:click="open = !open">${b desc}</a><br>
<div class="dropdown-content"
     x-bind:class="{ 'w3-hide': !open }">
  ${concatMapSep "\n" (MenuStyle -> Text) (makeMenu menu) items}
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

let menuItems =
  [ item "TEACHERS" "teachers.html"
  , random "STUDENTS" "students"
  , dropdown "PARENTS" "parents" ""
        [ subitem "Pathways" "pathways.html"
        , subitem "Course Descriptions" "course-descriptions.html"
        , subitem "Careers in Computing"
                  "https://cloud.brbytes.org/s/DEA47SQAbw7Rwws"
        ]
  , item "SCHOOLS" "https://cloud.brbytes.org/s/zamoYXtqBNs3GCs"
  , dropdown "NEWS" "news" ""
        [ subitem "Newsletters" "newsletters.html"
        , subitem "Announcements" "announcements.html"
        ]
  , dropdown "ABOUT" "about" "padding-left:16px;"
        [ subitem "Overview" "overview.html"
        , subitem "Our Goals" "goals"
        , subitem "Participating Schools"
                  "https://cloud.brbytes.org/s/5ZkGY4PkZTNXWqE"
        , subitem "Contact" "contact.html" 
        ]
  ]

in
''
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="BRBytes Main Page">
    <title>BRBytes &ndash; LSU Computing Pathway &ndash; Fall 2020</title>
    <link rel="stylesheet" href="/assets/css/w3.css">
    <link rel="stylesheet" href="/assets/css/w3-theme-indigo.css">
    <link rel="stylesheet" href="/assets/css/landing-styles.css">
    <!-- <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script> -->
    <script src="/assets/js/alpine.js" defer></script>
  </head>
  <body>
    <div class="sticky accent-color w3-bottombar w3-border-yellow w3-small" style="padding: 8px 16px 0;">
      <div class="accent-color w3-bar w3-row">
        <div class="w3-col" style="width: fit-content; width: -moz-fit-content;">
          ${navigation/logoImage}
          ${navigation/logoHeading}
        </div>
        ${navigation/narrow menuItems}
        ${navigation/wide menuItems}
      </div>
    </div>

    <div id="main-div" style="padding: $padding$; text-align: $alignment$; overflow: auto;">
      <!--this div contains the body of the page-->
$body$       
      <!--end of body-->
    </div>

    <div class="sticky footer accent-color w3-center w3-topbar w3-border-yellow w3-padding-large w3-hide-small">
    ${footer/logos ["usdoe","lsu","ebrpss","nsf"]}
    </div>

    <!-- <script src="assets/js/brbytes.js"></script> -->
  </body>
</html>
''
