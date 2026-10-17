library(DiagrammeR)

# Palestinian Perception Survey - flow and skip logic ----

grViz("
digraph {

  graph[layout=dot, rankdir=TB, fontname='Helvetica',
        label='Palestinian Perception Survey - 2024
        ',
        labelloc='t', labeljust='c', fontsize=18]

  node[shape=box, style='filled', fontsize=13, fontname='Helvetica']
  edge[fontsize=11, fontname='Helvetica', color='DimGray', penwidth=1.5]

  # Awareness of USAID
  node[shape=rectangle, color='lightblue']
  Q1[label='In the past year, have you\nseen this logo? [USAID]']
   
  Q2[label='How familiar are\nyou with USAID?']
  
  Q4[label='Impression\nof USAID?']
  
  Info[label='Thanks for responding whether or not you are\nfamiliar with USAID. USAID promotes the social\ndevelopment of the Palestinian people through\ninvestments in water, infrastructure, education, and\nother development activities in the West Bank and Gaza']
  
  Treatment[label='In 2021, USAID provided over $110 million\nto support development and humanitarian programs\nin the West Bank and Gaza\non behalf of the American people.\nThis is part of a decades-long\ncommitment to support the aspirations of the Palestinian people.']
  
  Q8[label='Based on this information, and from\nyour own experience, do you think\nthat overall USAID is doing a bad\njob or a good job in the West Bank and Gaza?']
  
  
  # --- Edges ---

  Q1 -> Q2 
  Q2 -> Q4 [label='No']
  Q4 -> Info
  Info -> Treatment
  Treatment -> Q8
  
}
")
