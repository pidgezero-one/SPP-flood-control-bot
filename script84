on *:text:*:#spp-wifi: {
  if ( $nick !ishop # ) && ( $nick !isop # ) {
    var %nopunct = $nopunct($1-)
    if ($istok(tits,%nopunct,32) == $true) || (fuck isin %nopunct) || (bitch isin %nopunct) || ($istok(fag,%nopunct,32) == $true) || ($istok(faggot,%nopunct,32) == $true) || (penis isin %nopunct) || (vagina isin %nopunct) || ($istok(cunt,%nopunct,32) == $true) || ($istok(shit,%nopunct,32) == $true) || ($istok(shitty,%nopunct,32) == $true) || ($istok(shithead,%nopunct,32) == $true) || ($istok(slut,%nopunct,32) == $true) || ($istok(whore,%nopunct,32) == $true) {
      /kb5 $nick Inappropriate (5 min ban)
    }

    if ($checkchanads($1-) == $true) {
      kb5 $nick The symbol '#' denotes an IRC channel prefix. Do not post those here. (5 min ban)
    }
    if ($checkwebads($1-) == $true) {
      kb5 $nick No external links allowed (5 min ban)
    }

    var %leet = $replace($latinize($nopunct($1-)),3,e,4,a,5,s,0,o)
    if ($archeck($1-) == $true) {
      kb5 $nick No AR discussion (5 min ban)
    }
    if  ( (action isin %leet) || (actoin isin %leet) || (actino isin %leet) || (atcion isin %leet) ) && ( (reaply isin %leet) || (replay isin %leet) || (reply isin %leet) )  {
      kb5 $nick No Action Replay Discussion (5 min ban)
    }
    if ($istok($1-,r4,32) == $true) {
      kb5 $nick No R4 discussion (5 min ban)
    }
    if (pokesav isin %leet) || (poeksav isin %leet) || (poek sav isin %leet) || (poke sav isin %leet) || (poksav isin %leet) {
      kb5 $nick No Pokésav Discussion (5 min ban)
    } 

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
