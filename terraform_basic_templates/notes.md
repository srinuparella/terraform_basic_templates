# "We already stored the file in /tmp using destination. Then, we use chmod a+x to give execution access
#  to all users (user/group/others). 
# Finally, we execute the file directly from /tmp on the EC2 using sudo sh."

# above and below are two types deffination of file,remote and chmod of +x and a+x


# We already stored the file in /tmp on the EC2 instance using the destination argument of the file provisioner.
# Then, we use chmod a+x to give execute access to all users — this includes the user (u), group (g), and others (o).
# Finally, we run the script directly from the /tmp directory using sudo sh.

# ✅ What is chmod +x?
# chmod = change file permissions

# +x = add execute permission

# By default, +x adds permission only to the user (owner)

# ✅ What is chmod a+x?
# a = all users (u = user, g = group, o = others)

# a+x = add execute permission for everyone

# Safer when script may be run by any user including sudo or other services

# sudo systemctl stop apache2,
#       sudo apt-get purge apache2* -y,
#       sudo apt-get autoremove -y,
#       sudo rm -rf /etc/apache2,
#       echo 'Apache removed successfully


# | Behavior                 | NGINX                        | Apache2                       |
# | ------------------------ | ---------------------------- | ----------------------------- |
# | Auto-start after install | ✅ Yes                        | ⚠️ Sometimes No               |
# | Auto-enable on boot      | ✅ Yes                        | ⚠️ Sometimes No               |
# | Default page visible     | ✅ Always (if port 80 free)   | ⚠️ Only if service is running |
# | Port 80 conflict         | ✅ Will fail silently if used | ✅ Same                        |
