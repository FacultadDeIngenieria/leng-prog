# How to Install Haskell

## Install the Haskell Stack

### Mac OSX

#### Make sure you have brew installed
#### Install the Haskell Stack
 ```shell
 	brew install haskell-stack
 ```
 
 Upgrade to last version:
 
 ```shell
 	stack upgrade
 ```	
* Try ghci from the command line: `stack ghci`


### Windows

To Install Stack [For Windows](https://docs.haskellstack.org/en/stable/install_and_upgrade/#windows)

## Check it 

From the command line:
```shell
stack ghci
```

## Try your first project

From the command line:

1. `cd` to `<git-root>/leng-prog/exercises/example`
2. Run `stack build`. It should compile OK.
3. Run `stack ghci`. You should be able to execute the `test` function.
4. Run `stack test`. Test should pass.

## IDE Support

### Install haskell Intellij plugin: (`Preferences/Plugins/Marketplace`) Search for *Intellij-Haskell*![](classes/images/intellij-haskell.png).






