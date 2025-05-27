//  01. Ajustes de página
#set page(
  paper: "a4",
  margin: (x: 0cm, y: 0cm),
  flipped: true,
   header: rect(fill: aqua.lighten(100%)),
  footer: rect(fill: aqua.lighten(100%)),
  number-align: center,
)
#set par(
  justify: true,
  leading: 0.41em,
)

#set text(
  font: "Inter"
)
#set rect(
  width: 100%,
  height: 100%,
  fill: aqua.lighten(70%),
  inset: 4pt,
)

//02. Componentes
//Ficha: Seccion 1
#let datos(act) = grid(
  columns: (240pt, 240pt),
  rows: (40pt, 40pt),
  column-gutter: 10pt,
  row-gutter: 10pt,

  rect[*Projectista* #v(-5pt)  #act.projectista ],
  rect[*Districte* #v(-5pt)  #act.districte ],
  rect[*Contractista* #v(-5pt) #act.contractista],
    rect[*Àrea* #v(-5pt) #act.area],
    rect[*Pressupost* #v(-5pt) #act.pressupost],
    rect[*Tipologia* #v(-5pt) #act.tipologia],
    rect[*Import* #v(-5pt) #act.import],
    rect[*Subtipologia* #v(-5pt) #act.subtipologia],
    rect[*Superfície* #v(-5pt) #act.superficie], 
)

//Ficha: Seccion 2
#let otros(act)= rect(fill: aqua.lighten(90%), height: 60pt, width: 510pt)[*Descripció*#v(-5pt) #lorem(24) ]

//03. Datos
#let registros = json("datos.json")

// PORTADA
//Background
 #place(
  top + left,
  dy:0pt,
  dx: 0pt,
  image("portada.jpg", width: 900pt)
)
//Lineas y logo (imagen corporativa)
#line(start: (0pt, 40%),length: 100%, stroke: 2pt +rgb(255, 255, 255))
#line(start: (66%, -44%),length: 42%, stroke: 2pt +rgb(255, 255, 255),angle: 90deg)
#place(top + left,dy:92%,dx: 30pt,image("logo_bimsa.png", width: 360pt))
//título
#place(top + left,dy:30pt,dx: 30pt,text(size:36pt,weight: "bold",fill:rgb(255, 255, 255), stroke: rgb(0, 0, 0, 10))[Pla Endreça])
#place(top + left,dy:58pt,dx: 30pt,text(size:36pt,weight: "bold",fill:rgb(255, 255, 255),stroke: rgb(0, 0, 0, 10))[Barcelona])
//subtitulo
#place(top + left,dy:47%,dx: 30pt,text(size:24pt,weight: "bold",fill:rgb(255, 255, 255))[Seguiment PMI+PRI])
#place(top + left,dy:52%,dx: 30pt,text(size:24pt,weight: "bold",fill:rgb(255, 255, 255))[Juny 2025])

#pagebreak()
//INDEX 

#line(start: (0pt, 20%),length: 100%, stroke: 2pt +rgb(0, 0, 0))
#line(start: (60%, -24%),length: 22%, stroke: 2pt +rgb(0, 0, 0),angle: 90deg)
#place(top + left,dy:8%,dx: 40pt,text(size:36pt,weight: "regular",fill:rgb(0, 0, 0))[Índex])


#pagebreak()

#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.5cm),
  flipped: true,
   header: rect(fill: aqua.lighten(100%)),
  footer: rect(fill: aqua.lighten(100%)),
  number-align: center,
)

#for registro in registros.projectes {
 image(width: 32%,"logo_BIMSA.jpeg")
  rect(fill: aqua.lighten(90%), height: 30pt, width: 490pt)[#registro.descripcio]
  rect(fill: aqua.lighten(90%), height: 16pt, width: 490pt)[*Dades generals*]
  
  datos(registro)
  otros(registro)
  place(
  top + right,
  dy:40pt,
  dx: 0pt,
  image("ali.jpg", width: 200pt)
)
place(
  top + right,
  dy:200pt,
  dx: 0pt,
  image("ali.jpg", width: 200pt)
)
place(
  top + right,
  dy:360pt,
  dx: 0pt,
  image("ali.jpg", width: 200pt)
)
  pagebreak()
}
#include "tabla_ref.typ"