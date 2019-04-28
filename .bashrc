# tmuxを起動して終了, tmuxのデフォルトシェルはfish
SESSION_NAME=dokatanuki

if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""

  if tmux has-session -t ${SESSION_NAME} >/dev/null 2>&1; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi

  tmux $option
  retval=$?
  if [ $retval -ne 0 ]; then
    echo "Return code was not zero but $retval"
  fi
fi

