alias archeck {
  var %text = $strip($latinize($1-))
  var %textb = $nopunct($1-)
  var %numtok = 1
  var %isar = $false
  while (%numtok <= $numtok(%text,32)) {
    if (%numtok == $numtok(%text,32)) {
      if ($gettok(%text,%numtok,32) == ar) || ($gettok(%text,%numtok,32) == ar?) {
        %isar = $true
      }
    }
    else {
      if ($gettok(%text,%numtok,32) == ar) && ($mid($gettok(%text,$calc(%numtok + 1),32),1,1) != e) {
        %isar = $true
      }
      if ($gettok(%text,%numtok,32) == a) && ($gettok(%text,$calc(%numtok + 1),32) == r) {
        %isar = $true
      }
    }
    inc %numtok
  }
  set %numtok 1
  while (%numtok <= $numtok(%textb,32)) {
    if (%numtok == $numtok(%textb,32)) {
      if ($gettok(%textb,%numtok,32) == ar) {
        %isar = $true
      }
    }
    else {
      if ($gettok(%textb,%numtok,32) == ar) && ($mid($gettok(%textb,$calc(%numtok + 1),32),1,1) != e) {
        %isar = $true
      }
      if ($gettok(%textb,%numtok,32) == a) && ($gettok(%textb,$calc(%numtok + 1),32) == r) {
        %isar = $true
      }
    }
    inc %numtok
  }
  return %isar
}

alias capscheck {
  var %input = $nospace($nopunct($1-))
  var %position = 1
  var %capscount
  while (%position <= $len(%input)) {
    if (($asc($mid(%input,%position,1)) >= 65) && ($asc($mid(%input,%position,1)) <= 90))  { 
      inc %capscount
    }
    inc %position
  }
  return $calc(100 * %capscount / $len(%input))
}

alias formatcount {
  var %input
  var %code
  if ($1 == bold) {
    %input = $noitalics($nounderline($noreverse($nospace($2-))))
    %code = 2
  }
  elseif ($1 == underline) {
    %input = $noitalics($nobold($noreverse($nospace($2-))))
    %code = 31
  }
  elseif ($1 == reverse) {
    %input = $noitalics($nobold($nounderline($nospace($2-))))
    %code = 22
  }
  elseif ($1 == italics) {
    %input = $nounderline($nobold($noreverse($nospace($2-))))
    %code = 29
  }
  var %position = 1
  var %iscode = false
  var %codechars = 0
  while (%position <= $len(%input)) {
    if $mid(%input,%position,1) == $chr(%code) {
      if (%iscode == true) {
        %iscode = false
      }
      else {
        %iscode = true
      }
    }
    elseif $mid(%input,%position,1) == $chr(15) {
      %iscode = false
    }
    else {
      if (%iscode == true) {
        inc %codechars
      }
    }
    inc %position
  }
  return $calc(100 * %codechars / $len($strip(%input)))
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

alias noreverse {
  return $replace($1-,$chr(22),)
}

alias nounderline {
  return $replace($1-,$chr(31),)
}

alias noitalics {
  return $replace($1-,$chr(29),)
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

alias nospace {
  return $replace($1-,$chr(32),)
}

alias simtok {
  return $calc(100.00 * $anytok($1,$2,32).num / $max($numtok($1,32),$numtok($2,32)))
}

alias anytok {
  if ($isid) {
    var %x 0
    while (%x < $numtok($1,$3)) {
      inc %x
      $iif($istok($2,$gettok($1,%x,$3),$3),set %z %z $gettok($1,%x,$3),)
    }
    var %t %z | unset %z
    $iif($prop == num,return $numtok(%t,$3),)
    if ($prop == true) {
      $iif(%t,return $true,return $false)
    }
    $iif($prop == all,return %t,)
  }
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

alias ident {
  return $gettok($gettok($address($$1,5),2,33),1,64)
}

alias checkwebads {
  var %text = $strip($1-)
  var %numtok = 1
  var %isad = $false
  while (%numtok <= $numtok(%text,32)) {
    if ((http:// isin $gettok(%text,%numtok,32)) || (.com isin $gettok(%text,%numtok,32)) || (.net isin $gettok(%text,%numtok,32)) || (.org isin $gettok(%text,%numtok,32))) && (serebii.net !isin $gettok(%text,%numtok,32)) && (serebiiforums.net !isin $gettok(%text,%numtok,32)) && (synirc !isin $gettok(%text,%numtok,32)) && (pastebin !isin $gettok(%text,%numtok,32)) {
      %isad = $true
    }
    inc %numtok
  }
  return %isad
}

alias checkchanads {
  var %text = $strip($1-)
  var %numtok = 1
  var %isad = $false
  while (%numtok <= $numtok(%text,32)) {
    if ($chr(35) isin $gettok(%text,%numtok,32)) && ($gettok(%text,%numtok,32) != #SPP) && ($gettok(%text,%numtok,32) != #SPP-wifi) && ($gettok(%text,%numtok,32) != #help) && ($gettok(%text,%numtok,32) != $chr(35)) && ($nopunct($gettok(%text,%numtok,32),$chr(35)) !isnum) {
      %isad = $true
    }
    inc %numtok
  }
  return %isad
}

alias max {
  if ($$1 > $$2) {
    return $$1
  }
  else {
    return $$2
  }
}
