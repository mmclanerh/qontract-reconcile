# qontract extras
To enhance the development experience, included are some dev-environment 
helpers.  
  
As I find myself often working with debug/development of qontract-reconcile,
 I created a local user account (username.qontract) to help automate a clean
 and credential-isolated environment. Sudo'ing into the account, enables and
 automates several features of the qontract-reconcile development experience:

- Changes prompt to automagically reflect colorized git status info
- Logs into Vault
- Updates a local qontract-reconcile toml file with the latest vault values

Additionally there is [contract-dev.vimrc](qontract-dev.vimrc) which
 adds PEP standards for editing with vi/vim:
- 80 character line marker
- Tabs as spaces, 2 character width

## Install Steps
- (optional) Create a local user accounti

- (optional) Add [contract-dev.vimrc](qontract-dev.vimrc) to $HOME/.vimrc
- Append contract-dev.bashrc to $HOME/.bashrc

export VAULT_ADDR="https://example.com/CHANGEME/"                               
export QTOMLKEY="app-sre/ci-int/qontract-reconcile-toml"   

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
                                                           


## bashrc

This will initialize 

Append the contents of [qontract-dev.bashrc](qontract-dev.bashrc) to your $HOME/.bashrc



## TODO
- Change to a container image model with these development-env specific features
- Make development-env container model launchable through make
