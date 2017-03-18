on *:text:$($str($chr(32),10) *):#spp-wifi: {
  kb5 $nick No Space Spamming
}

on *:text:*:#spp-wifi: {
  if ( $nick !ishop # ) && ( $nick !isop # ) {
    if ($regex($strip($1-), /(.)\1{14}\1*/) > 0) {
      kb5 $nick No character spamming
    }

    if ($len($nopunct($nospace($1-))) > 10) {
      if $capscheck($1-) >= 85 {
        kb5 $nick Too many caps
      }
    }

    if (%rp_duration == $null) {
      /set %rp_duration 60
    }
    if (%rp_offences == $null) {
      /set %rp_offences 3
    }
    var %base_input = $spacepunct($wifi_acronyms($nobold($nounderline($noreverse($noitalics($latinize($1-)))))))
    var %rp.repeats = rp. $+ $nick $+ . $+ $chan
    var %rp.text = rp. $+ $nick $+ . $+ $chan $+ .text
    if ( % [ $+ [ %rp.repeats ] ] == $null ) {
      set -eu [ $+ [ %rp_duration ] ] % [ $+ [ %rp.repeats ] ] 1
      set -eu [ $+ [ %rp_duration ] ] % [ $+ [ %rp.text ] ] %base_input
    }
    elseif ( % [ $+ [ %rp.text ] ] == %base_input ) {
      set -k % [ $+ [ %rp.repeats ] ] $calc( % [ $+ [ %rp.repeats ] ] + 1)
    }
    elseif ( % [ $+ [ %rp.text ] ] != %base_input ) && ($simtok( % [ $+ [ %rp.text ] ] , %base_input ) >= 66) {
      set -k % [ $+ [ %rp.text ] ] %base_input
      set -k % [ $+ [ %rp.repeats ] ] $calc( % [ $+ [ %rp.repeats ] ] + 1)
    }
    else {
      unset % [ $+ [ %rp.text ] ]
      unset % [ $+ [ %rp.repeats ] ]
      set -eu [ $+ [ %rp_duration ] ] % [ $+ [ %rp.repeats ] ] 1
      set -eu [ $+ [ %rp_duration ] ] % [ $+ [ %rp.text ] ] %base_input 
    }
    if ( % [ $+ [ %rp.repeats ] ] >= %rp_offences ) {
      kb5 $nick Repeating too often
      unset % [ $+ [ %rp.repeats ] ]
      unset % [ $+ [ %rp.text ] ]
    }

    if ($len($strip($1-)) >= 10) {
      var % [ $+ [ $nick ] $+ .codes ]
      if ($chr(2) isin $1-) {
        set -eu30 % [ $+ [ $nick ] $+ .bold ] $formatcount(bold, $+ $chr(32) $+ $1-) 
        if % [ $+ [ $nick ] $+ .bold ] > 85 {
          set -eu30 % [ $+ [ $nick ] $+ .codes ] % [ $+ [ $nick ] $+ .codes ] $+ $chr(32) $+ $int(% [ $+ [ $nick ] $+ .bold ]) $+ $chr(32) $+ bold
        }
      }
      if ($chr(31) isin $1-) {
        set -eu30 % [ $+ [ $nick ] $+ .ul ] $formatcount(underline, $+ $chr(32) $+ $1-)
        if % [ $+ [ $nick ] $+ .ul ] > 85 {
          set -eu30 % [ $+ [ $nick ] $+ .codes ] % [ $+ [ $nick ] $+ .codes ] $+ $chr(32) $+ $int(% [ $+ [ $nick ] $+ .ul ]) $+ $chr(32) $+ underline
        }
      }
      if ($chr(22) isin $1-) {
        set -eu30 % [ $+ [ $nick ] $+ .rev ] $formatcount(reverse, $+ $chr(32) $+ $1-)
        if % [ $+ [ $nick ] $+ .rev ] > 85 {
          set -eu30 % [ $+ [ $nick ] $+ .codes ] % [ $+ [ $nick ] $+ .codes ] $+ $chr(32) $+ $int(% [ $+ [ $nick ] $+ .rev ]) $+ $chr(32) $+ reverse
        }
      }
      if ($chr(29) isin $1-) {
        set -eu30 % [ $+ [ $nick ] $+ .ita ] $formatcount(italics, $+ $chr(32) $+ $1-)
        if % [ $+ [ $nick ] $+ .ita ] > 85 {
          set -eu30 % [ $+ [ $nick ] $+ .codes ] % [ $+ [ $nick ] $+ .codes ] $+ $chr(32) $+ $int(% [ $+ [ $nick ] $+ .ita ]) $+ $chr(32) $+ italics
        }
      }
      if ($numtok(% [ $+ [ $nick ] $+ .codes ],32) == 2) {
        /kb5 $nick Your text contained $gettok(% [ $+ [ $nick ] $+ .codes ],1,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],2,32) $+ . Please use text formatting sparingly.
      }
      elseif ($numtok(% [ $+ [ $nick ] $+ .codes ],32) == 4) {
        /kb5 $nick Your text contained $gettok(% [ $+ [ $nick ] $+ .codes ],1,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],2,32) and $gettok(% [ $+ [ $nick ] $+ .codes ],3,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],4,32) $+ . Please use text formatting sparingly.
      }
      elseif ($numtok(% [ $+ [ $nick ] $+ .codes ],32) == 6) {
        /kb5 $nick Your text contained $gettok(% [ $+ [ $nick ] $+ .codes ],1,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],2,32) $+ , $gettok(% [ $+ [ $nick ] $+ .codes ],3,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],4,32) $+ , and $gettok(% [ $+ [ $nick ] $+ .codes ],5,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],6,32) $+ . Please use text formatting sparingly.
      }
      elseif ($numtok(% [ $+ [ $nick ] $+ .codes ],32) == 8) {
        /kb5 $nick Your text contained $gettok(% [ $+ [ $nick ] $+ .codes ],1,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],2,32) $+ , $gettok(% [ $+ [ $nick ] $+ .codes ],3,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],4,32) $+ , $gettok(% [ $+ [ $nick ] $+ .codes ],5,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],6,32) $+ , and $gettok(% [ $+ [ $nick ] $+ .codes ],7,32) $+ $chr(37) $gettok(% [ $+ [ $nick ] $+ .codes ],8,32) $+ . Please use text formatting sparingly.
      }
    }



  }
}

on *:action:*:#spp-wifi: {
  if ( $nick !ishop # ) && ( $nick !isop # ) {
    kb5 $nick Don't use /me in here
  }
}

on *:JOIN:#spp-wifi {
  if ($nick !ishop #SPP-wifi) && ($nick !isop #SPP-wifi) {
    var %line = 1
    while (%line <= $lines(wifi-bannednicks.txt)) {
      var %iter = $read(wifi-bannednicks.txt, %line)
      if (%iter iswm $nick) && ($address($nick,2) != *!*@serebii.net) {
        ban -u600 #spp-wifi [ %iter $+ !*@* ]
        kc #spp-wifi $nick You cannot use that name here. Please try to reconnect with another name.
        //echo -a $nick - banned name
        .halt   
      }
      inc %line
    }
  }
}

on *:NICK:{
  var %line = 1
  if ($newnick !ishop #SPP-wifi) && ($newnick !isop #SPP-wifi) {
    while (%line <= $lines(wifi-bannednicks.txt)) {
      var %iter = $read(wifi-bannednicks.txt, %line)
      if (%iter iswm $newnick) && ($address($newnick,2) != *!*@serebii.net) && ($newnick ison #spp-wifi) {
        ban -u600 #spp-wifi [ %iter $+ !*@* ]
        //echo -a $nick - banned name
        kc #spp-wifi $nick You cannot use that name here. Please try to reconnect with another name.
      }
      inc %line
    }
  }
  set %line 1
  if ($newnick !ishop #SPP) && ($newnick !isop #SPP) {
    while (%line <= $lines(spp-bannednicks.txt)) {
      var %iter = $read(spp-bannednicks.txt, %line)
      if (%iter iswm $newnick) && ($address($newnick,2) != *!*@serebii.net) && ($newnick ison #spp) {
        ban -u600 #spp [ %iter $+ !*@* ]
        //echo -a $nick - banned name
        kick #spp $nick You cannot use that name here. Please try to reconnect with another name. 
      }
      inc %line
    }
  }
}
