## Homework howto

1. Register a Github account
2. Fork DRN88/blt repository  
https://guides.github.com/activities/forking/  
https://help.github.com/articles/fork-a-repo/  
Command:
```git clone https://github.com/DRN88/blt.git```
3. Do your homework in 'homeworks/w[0-9][0-9]/js' folder. Example:
```blt/homeworks/w39/js``` Where 'js' is "John Smith"
4. Explain your solution using Markdown syntax with README.md file:   https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
5. Once you are finished, create a pull request on Github
6. I will check your homework and if it is all good I will merge it to Develop or Master


## Tips and useful commands
#### git
```bash
git config user.name "MyName"     # Commits will be displayed with this uploader name - https://help.github.com/articles/setting-your-username-in-git/
git status                        # Check the changes between last commit vs newer changes
git add .                         # adds files/folders to commit
git commit -m "My Commit Message" # commits the files with that message
git push -u origin develop        # push to develop branch
git push -u origin master         # push to master branch (but use merge from develop instead)
git pull                          # pulls any new changes from repository
git clone                         # clones a repository
git checkout develop              # Switch to develop branch
git checkout master               # Switch to master branch
```
#### /home/$USER/.bashrc
Displays the current git branch on your terminal. Drop these lines into your /home/username/.bashrc
source /home/username/.bashrc reloads bashrc.
```bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
