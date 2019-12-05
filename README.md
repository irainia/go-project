# GO-PROJECT

## Description

This repository was initiated as a framework to initiate a project written in GO language.

Requirement:

* install project basic dependency
* create project diretory
* create README.md file
* create Makefile
* create .gitignore
* initiate .git

## Dependency

### GNU Make

GNU Make version `3.81` should be installed on the system. For MacOS, you can go to [this link](https://stackoverflow.com/questions/11494522/installing-make-on-mac/11494872#11494872) and follow the instruction if it is not yet installed. To check if it's already installed as well as the version, run the following command:

```bash
make --version
```

### Ruby

Ruby version `ruby 2.3.7` should be installed on the system. Go to [this link](https://www.ruby-lang.org/en/documentation/installation/) and follow the instruction to install it. To check if the installation is success, you can check the version by running the following command:

```bash
ruby --version
```

## Install

*Note: As this is currently in development, tested system is MacOS `10.14.6`.*

This functionality will install basic requirements for GO. The following are list that will be installed:

* Homebrew (for MacOS)
* GO programming language
* GO Dep
* Git

Along the execution, some error may occur when the required program is already installed. So long the error is only about that, no need to worry.

## Initiate

This functionality will initiate GO project as specified. Along the execution, this will ask the user about some information. The following are the questions:

1. Repository Location, is the location where the projet will reside and should be similar to the one in repository server. For example it will be stored in `github.com`, then write `github.com` this in the prompt without prefix `http://www.` nor `https://www.` nor suffix `/`. Another example, if the project will reside in a group named `Irainia` inside `github.com`, then write `github.com/Irainia` in the input.

2. Project Name, will be combined with repository location as a directory (in local) for the project. Example, if the repository location (in the server) is `github.com` and the project name is `go-init`, then the combined name will be `github.com/go-init`. And it is highly recommended (according to GO documentation [here](https://golang.org/doc/code.html)) to store the project in that URL.

3. Project Description, is the brief description of the project. Make it as brief as possible. You can change it later in project itself.

The next step, it will create additional files such as `Makefile` and `README`. The last step will notify where the location of the project will be stored.
