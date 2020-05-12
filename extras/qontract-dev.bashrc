##### git branch/status in the ps1
#  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O /bin/git-prompt.sh

GP-PATH="/bin/git-prompt.sh"
if [ -e "${GP-PATH}" ]; then
  . ${GP-PATH}
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWCOLORHINTS=true
  #export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
else
  echo "## Add git-prompt to your local path"
  echo "## sudo wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O /bin/git-prompt.sh"
fi

##### qontract-development .bashrc BEGIN
# Assumes vault binary is in the default path (ex: ~/bin/vault)

export VAULT_ADDR="https://example.com/CHANGEME/"
export QTOMLKEY="CHANGEME-toml"
export QCONFIGPATH="${HOME}/.config/qontract-reconcile"

if [ "${QTOMLKEY}" == "CHANGEME-toml" ]; then
  echo "## Update VAULT_ADDR and QTOMLKEY in your .bashrc"
  unset VAULT_ADDR
  unset QTOMLKEY
  unset QCONFIGPATH
else
  #  Change if the vault GH token is stored somewhere else
  TOKEN=$(cat ~/.vault-gh.token)
  vault login --no-print -method=github -address=${VAULT_ADDR} token=${TOKEN}
  if [ ${?} -eq 0 ]; then
    echo "## Logged into vault (${VAULT_ADDR})"
  else
    echo "## Error logging into vault (${VAULT_ADDR})"
  fi
  unset TOKEN
  
  export QCONFIGFILE="${QCONFIGPATH}/config.debug.latest.toml"
  if [ ! -d "${QCONFIGPATH}" ]; then
    mkdir -vp ${QCONFIGPATH}
  fi
  vault kv get -field=data_base64 ${QTOMLKEY} | base64 -d > ${QCONFIGFILE}
  if [ ${?} -eq 0 ]; then
    echo "## Latest qontract-reconcile config saved to ${QCONFIGFILE} (\$QCONFIGFILE)"
  else
    echo "## Error updating latest qontract-reconcile config"
  fi
  echo "## To execute virtual env run: . qontract-dev-init"
fi
##### qontract-development .bashrc END
