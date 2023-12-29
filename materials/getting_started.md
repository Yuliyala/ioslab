# Getting Started

<img align="right" src="./assets/launching-amico.svg" width="400">

## Tasks

- Fork repository
- Setup repository
- Create blank project
- Create first PR/MR

## 1. Fork Repository

Fork this repository to your account then clone your forked repository to your machine.

If you don't know how to Fork repositories you can read an article about how to Fork in [Github](https://docs.github.com/en/github/getting-started-with-github/quickstart/fork-a-repo) / [Gitlab](https://docs.gitlab.com/ee/user/project/repository/forking_workflow.html).

## 2. Setup repository

Now you need to invite your Mentor into your repository. Go to Settings and invite your mentor as a collaborator, give him write permission.

## 3. Create app project

Just create a blank mobile app project, name it ```MobileLabApp```.

In this repository, you already have a project directory. Place your app project there.

## 4. Gitflow

You will develop your project using the Gitflow branching model, so read this [Article](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) about Gitflow.

Now create ```develop``` branch from ```main``` branch and push it, then create ```getting-started``` branch from ```develop```branch and push it. Commit your created project to ```getting-started``` branch and push it. Now you should have 3 branches in your repository: ```main```, ```develop``` and ```getting-started``` that contains your created app.

In github/gitlab repository settings, set ```develop``` as default branch.

💬 We recommend using git directly in the bash/zsh terminal, but if you prefer GUI Git Clients like [Fork](https://git-fork.com), you can use it.

## 5. Create PR/MR (Pull Request / Merge Request)

So now you have your own repository with ```MobileLabApp``` mobile app project in ```project``` directory. Time to create your first PR/MR.

Before making PR/MR you should add check mark next to the completed task.

In [README.md](../README.md) add ```- [x]``` next to Getting Started item in Progress section. Then commit this changes to ```getting-started``` branch and push it.

Now create a new PR/MR from ```getting-started``` branch to ```develop``` branch, name it as ```[1] Getting Started```, assign your mentor as a reviewer. If you have some questions you can leave them in PR/MR comments. If the reviewer declines your PR/MR and requests some changes, you will need to make those changes and push them to the current branch. If everything is okay and the reviewer approves your PR/MR and you can merge it in to ```develop``` branch, and go to the next task.

Good luck and have fun ✌️

[Back to Progress](../README.md#progress)