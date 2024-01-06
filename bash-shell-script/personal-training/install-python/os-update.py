import platform
import os
import time

# Get the operating system
os_name = platform.system().lower()
print(f"Your server is {os_name.capitalize()}. We are now performing updates.")
if os_name in ['ubuntu', 'debian']:
    print(f"Your server is {os_name.capitalize()}. We are now performing updates.")
    time.sleep(5)
    os.system("sudo apt update -y")
    os.system("sudo apt install wget")
    os.system("sudo apt install curl")
    os.system("sudo apt install apache2")
    
elif os_name in ['centos', 'rhel']:
    print(f"Your server is {os_name.capitalize()}. We are now performing updates.")
    time.sleep(5)
    os.system("sudo yum update -y")
    os.system("sudo yum install wget")
    os.system("sudo yum install curl")
    os.system("sudo yum install httpd")

else:
    print("Hmm, seems I've never used it.")
