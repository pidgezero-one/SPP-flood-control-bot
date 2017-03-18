/report /say please visit http://serebiiforums.com/showthread.php?t=467734 for instructions on how to report a person or incident
/wifi {
  //say $append($$1)
}

/kwifi {
  /kick #SPP $$1 $append($$1)
}

/kbwifi {
  kb5 $$1 $append($$1)
}
/ot /say stay on topic in here, anything that is not a wifi request/offer should go in #SPP , no exceptions
/ques /say please direct questions to #SPP, this channel is only for wifi requests/offers

/cbody {
  ban -u300 $$1 $gethost($$2)
  kc $$1 $$2 $3- 
}
/kc {
  inc %kicks
  /kick $$1 $$2 $3- $+ $chr(32) $+ -- $+ $chr(32) $+ $replace($read(kickcounters.txt),xxx,%kicks)
}
/k {
  inc %kicks
  /kick # $$1 $2- $+ $chr(32) $+ -- $+ $chr(32) $+ $replace($read(kickcounters.txt),xxx,%kicks)
}
