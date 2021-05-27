#!/bin/sh
set -x #echo on
set -e #on error exit
# ---------------------------------------------------------------------------------------------------------------------
#This Bash Shell script is an automation sample of update new server certificate when the certificate origin is in p12/pfx format.
#Requirements: openssl, nginx
# If the file is created on Windows and copied from FTP, the format must be UNIX, UTF8 without BOM (when password parameter is filled).
# ---------------------------------------------------------------------------------------------------------------------
openssl pkcs12 -in cert_in_pfx_format.p12 -nocerts -out cert_private.key -nodes -passin pass:origin_password_if_proceed
openssl pkcs12 -in sevilla.org.p12 -nokeys -out cert_public.pem -nodes -password pass:origin_password_if_proceed
mv -f /etc/ssl/private/cert_private.key /etc/ssl/private/cert_private_ant.key #Rename previus certificate with _ant
mv -f /etc/ssl/private/cert_public.pem /etc/ssl/private/cert_public_ant.pem 
cp -f cert_private.key /etc/ssl/private #copy certificates to Nginx directory
cp -f cert_public.pem /etc/ssl/private
service nginx restart #Restart Nginx
echo 'New certificate is installed.'
