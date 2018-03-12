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
    then
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
* Positional Parameters: 
    ```
    $0: script.sh  
    $1: parameter1  
    $2: parameter2
    ```
    * To access every input variable from $1: `for USER in $@`
    * Use `shift` to shift the positional arguments to the left
* STDIN:
    `read -p "PROMPT" VARIABLE`


### Section3: Exit Statuses and Return Codes
* Exit Status:
    * Every command return a status of 0~255
    * 0 is success, other than 0 are errors
    * `$?`: Exit code of last command, can assign to variable
    * Explicitly define exit status: `exit n` (otherwise returns that of previous command)
* Logical Operators:
    * `&&`: AND (execute second command if only first command succeeds)
    * `||`: OR (execute second command if only first command fails)
    * Chain commands together: If previous command exits with 0, command after `&&` will be executed, whereas command after `||` will not
        * Semicolon `;` is same as putting commands on different lines, can also be used outside shell scripts


### Section4: Functions
* Define a function:
    ```
    function function-name() {
        # Code goes here
    }
    # Or
    function-name() {
        # Code goes here
    }
    ```
* Call a function:
    ```
    function-name
    ```
* Functions have to be:
    * Defined before it's called
        * Function evaluates at run-time (not pre-compiled), so we can call a function in another function's body (e.g. mutual recursion)
    * No braces around
* Arguments:
    ```
    $0: The script itself
    ```
    * To access all parameters from $1: `for USER in $@`
* Scopes:
    * By default, variables are global
    * Have to be defined before used
    * Variable defined inside function: Valid after function is executed
    * Local variables:
        * Accessed within the function (only functions can have local variables)
        * Created with: `local LOCAL_VAR=1`
* Exit status (Return code):
    * Explicitly: `return <RETURN_CODE>`
    * Implicitly: Exit status of last command
    * 0 is success, other than 0 are errors
    * `$?`: Exit code of last command, can assign to variable
* PID of current script: `$$`
* basename: Get only file name of a path


### Section5: Shell Script Checklist
* Shebang
* Comments / file header: What the script does, etc.
* Global variables
* Group all functions
    * Use `local`
* Script body
* Explicitly exit with an exit status
    * Last line with `exit 0`


### Section6: Wildcards
* `*`: Matches zero or more chars
* `?`: Matches one char
* `[]`: A character class: Match any of the chars included between the brackets
    * `[!]`: Matches any of the chars not included in the bracket (matches exactly one char)
        * `[!aeiou]*`: Any file not starting with a vowel
    * Ranges: `[a-g]*`: Any file starting with a, b, c, d, e, f or g
    * Predefined char classes:
        * `[[:alpha:]]`: Alphabetic letters
        * `[[:alnum:]]`: Alphanumeric letters
        * `[[:digit:]]`: Letter in decimal
        * `[[:lower:]]`: Lowercase letters 
        * `[[:space:]]`: Space, newline and tabs 
        * `[[:upper:]]`: Uppercase letters
* Match a wildcard char:
    * Use an escape char: `\?` and `\*`
* Can use in a for loop: `for FILE in *.txt`


### Section7: Case Statements
```
case "$VAR" in
    pattern_1)
        # Commands
        ;;
    pattern_N)
        # Commands
        ;;
esac
```
* Use `|` for multiple patterns
    * Match "yes": `[yY]|[yY][eE][sS]`
* Use `*` to catch-all


### Section8: Logging
* Who, what, when, where, why
* Syslog standard (Linux)
    * Facilities: kern, user, mail, daemon, auth, local0, local7
    * Severitiese: emerg, alert, crit, err, warning, debug, ...
    * Log locations are configurable:
        * /var/log/messages
        * /var/log/syslog
* Logging with `logger`


### Section9: While Loops
```
while [CONDITION_IS_TRUE]
do
    command 1
    command 2
    command n
done
```
* Condition can be a command, continues if exit status is 0
* Increment: `((INDEX++))`, this is called arithmetic expansion
* `for` loop reads file word-by-word. To read the file line-by-line:
    ```
    LINE_NUM=1
    while read LINE
    do
        echo "${LINE_NUM}: ${LINE}"
        ((LINE_NUM++))
    done < file_to_read.txt
    ```
    or pip the file content into `while`:
    ```
    grep * file_to_read.txt | while read LINE
    do
        echo "${LINE}"
    done
    ```
* Read to multiple variables (like pattern matching): `while read FS MP REST`
    * First n-1 vars assigned one word each
    * The last command carries all rest words
