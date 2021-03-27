
-- let nl =  ./news/NewsLetter-Mar21.html as Text

let title = "NewsLetter March 2021"
let body = concatSep "\n"

[ ''
  <embed type="text/html" 
         src="docs/nl/NewsLetter-Mar21.html"
         style="display: block; width: 98vw; height: 98vh;">
  ''

, ''
</div>
''

]

in
