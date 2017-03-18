alias readerror {
  /run $read(M:\errors.txt, %l)
  //echo -a $read(M:\errors.txt, %l)
  inc %l
}

alias reset {
  set %l 1
}

alias kb5 {
  ban -u300 $chan $$1 2
  k $$1 $2- $+ $chr(32) $+ (5 min)
}

on *:text:$(* $str($chr(32),8) *):#spp-wifi:{
  kb5 $nick No space spamming!
} 

on *:BAN:#SPP-wifi:{
  var %bannicks = x
  var %z = 0
  var %bannednicks = 0
  while (%z <= $nick(#SPP-wifi,0)) {
    inc %z
    if (($mask($banmask,2) == $address($nick(#SPP-wifi,%z),2)) || ($mask($banmask,2) == $address($nick(#SPP-wifi,%z),4))) {
      if (%bannednicks = 0) {
        %bannicks = $nick(#SPP-wifi,%z)
      }
      else {
        %bannicks = $nick(#SPP-wifi,%z) $+ $chr(44) $+ $chr(32) $+ %bannicks
      }
      inc %bannednicks
    }
  }
  if (%bannicks != x) {
    //echo $chan 11,6 $+ $mask($banmask,2) -- This ban affects %bannicks
  }
}
