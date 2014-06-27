Pacman Github Contributions
===========================

## Idea
On GitHub user pages the count of contributions per day are visiolized in a calendar of squares. The more the darker the color.
With automatic commits you can draw here a nice pattern to impress visitors to the website.

![Pacman preview](/doc/pattern_pacman.png "Pacman pattern preview")

## What we need - Requirements <span id="requirements"/>
1. Special GitHub account just for this case
- A computer is always switched on and connected with the internet. 
- Linux must be installed on this computer. 
- It must be installed git. 
- There must be an SSH Key generated and stored at GitHub. 
- It has to be written a bash script, what the following things can 
	- Make file changes in the repo
	- Create random commit message
	- Git add / commit / push changes
	- The number of changes should be configurable

## Implementation
- Patterns: [PacMan](https://docs.google.com/spreadsheets/d/1Mj6vluUmvVFT7YDyfH9l50Ao63RBvSivuiPvNyrILFU/edit?usp=sharing "Pacman preview in a excel cheat")
- Create [Issues](docs/issues.md)
- Bash scripting
- Crontab with parameters

## Installation
1. Go to your server
- Install the [Requirements](#requirements)
- Clone PacHub
- Install cron job

### Clone PacHub

```bash
git clone git@github.com:PacHub/pachub.git
```

### Install crontab

```bash
crontag -e
```

Then enter:

```bash
0 7 * * * /path/to/pachub.sh /path/to/pachubdir /path/to/git
```

## Thank you!
- [Jexchan for multiple GitHub user handling](https://gist.github.com/jexchan/2351996)
- [I think I spider](http://ithinkispider.com/)
