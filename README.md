# PHP File Inclusion

Simple bash script to open a terminal in a php file inclusion vulnerable server.

## Usage

After identifying a potencial vulnerable upload option in your web application, upload the `file.php` file and find the url that serves it.

Execute the `console.sh` script with the found url as argument.

    ./console.sh https://www.vulnerable-website.com/statics/files/file.php
  
If the server runs the php file, the script will create a terminal to execute shell commands.

## Notes

Although the script creates a shell terminal clone, remember that we are still sending each command through a query param in the url, starting a new real terminal each time, so commands that change the current state of the shell, as PWD, won't last.

You can still execute multiple commands using combinations of exit statuses like:

    cd /home/user && ls -l
    
Some of the command could be stoppped by web application firewalls. For example:

    cd ../uploads
    cat /etc/passwd
    
Due to their common usage in path transversal vulnerabilities. However, if you were able to upload a php file in you web application, you probably can also upload some `.sh` file with those commands, and execute it using the script terminal:

    user:$ bash uploaded.sh
