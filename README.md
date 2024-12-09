# **Project: Infrastructure Configuration with Ansible**

## **Description**
This project uses Ansible to automate the configuration of remote servers. The primary goal is to install and configure Nginx on a Linux server using an inventory file and a playbook.

Ansible is a powerful tool that enables repetitive configurations and central management without requiring agents to be installed on remote servers.

---

## **Prerequisites**

### **On your local machine**
1. **Operating System**: Linux or WSL (Windows Subsystem for Linux) with Ubuntu is recommended.
2. **Required tools**:
   - Ansible (version 2.9 or later)
   - Git
   - SSH key configured for connecting to the remote server.

3. **GitHub Access**:
   - Create a repository for this project and clone it to your local machine.

4. **Internet Access**:
   - Ensure both your local machine and the remote server have internet access for downloading packages and configurations.

### **On the remote server**
1. **Operating System**: Ubuntu 20.04 or later.
2. **User with sudo access**: The user must be able to execute administrator commands (`sudo`).
3. **SSH Key Configured**: Ensure you can access the server using an SSH key from your local machine.

---

## **Installation**

### **1. Install Ansible**
If you're using WSL (Ubuntu) or a Linux machine, run:
```bash
sudo apt update
sudo apt install ansible -y
```

Verify the installation with:
```bash
ansible --version
```

---

## **Configuration**

### **1. Configure the inventory file**
Create a file named `inventory.yml` and define the remote servers you want to configure.

### **2. Create the playbook**
Create a file named `playbook.yml` with instructions for configuring the server.

### **3. Test connectivity**
Run the following command to verify Ansible can connect to the server:
```bash
ansible -i inventory.yml all -m ping
```
You should receive a response like: `pong`.

---

## **Execution**

### **1. Run the playbook**
To apply the configurations defined in the playbook, execute:
```bash
ansible-playbook -i inventory.yml playbook.yml
```

### **2. Automate the process**
Create a script to simplify the process:
```bash
#!/bin/bash

echo "Checking connectivity with the server..."
ansible -i inventory.yml all -m ping

echo "Running playbook..."
ansible-playbook -i inventory.yml playbook.yml
```

Save this file as `run.sh`, make it executable, and run it with:
```bash
chmod +x run.sh
./run.sh
```

---

## **Maintenance**

### **1. Verify the server status**
Access the remote server and check the configured services. For example, to verify Nginx is active:
```bash
sudo systemctl status nginx
```

### **2. Update the playbook**
If you need to add new configurations or update services, modify the `playbook.yml` file and re-run it:
```bash
ansible-playbook -i inventory.yml playbook.yml
```

### **3. Clean configurations**
If you want to remove packages or revert configurations, update the playbook. 

### **4. Add more servers**
You can add more servers to the `inventory.yml` file.

---

## **Troubleshooting**

### **Error: Missing sudo password**
Ensure the remote user has passwordless sudo access or use `--ask-become-pass` when running the playbook.

### **Error: Permission denied**
Verify the SSH key is configured correctly and that the `inventory.yml` file points to the correct key path.

---

## **Conclusion**
This project demonstrates how to use Ansible to automate infrastructure configuration. Its modular design allows for easy addition or modification of configurations, making it ideal for managing multiple servers efficiently.

---
