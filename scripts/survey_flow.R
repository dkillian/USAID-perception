library(DiagrammeR)

# Palestinian Perception Survey - flow and skip logic ----

grViz("
digraph {

  graph[layout=dot, rankdir=TB, fontname='Helvetica']

  node[shape=box, style='filled', fontsize=13, fontname='Helvetica']
  edge[fontsize=11, fontname='Helvetica', color='DimGray', penwidth=1.5]

  # Start / end
  node[shape=oval, color='lightgray']
  START[label='Start Interview']
  CLOSE[label='Close / Thank You']

  # Consent
  node[shape=box, color='lightyellow']
  CONSENT[label='Introduction & Consent\n(Gaza: remote | West Bank: household)']

  # Section: Perception of USAID
  node[shape=box, color='lightblue1']
  Q1[label='Q1. Seen/heard donor logos?']
  Q2[label='Q2. Perception of recognized donors\n(1–5 scale, for each)']
  Q3[label='Q3. Familiarity with USAID']
  Q4[label='Q4. Types of USAID activities\nfamiliar with (multi-select)']
  Q5[label='Q5. Current perception of USAID\n(1–5 scale)']
  Q6[label='Q6. Perception of USAID\nbefore Oct 7, 2023 (1–5 scale)']
  Q7neg[label='Q7. Why negative perception?\n(multi-select)']
  Q8pos[label='Q8. Why positive impression?\n(multi-select)']

  # Section: Perception of USG
  node[shape=box, color='thistle1']
  USG1[label='Q_. Perception of U.S. Government\n(1–5 scale)']
  USG2[label='Q_. Perception of U.S. people\n(1–5 scale)']
  USG3[label='Q_. Perception of U.S. policy\n(1–5 scale)']
  USG4[label='Q_. Perception of U.S. support\nfor Palestinians (1–5 scale)']

  # Information treatment
  node[shape=box, color='lightyellow']
  INFO[label='Information Treatment\n(randomized)']

  # Section: Exposure to USAID
  node[shape=box, color='lightblue1']
  Q9[label='Q9. Benefited from USAID activity?']
  Q10[label='Q10. Types of activities\n(if Q9=1, multi-select)']
  Q11[label='Q11. Know someone who\nbenefited from USAID?']
  Q12[label='Q12. Type of activity\n(if Q11=1, multi-select)']

  # Section: Exposure to other actors
  node[shape=box, color='moccasin']
  Q21[label='Q21. Benefited from any\ndevelopment activity?']
  Q22[label='Q22. Which donors funded it?\n(if Q21=1, multi-select)']

  # Section: Media use
  node[shape=box, color='honeydew']
  Q28[label='Q28. Listen to radio?']
  Q29[label='Q29. Which stations?\n(if radio)']
  Q30[label='Q30. Frequency?\n(if radio)']
  Q31[label='Q31. Watch television?']
  Q32tv[label='Q32. Which channels?\n(if TV)']
  Q32sm[label='Q32. Use social media?']
  Q33[label='Q33. Which platforms?\n(if social media)']

  # Section: Development priorities
  node[shape=box, color='lightcyan']
  Q38[label='Q38. West Bank: right or\nwrong direction?']
  Q39[label='Q39. Gaza: right or\nwrong direction?']

  # Section: Household characteristics
  node[shape=box, color='lavender']
  Q40[label='Q40-Q41. HH size & income']
  Q42[label='Q42. Employment status']
  Q43[label='Q43. Type of employment\n(if Q42=1-3)']

  # Section: Demographics
  node[shape=box, color='lavenderblush']
  Q44[label='Q44. Age']
  Q45[label='Q45. Gender']
  Q46[label='Q46. Location / region']
  Q47[label='Q47. Religion']
  Q48[label='Q48. Education level']

  # --- Edges ---

  START -> CONSENT
  CONSENT -> Q1

  Q1 -> Q2 [label='Yes']
  Q1 -> Q3 [label='No']
  Q2 -> Q3

  Q3 -> Q4 [label='Familiar\n(1 or 2)']
  Q3 -> USG1 [label='Not familiar\nor unsure']

  Q4 -> Q5 -> Q6
  Q6 -> Q7neg [label='Negative\n(Q5 or Q6 = 1-2)']
  Q6 -> Q8pos [label='Positive\n(Q5 or Q6 = 4-5)']
  Q7neg -> USG1
  Q8pos -> USG1

  USG1 -> USG2 -> USG3 -> USG4 -> INFO

  INFO -> Q9
  Q9 -> Q10 [label='Yes']
  Q9 -> Q11
  Q10 -> Q11
  Q11 -> Q12 [label='Yes']
  Q11 -> Q21
  Q12 -> Q21

  Q21 -> Q22 [label='Yes']
  Q21 -> Q28
  Q22 -> Q28

  Q28 -> Q29 [label='Yes']
  Q29 -> Q30
  Q28 -> Q31
  Q30 -> Q31
  Q31 -> Q32tv [label='Yes']
  Q31 -> Q32sm
  Q32tv -> Q32sm
  Q32sm -> Q33 [label='Uses\nsocial media']
  Q33 -> Q38
  Q32sm -> Q38

  Q38 -> Q39
  Q39 -> Q40
  Q40 -> Q42
  Q42 -> Q43 [label='Employed\n(1-3)']
  Q42 -> Q44
  Q43 -> Q44

  Q44 -> Q45 -> Q46 -> Q47 -> Q48 -> CLOSE

}
")
