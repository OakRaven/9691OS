wrapText = (text, maxLineWidth = 80, lineEnding = '\n') ->
  regex = RegExp \
    ".{1,#{maxLineWidth}}(\\s|$)|\\S+?(\\s|$)", 'g'
  text.match(regex).join lineEnding

homersOdyssey = "He counted his goodly coppers and cauldrons, his
  gold and all his clothes, but there was nothing missing; still
  he kept grieving about not being in his own country, and
  wandered up and down by the shore of the sounding sea bewailing
  his hard fate. Then Minerva came up to him disguised as a young
  shepherd of delicate and princely mien, with a good cloak folded
  double about her shoulders; she had sandals on her comely feet
  and held a javelin in her hand. Ulysses was glad when he saw
  her, and went straight up to her."

console.log wrapText homersOdyssey, 40, '<br />\n'
