# CONTRIBUTING

We're accepting help from anyone! This repo is collaborative, so if you want to add a solution in a new language (check Wikipedia [Programming Language List](https://en.wikipedia.org/wiki/List_of_programming_languages)) or just improve some code that you think that can be improved, follow this steps:


## 1. Fork it :fork_and_knife:

You can get your own fork/copy of [Stalin Sort](https://github.com/gustavo-depaula/stalin-sort) by using the <a  href="https://github.com/Hacktoberfest-2018/Hello-world/new/master?readme=1#fork-destination-box"><kbd><b>Fork</b></kbd></a> button or clicking [this](https://github.com/gustavo-depaula/stalin-sort/new/master?readme=1#fork-destination-box).

  [![Fork Button](https://help.github.com/assets/images/help/repository/fork_button.jpg)](https://github.com/gustavo-depaula/stalin-sort/new/master?readme=1#fork-destination-box)

## 2. Start coding! :rabbit2:

Once you have forked the repo, add your program in the language folder in main branch, if there is no language folder, make one, then add into it.

For a PR to be approved and merged please note:

- We allow more than one solution for one language, so if you don't want to modify someone else's code, you can add a new file with your own solution. Have in mind that your solution must be completely unique, if it isn't consider modifying the existing code.
- We don't allow deletions of others files or code.
- We don't allow files to be directly added in root directory of project, add them in there language folder
- Follow the code specifications!

### Code specifications

For the purpuses of this repo, we defined some rules that your code must to follow, this rules are listed bellow:
1. Your file **must** be named **stalin-sort**. All the other files of the same language must follow a numeric order, so the second implementation **must** be named as **stalin-sort-2**.
2. All the multiple implementations **must** starts with a commentary at its top explaining in what this implementation differs from the first one. For example the C++ *stalin-sort-2.cpp* has a commentary at its top saying that this one is a compile time implementation.
3. Your file **must** have only **ONE** function called Stalin Sort, for pattern matters it can be named according to the language case, so if it's PascalCase the function name is StalinSort, if it's camelCase the function name is stalinSort and so on. Take note that the language case must be followed through all code.
4. For this repo, we're implementing the ordering of **INTEGERS**, so case the language that you're implementing is static typed have it in mind.
5. Your function **must** receive only **ONE** argument, an array or a pointer, and **must** return a **NEW** array or pointer, according to the receved one, the received one shouldn't be modified.
6. Your file **must** at its end export the function. Case the language works like Elixir and doesn't need to explicitly exports the function, add a commentary at the end of the file saying it.
7. This rules are flexible case the language has some particularity like brainf*ck. So if you the language can't follow one of this rules make it clear at the PR and we'll analyze each particularity.

## 3. Ready, Steady, Go... :turtle: :rabbit2:

Once you have completed these steps, you are ready to start contributing by checking our `Help Wanted` issues and creating [pull requests](https://github.com/Hacktoberfest-2018/Hello-world/pulls).

## 4. Give this Project a Star :star:

If you liked working on this project, please share this project as much as you can and star this project to help as many people in open source as you can.

  
:tada: :confetti_ball: :smiley: _**Happy Contributing**_ :smiley: :confetti_ball: :tada:
