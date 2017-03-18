alias charmapcheck {
  var %char = -1
  while %char < 3000 {
    inc %char
  //echo -s %char $+ $chr(32) $+ $chr(%char)  }
}

alias clonescanner {
  var %allclones = x
  var %clonenicks = $null
  var %totalclonenicks = 0
  var %y = 0
  var %z
  while (%y <= $nick($chan,0)) {
    inc %y
    %z = %y
    while (%z <= $nick($chan,0)) {
      inc %z
      if (($address($nick($chan,%y),2) == $address($nick($chan, %z),2)) && ($istok(%allclones,%z,46) == $false)) {
        if (%totalclonenicks = 0) {
          %clonenicks = $nick($chan,%y) $+ $chr(44) $+ $chr(32) $+ $nick($chan,%z)
          if (%allclones == x) {
            %allclones = %y $+ $chr(46) $+ %z)
          }
          else {
            %allclones = %allclones $+ $chr(46) $+ %z
          }
        }
        else {
          %clonenicks = %clonenicks $+ $chr(44) $+ $chr(32) $+ $nick($chan,%z)
          %allclones = %allclones $+ $chr(46) $+ %z
        }
        inc %totalclonenicks
      }
    }
    if (%clonenicks != $null) {
      //echo -a 11,6 $+ $address($nick($chan,%y),2) -- %clonenicks
    }
    %clonenicks = $null
    %totalclonenicks = 0
  }
}

alias kb5 {
  ban -u300 $chan $$1 2
  k $$1 $2- $+ $chr(32) $+ (5 min. ban)
}
alias kb {
  ban $chan $$1 2
  k $$1 $2-
}
alias latinize {
  var %output
  var %position = 1
  while (%position <= $len($1-)) {
    var %asc = $asc($mid($1-,%position,1))
    if (%asc == 32) {
      %flag = on
    }
    else {
      unset %flag
    }
    if (%flag == on) {
      if (%asc == 170) || (%asc >= 224 && %asc <= 229) {
        %output = %output $+ $chr(32) $+ a
      }
      elseif (%asc >= 192 && %asc <= 197) {
        %output = %output $+ $chr(32) $+ A
      }
      elseif (%asc == 230) {
        %output = %output $+ $chr(32) $+ ae
      }
      elseif (%asc == 198) {
        %output = %output $+ $chr(32) $+ AE
      }
      elseif (%asc == 223) {
        %output = %output $+ $chr(32) $+ B
      }
      elseif (%asc == 162) || (%asc == 169) || (%asc == 231) {
        %output = %output $+ $chr(32) $+ c
      }
      elseif (%asc == 199) {
        %output = %output $+ $chr(32) $+ C
      }
      elseif (%asc == 240) {
        %output = %output $+ $chr(32) $+ d
      }
      elseif (%asc == 208) {
        %output = %output $+ $chr(32) $+ D
      }
      elseif (%asc >= 232) && (%asc <= 235) {
        %output = %output $+ $chr(32) $+ e
      }
      elseif (%asc >= 200) && (%asc <= 203) {
        %output = %output $+ $chr(32) $+ E
      }
      elseif (%asc >= 236) && (%asc <= 239) {
        %output = %output $+ $chr(32) $+ i
      }
      elseif (%asc >= 204) && (%asc <= 207) {
        %output = %output $+ $chr(32) $+ I
      }
      elseif (%asc == 163) {
        %output = %output $+ $chr(32) $+ L
      }
      elseif (%asc == 241) {
        %output = %output $+ $chr(32) $+ n
      }
      elseif (%asc == 209) {
        %output = %output $+ $chr(32) $+ N
      }
      elseif (%asc == 176) || (%asc == 186) || (%asc = 248) || ((%asc >= 242) && (%asc <= 246)) {
        %output = %output $+ $chr(32) $+ o
      }
      elseif (%asc == 216) || ((%asc >= 210) && (%asc <= 214)) {
        %output = %output $+ $chr(32) $+ O
      }
      elseif (%asc == 222) || (%asc == 254) {
        %output = %output $+ $chr(32) $+ p
      }
      elseif (%asc == 182) {
        %output = %output $+ $chr(32) $+ P
      }
      elseif (%asc == 174) {
        %output = %output $+ $chr(32) $+ R
      }
      elseif (%asc == 167) || (%asc == 36) {
        %output = %output $+ $chr(32) $+ S
      }
      elseif (%asc == 181) || ((%asc >= 249) && (%asc <= 252)) {
        %output = %output $+ $chr(32) $+ u
      }
      elseif ((%asc >= 217) && (%asc <= 220)) {
        %output = %output $+ $chr(32) $+ U
      }
      elseif (%asc == 164) || (%asc == 215) {
        %output = %output $+ $chr(32) $+ x
      }
      elseif (%asc == 253) || (%asc == 255) {
        %output = %output $+ $chr(32) $+ y
      }
      elseif (%asc == 165) || (%asc == 221) {
        %output = %output $+ $chr(32) $+ Y
      }
      else {
        %output = %output $+ $chr(32) $+ $chr(%asc)
      }

    }
    else {
      if (%asc == 170) || (%asc >= 224 && %asc <= 229) {
        %output = %output $+ a
      }
      elseif (%asc >= 192 && %asc <= 197) {
        %output = %output $+ A
      }
      elseif (%asc == 230) {
        %output = %output $+ ae
      }
      elseif (%asc == 198) {
        %output = %output $+ AE
      }
      elseif (%asc == 223) {
        %output = %output $+ B
      }
      elseif (%asc == 162) || (%asc == 169) || (%asc == 231) {
        %output = %output $+ c
      }
      elseif (%asc == 199) {
        %output = %output $+ C
      }
      elseif (%asc == 240) {
        %output = %output $+ d
      }
      elseif (%asc == 208) {
        %output = %output $+ D
      }
      elseif (%asc >= 232) && (%asc <= 235) {
        %output = %output $+ e
      }
      elseif (%asc >= 200) && (%asc <= 203) {
        %output = %output $+ E
      }
      elseif (%asc >= 236) && (%asc <= 239) {
        %output = %output $+ i
      }
      elseif (%asc >= 204) && (%asc <= 207) {
        %output = %output $+ I
      }
      elseif (%asc == 163) {
        %output = %output $+ L
      }
      elseif (%asc == 241) {
        %output = %output $+ n
      }
      elseif (%asc == 209) {
        %output = %output $+ N
      }
      elseif (%asc == 176) || (%asc == 186) || (%asc = 248) || ((%asc >= 242) && (%asc <= 246)) {
        %output = %output $+ o
      }
      elseif (%asc == 216) || ((%asc >= 210) && (%asc <= 214)) {
        %output = %output $+ O
      }
      elseif (%asc == 222) || (%asc == 254) {
        %output = %output $+ p
      }
      elseif (%asc == 182) {
        %output = %output $+ P
      }
      elseif (%asc == 174) {
        %output = %output $+ R
      }
      elseif (%asc == 167) || (%asc == 36) {
        %output = %output $+ S
      }
      elseif (%asc == 181) || ((%asc >= 249) && (%asc <= 252)) {
        %output = %output $+ u
      }
      elseif ((%asc >= 217) && (%asc <= 220)) {
        %output = %output $+ U
      }
      elseif (%asc == 164) || (%asc == 215) {
        %output = %output $+ x
      }
      elseif (%asc == 253) || (%asc == 255) {
        %output = %output $+ y
      }
      elseif (%asc == 165) || (%asc == 221) {
        %output = %output $+ Y
      }
      else {
        %output = %output $+ $chr(%asc)
      }
    }
    if ($asc == 32) {
      %flag = on
    }
    else {
      unset %flag
    }
    inc %position
  }
  return %output
}

alias nobold {
  return $replace($1-,$chr(2),)
}

alias noitalics {
  return $replace($1-,$chr(29),)
}

alias nonumbers {
  var %input = $replace($1-,',)
  var %final
  var %position = 1
  var %flag = off
  while (%position <= $len(%input)) {
    if (($asc($mid(%input,%position,1)) < 48) || ($asc($mid(%input,%position,1)) > 57)) { 
      if (%flag == on) {
        %final = %final $+ $chr(32) $+ $mid(%input,%position,1))
        %flag = off
      }
      else {
        %final = %final $+ $mid(%input,%position,1)
      }
    }
    if ($asc($mid(%input,%position,1)) == 32) {
      %flag = on
      //echo -a space
    }
    inc %position
  }
  return %final
}

alias nopunct {
  var %input = $1-
  var %final
  var %position = 1
  var %flag = off
  while (%position <= $len(%input)) {
    if (($asc($mid(%input,%position,1)) >= 65) && ($asc($mid(%input,%position,1)) <= 90)) || (($asc($mid(%input,%position,1)) >= 97) && ($asc($mid(%input,%position,1)) <= 122)) || (($asc($mid(%input,%position,1)) >= 48) && ($asc($mid(%input,%position,1)) <= 57)) { 
      if (%flag == on) {
        %final = %final $+ $chr(32) $+ $mid(%input,%position,1))
        %flag = off
      }
      else {
        %final = %final $+ $mid(%input,%position,1))
      }
    }
    else if ($asc($mid(%input,%position,1)) == 32) {
      %flag = on
    }
    inc %position
  }
  return %final
}

alias noreverse {
  return $replace($1-,$chr(22),)
}

alias nounderline {
  return $replace($1-,$chr(31),)
}

alias spacepunct {
  var %input = $replace($1-,',)
  var %final
  var %position = 1
  var %flag = off
  while (%position <= $len(%input)) {
    if (($asc($mid(%input,%position,1)) >= 65) && ($asc($mid(%input,%position,1)) <= 90)) || (($asc($mid(%input,%position,1)) >= 97) && ($asc($mid(%input,%position,1)) <= 122)) || (($asc($mid(%input,%position,1)) >= 48) && ($asc($mid(%input,%position,1)) <= 57)) { 
      if (%flag == on) {
        %final = %final $+ $chr(32) $+ $mid(%input,%position,1))
        %flag = off
      }
      else {
        %final = %final $+ $mid(%input,%position,1)
      }
    }
    else if ($asc($mid(%input,%position,1)) == 32) {
      %flag = on
    }
    else {
      %flag = on
    }
    inc %position
  }
  return %final
}

alias wifi_acronyms {
  return $replace($1-,looking for,lf,pm me,pmme)
}
