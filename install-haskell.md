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

### Windows

To Install Stack [For Windows](https://docs.haskellstack.org/en/stable/install_and_upgrade/#windows)

## Check it 

From the command line:
```shell
stack --version
```

## Try your first project

### [Example](exercises/example/README.md)
From the command line:

1. CD into the project directory:  `cd $PROJECTS/leng-prog/exercises/example`
2. Run `stack build`. It should compile OK.
3. Run `stack ghci`. You should be able to execute the `help`, `hello` and `obliqueShot` functions.
4. Run `stack test`. Tests should pass.

## IDE Support

### Install haskell Intellij plugin: (`Preferences/Plugins/Marketplace`) Search for *Intellij-Haskell*![](classes/images/intellij-haskell.png).

### Open the example project:

Click **Open** and select the **example** directory:

![](classes/images/ide-open-example.png)

In the **import** window select **import from external model**,  **haskell stack**

![](classes/images/ide-import-stack.png)

Hit **create**

In the **Project SKD** pull down select **Haskell tool Stack**

If it is not there select **Add Stack executable** and add it.

Hit **create** 

It should open the project.

Now you should be able to Edit and add configurations like:

* Haskell Stack Repl
* Haskell Stack Test

To run the **tests** or the **repl** from inside Intellij

Try them !

