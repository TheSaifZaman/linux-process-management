#!/bin/bash

# This script demonstrates various Linux permissions and user management commands

# 1. Create a new user
echo "Creating a new user 'testuser'..."
sudo useradd -m -s /bin/bash testuser
sudo passwd testuser

# 2. Create a new group
echo "Creating a new group 'testgroup'..."
sudo groupadd testgroup

# 3. Add the user to the group
echo "Adding 'testuser' to 'testgroup'..."
sudo usermod -aG testgroup testuser

# 4. Create a test file
echo "Creating a test file..."
echo "This is a test file." > testfile.txt

# 5. Change ownership of the file
echo "Changing ownership of testfile.txt to testuser:testgroup..."
sudo chown testuser:testgroup testfile.txt

# 6. Set file permissions
echo "Setting file permissions to rwxr-x---..."
sudo chmod 750 testfile.txt

# 7. Display file permissions
echo "File permissions for testfile.txt:"
ls -l testfile.txt

# 8. Add execute permission for others
echo "Adding execute permission for others..."
sudo chmod o+x testfile.txt

# 9. Remove write permission for group
echo "Removing write permission for group..."
sudo chmod g-w testfile.txt

# 10. Set SUID permission
echo "Setting SUID permission..."
sudo chmod u+s testfile.txt

# 11. Create a directory
echo "Creating a test directory..."
mkdir testdir

# 12. Set SGID permission on directory
echo "Setting SGID permission on testdir..."
sudo chmod g+s testdir

# 13. Set sticky bit on directory
echo "Setting sticky bit on testdir..."
sudo chmod +t testdir

# 14. Display directory permissions
echo "Directory permissions for testdir:"
ls -ld testdir

# 15. Create a file with ACL
echo "Creating a file with ACL..."
echo "This file has an ACL." > aclfile.txt
sudo setfacl -m u:testuser:rwx aclfile.txt

# 16. Display ACL
echo "ACL for aclfile.txt:"
getfacl aclfile.txt

# Cleanup
echo "Cleaning up..."
sudo userdel -r testuser
sudo groupdel testgroup
rm testfile.txt
rm -r testdir
rm aclfile.txt

echo "Script completed. Review the output to understand the commands and their effects."
