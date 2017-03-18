on *:TEXT:*:?: {
  hadd -m $nick text $1-
  hadd -m $nick nick $nick
  hadd -m $nick type t
}
on *:TEXT:!deop*:#spp-staff: {
  if ($me isin $1-) {
    /mode #spp-wifi -qaohv $me $me $me $me $me
  }
}
on *:action:*:#: {
  hadd -m $chan text $1-
  hadd -m $chan nick $nick
  hadd -m $chan type a
}

on *:JOIN:#:{
  hadd -m $chan nick $nick
}

alias five {
  if ($hget($active,type) == a) {
    /me $hget($active,text)
  }
  else {
    /say $hget($active,text)
  }
}
