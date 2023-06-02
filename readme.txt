Este proyecto se llama Harvard 

Integrantes: 

- Martin, Paolo Kennedy
- Fabbio Vizcarra
- Bryan Trevejo
- Alfredo Huaman

$ git init
Initialized empty Git repository in D:/Downloads/proyecto/.git/

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (master)
$ git branch -m main

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git branch

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git add remote origin https://github.com/bryanets/springboot.git
fatal: pathspec 'remote' did not match any files

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git remote add origin https://github.com/bryanets/springboot.git

[main 601b256] agregamos el readme del proyecto
 Committer: unknown <SUITE@SUITEE102-ST25.cibertec.edu.pe>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.txt

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git commit --amend --reset-author
[main cf69389] agregamos el readme del proyecto
 Committer: unknown <SUITE@SUITEE102-ST25.cibertec.edu.pe>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.txt

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git config --global --edit

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git commit -m "agregamos el readme del proyecto"
On branch main
nothing to commit, working tree clean

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git status
On branch main
nothing to commit, working tree clean

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git push origin main
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 8 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 307 bytes | 307.00 KiB/s, done.
Total 3 (delta 1), reused 1 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/bryanets/springboot.git
   fc0fc3f..cf69389  main -> main

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git push origin main
Everything up-to-date

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git statusa
git: 'statusa' is not a git command. See 'git --help'.

The most similar command is
        status

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git status
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git add .

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   readme.txt


SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git commit -m "lol"
[main 5c620c5] lol
 1 file changed, 8 insertions(+)

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git pull origin main
From https://github.com/bryanets/springboot
 * branch            main       -> FETCH_HEAD
Already up to date.

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ git push origin main
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 8 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 372 bytes | 372.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/bryanets/springboot.git
   cf69389..5c620c5  main -> main

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$ ^C

SUITEE102-ST25+SUITE@SUITEE102-ST25 MINGW64 /d/Downloads/proyecto (main)
$
