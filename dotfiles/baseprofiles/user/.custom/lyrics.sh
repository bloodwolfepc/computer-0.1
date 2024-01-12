out="/tmp/lyrics.txt"
pid_file="/tmp/lyrics.pid"
run="lyricstify pipe --sync-type balance"

matchpid() {
   kill -0 "$pid" 2>/dev/null
}

checkpid() {
   matchpid "$pid" || rm "$pid_file"
}

startlyricstify() {
   $run > "$out" &
   echo $! > "$pid_file"
   sleep 1
}

if [ -f "$pid_file" ]; then
   pid=$(cat "$pid_file")
   checkpid
else
   startlyricstify
   pid=$(cat "$pid_file")
   checkpid
fi

echo $(tail -n 1 "$out")

