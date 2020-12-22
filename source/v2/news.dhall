let SCS = {color = "green", name = "SCS"}

let ICT = {color = "indigo", name = "ICT"}

let CEW = {color = "purple", name = "CEW"}

let CYB = {color = "pink", name = "CYB"}

let DMA = {color = "teal", name = "DMA"}

let NUL = [] : List {color : Text, name : Text}

let badges =
    \(badgeList : List {color : Text, name : Text})->
''
${concatMap {color : Text, name : Text} (λ(n : {color : Text, name : Text}) -> "<a class=\"w3-${n.color} w3-small w3-padding-small\" href=\"#\">${n.name}</a>\n") badgeList}
''

in

''
---
title: "News"
---

${badges [ICT]}

${badges [SCS, ICT, CEW, CYB, DMA]}

${badges NUL}
''
