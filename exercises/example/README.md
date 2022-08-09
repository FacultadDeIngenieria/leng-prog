# Example Project

This is an example project to test that your Haskell installation is working OK

To check it:

## Change (CD) into this project Directory !!!

This is **VERY** important, you should **ALWAYS** be positioned into the project root for commands to run OK.

The project root is where this file, the **package.yaml** and **stack.yaml** files resides. Also you will have a couple of directories **src** and **test** where the project sources and test reside. 

## Now Try building the project, running the Repl and the tests

1. `stack build` should build the project.
2. `stack ghci` should load the Repl, then run for example the `help` function
3. `stack test` should run the tests without errors.


## The projects contains 2 example functions

When running from the repl

```shell
stack ghci
```
---

```haskell
> hello
```

Should print:

```
 Usage:
     hello <your name>
     obliqueShot <angle in degrees> <velocity in m/s>
```  
---
```haskell
> hello "Juan"
```
Should print:

```
"Hello: Juan!"
```  
---
```haskell
> obliqueShot 45 10
```
Should print:

```
(10.196798205363516,2.5491995513408785)
```  


  
    
    

 
