on *:OPEN:?:*: {
  msg $nick Hi $nick $+ ! I am a bot. That means I am not a real person, and your PM will not be seen by a real person. Sorry about that. If you need help, ask another op.
  /timer 1 60 close -m $nick
}
