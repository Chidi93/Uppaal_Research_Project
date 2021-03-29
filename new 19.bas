
darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git commit -m "First Commit"
[master (root-commit) d8ecb9c] First Commit
 1 file changed, 9 insertions(+)
 create mode 100644 Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git branch branch-feature

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git branch
  branch-feature
* master

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git checkout
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git checkout branch-feature
Switched to branch 'branch-feature'

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git commit -m "revision two(in branch-feature)
> 
> ^C

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git commit -m "revision two (in branch-feature)"
[branch-feature ffd6a12] revision two (in branch-feature)
 1 file changed, 6 insertions(+)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ checkout branch master
bash: checkout: command not found

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git checkout branch master
error: pathspec 'branch' did not match any file(s) known to git
error: pathspec 'master' did not match any file(s) known to git

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git checkout master
Switched to branch 'master'
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git commit -m "revision three (in master)"
[master 8d61f60] revision three (in master)
 1 file changed, 4 insertions(+)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git merge branch-feature
Auto-merging Main.java
CONFLICT (content): Merge conflict in Main.java
Automatic merge failed; fix conflicts and then commit the result.

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git mergetool
Merging:
Main.java

Normal merge conflict for 'Main.java':
  {local}: modified file
  {remote}: modified file

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git commit -m "revision one (in master)"
[master 15c2ebc] revision one (in master)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git checkout branch-feature
Switched to branch 'branch-feature'

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git commit -m "revision two (in branch-feature)"
[branch-feature 9967b45] revision two (in branch-feature)
 1 file changed, 1 insertion(+)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git checkout master
error: Your local changes to the following files would be overwritten by checkout:
        Main.java
Please commit your changes or stash them before you switch branches.
Aborting

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git commit -m "revision two (in branch-feature)"
[branch-feature 0d924b0] revision two (in branch-feature)
 1 file changed, 3 insertions(+), 4 deletions(-)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$ git checkout master
Switched to branch 'master'
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git commit -m "revision three (in master)"
[master 73e606a] revision three (in master)
 1 file changed, 6 insertions(+), 1 deletion(-)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git merge branch-feature
Auto-merging Main.java
CONFLICT (content): Merge conflict in Main.java
Automatic merge failed; fix conflicts and then commit the result.

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git mergetool
Merging:
Main.java

Normal merge conflict for 'Main.java':
  {local}: modified file
  {remote}: modified file

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git status
On branch master
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:
        modified:   Main.java

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ExampleMergeConflict/
        Main.java.orig


darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master|MERGING)
$ git commit -m "Merged Successfully"
[master 4c67eab] Merged Successfully

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git status
On branch master
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ExampleMergeConflict/
        Main.java.orig

nothing added to commit but untracked files present (use "git add" to track)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ rm *.orig

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git config --global mergetool.keepBackup false

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git status
On branch master
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ExampleMergeConflict/

nothing added to commit but untracked files present (use "git add" to track)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git add Main.java

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git commit -m "Merged"
On branch master
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ExampleMergeConflict/

nothing added to commit but untracked files present (use "git add" to track)

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ ?git command?
bash: ?git: command not found

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (master)
$ git checkout branch-feature
Switched to branch 'branch-feature'

darli@DESKTOP-4CAO8EF MINGW64 ~/OneDrive/Desktop/Git_Visualization_All_Branches (branch-feature)
$