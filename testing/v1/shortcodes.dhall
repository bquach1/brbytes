let concatSep = https://prelude.dhall-lang.org/v9.0.0/Text/concatSep
let concatMapSep = https://prelude.dhall-lang.org/v9.0.0/Text/concatMapSep
let concatMap = https://prelude.dhall-lang.org/v9.0.0/Text/concatMap

let SCS = {color = "green", name = "SCS"}

let ICT = {color = "indigo", name = "ICT"}

let CEW = {color = "purple", name = "CEW"}

let CYB = {color = "pink", name = "CYB"}

let DMA = {color = "teal", name = "DMA"}

let NON = [] : List {color : Text, name : Text}

let badges =
    \(badgeList : List {color : Text, name : Text})->
''
${concatMap {color : Text, name : Text} (λ(n : {color : Text, name : Text}) -> "<a class=\"w3-${n.color} w3-small w3-padding-small\" href=\"#\">${n.name}</a>\n") badgeList}
''

let author =
    \(name : Text)->
''
<a class="w3-text-grey w3-opacity w3-small" href="#">By ${name}</a>
''

let post = 
    \(title : Text) ->
    \(name : Text) ->
    \(badgeList : List {color : Text, name : Text}) ->
    \(content : Text) ->
''
<section class="post">
    <h2>${title}</h2>
    <header class="post-header">
	${author name}<br>${badges badgeList}
    </header>
    <div class="post-description">
        ${content}
</section>
''

let image =
    \(filename : Text) ->
let num = "300"
in
''
<img src="${filename}"
     style="border: #000000 4px solid; width:100%; max-width:300px;" />
''

let youtubeVideo =
    \(link : Text) ->
''
<iframe width="420" height="315"
src="https://www.youtube.com/embed/${link}">
</iframe>
''

let pdf =
    \(filename : Text) ->
    \(vh : Natural) ->
''
<object
  data="${filename}"
  type="application/pdf"
  height="${Natural/show vh}vh"
  width="60%">
  <iframe
    src="${filename}"
    width="60%"
    height="${Natural/show vh}vh"
    style="border: none;">
    <p>Your browser does not support PDFs.
      <a href = "${filename}">Download the PDF</a>.</p>
  </iframe>
</object>
''

let video = 
    \(filename : Text) ->
''
<video width="320" height="240" controls>
  <source src="${filename}" type="video/mp4">
  <source src="${filename}" type="video/ogg">
Your browser does not support the video tag.
/video>
''

let olderPostHeader =
''
<h1 class="w3-small w3-border-bottom w3-opacity">Older Posts</h1>
''

in

