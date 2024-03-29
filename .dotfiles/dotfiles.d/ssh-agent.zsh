function sshAgent() {
  SSH_AUTH_SOCK="$HOME/.ssh/auth_sock"
  SSH_AGENT_PID=''
  SSH_AGENT_INFO="$HOME/.ssh/agent_info"

  if [[ -f $SSH_AGENT_INFO ]]
  then
    # echo 'Restore previous ssh-agent connection'
    source $SSH_AGENT_INFO > /dev/null
  fi

  # Check ssh key exists
  if ! ssh-add -l > /dev/null
  then
    if [ ! -z $SSH_AGENT_PID ]
    then
      # echo 'Kill the agent'
      ssh-agent -k > /dev/null || echoError 'Cannot kill ssh-agent'
    fi
    if [ -e $SSH_AUTH_SOCK ]
    then
      # echo 'Remove agent socket'
      rm -f $SSH_AUTH_SOCK || echoError "Cannot remove agent socket! ($SSH_AUTH_SOCK)"
    fi
    if [[ -e $SSH_AGENT_INFO ]]
    then
      # echo 'Remove agent info'
      rm -f $SSH_AGENT_INFO || echoError "Cannot remove agent info! ($SSH_AGENT_INFO)"
    fi

    # echo 'Start ssh-agent'
    ssh-agent -a "$SSH_AUTH_SOCK" -s > $SSH_AGENT_INFO
    ssh-add
  fi
}

sshAgent