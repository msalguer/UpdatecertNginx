# Update certificate Nginx Bash Shell Script
MIT License  
  
  This Bash Shell script is an automation sample of update new server certificate when the certificate origin is in <b>p12/pfx format</b>.
* Requirements: <b>Openssl</b>, Nginx, Linux (tested on any Debian distribution)
* If the file is created on Windows and copied from FTP, the format must be UNIX, UTF8 without BOM (when password parameter is filled).
## For execute: 
* If has not previous installation of openssl: 
~~~
(sudo) apt-get install openssl
~~~
* First copy certfile (cert_in_pfx_format.p12) on same directory and modify script if need other certificates filenames.
* Execute script:
~~~
chmod +x ./update_cert_nginx.sh
sh ./update_cert_nginx.sh
~~~
