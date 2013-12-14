eval `ssh-agent -k`
ssh-add .ssh/idname

# backup history
type backupHistory > /dev/null 2>&1 && backupHistory
