# Udemy: Shell Scripting
Quizzes and notes for Udemy online course Shell Scripting: Discover How to Automate Command Line Tasks 

### Section2: Shell Scripting
* Scripts: A series of commands executed by an interpreter (Shell is the interpreter for shell commands)
* Shebang: `#!/bin/bash`
    * Current path passed as an argument to the interpreter
    * Does not contain shebang: Executing using current shell
    * Other texts following "`#`" are comments
* Variables: `VARIABLE_NAME="Value"`
    * No space around "="
    * Case sensitive (Convention: All upper-case)
    * Use variable: `$VARIABLE_NAME` or `${VARIABLE_NAME}`
    * Assign command to variable: `SERVER_NAME=$(hostname)`
    * No -/@ signs
* Tests: `[ condition-to-test-for ]`
    * For example: `[ -e /etc/passwd ]` checks if this file exists
    * Return status 0 (true) or 1 (false)
    * Other file operators: -d, -f, -r, -s, -w, -x, etc
    * String operators: -z String, -n String, String1 = String2, String1 != String2
    * Arithmetic operators: arg1 -eq/-ne/-lt/-le/-gt/-ge arg2
    * Look up by `man test` 
* If Statements:
    ```
    if [ test1 ]
    then
        command 1
    elif [ test2 ]
        command 2
    else
        command N
    fi
    ```
    * Best practice: Enclose variables in quotes: `if [ "$MY_SHELL" = "bash" ]`
* For Loop:
    ```
    for VARIABLE_NAME in ITEM_1 ITEMN
    do
        command 1
        command 2
        command N
    done
    ```
    * Lists examples:   
        * `for COLOR in red green blue`
        * `COLORS="red green blue"`  
            `for COLOR in $COLORS`
        * `PICTURES=$(ls *jpg)`  
            `for PICTURE in $PICTURES`
* Positional Parameters  
    `$0`: `"script.sh"`  
    `$1`: parameter1  
    `$2`: parameter2