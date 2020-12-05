Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# TO DO EVERY MORNING #

## MAC USERS
-- terminal instructions to pull the new version of the rails app

cd ~/code/YOURNAME/aimy_teaser # go to the folder
gst # checks if status is clean -- should be clean check with me if not
git pull origin master

-- terminal instructions to pull the latest version of the WX-app

cd ~/code/YOURNAME/aimy_teaser_wx
gst # should be clean, check with lead if not
git pull origin main

### NOW YOU **CREATE A BRANCH** FOR THE DAY's WORK

1) Make sure you are in the folder for the app you are working on (e.g. /aimy_teaser_wx)
2) git checkout -b BRANCH_NAME
3) Now you should BE in the BRANCH on your terminal
4) In the FOOTER of WeChat_Dev_Tools, you should see the BRANCH_NAME and NOT main
5) NEVER code in MAIN
6) As you code on your branch, commit your changes at regular intervals
7) When you think your branch is sorta done, you can 
    git push origin BRANCH_NAME
    this updates the remote (GitHub) with the work you did on your branch
8) When the team is ready, we can go to GitHub together and merge the branches

================================================

## WINDOWS
-- terminal instructions to pull the new version of the rails app

cd ~/code/YOURNAME/aimy_teaser # go to the folder
gst # checks if status is clean -- should be clean check with me if not
git pull origin master

-- terminal instructions to pull the latest version of the WX-app

navigate to /mnt/c/Users/YOURNAME/WeChatProjects/aimy_teaser_wx
gst # should be clean, check with lead if not
git pull origin main


## DEV NOTE

- recently removed from package.json
 "choices.js": "^9.0.1",
 "select2": "^4.0.13"