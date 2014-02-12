#eval `ssh-agent -k`
#ssh-add .ssh/idname

# backup history
type backupHistory > /dev/null 2>&1 && backupHistory
# Store dirs stack
# See /Users/kazuyukimori/.oh-my-zsh/plugins/dirspersist.plugin.zsh
dirpersiststore
