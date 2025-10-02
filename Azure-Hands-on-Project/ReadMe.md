# Getting Started with Azure: Deploy and Manage a Linux VM

## Introduction

Cloud computing allows users to access powerful compute resources on demand. Microsoft Azure is one of the leading cloud platforms, and this projects will introduce you to its capabilities through *hands-on experience with deploying and managing a Linux Virtual Machine (VM)*.

This project will guide you through the process of creating a *Linux VM management operations* like starting, stopping, and resizing the VM using the Azure Portal.

## Objectives

1. Understand the Azure Portal and resource organization.

2. Create and manage a *Linux Virtual Machine* in Azure.

3. Securely connect to the VM using *SSH*.

4. Perform basic *VM lifecycle management* tasks.

5. Explore configuration options for compute resources.


## Prerequistes

1. A valid *Azure subscription* (Free Tier is acceptable).

2. A local *SSH client* (Linux/macOS terminal od PUTTY for Windows).

3. Basic understanding of *Linux commands* and *SSH access*.


## Project Task

### Create an Azure Account and Access the Portal.

- Visit the Azure signup page to create an account.

https://azure.microsoft.com/en-us/get-started/azure-portal

1. Click on "Sign in" for existing users and click on "New to Azure? Get Started".

![Create account](./img/Azure-signin.JPG)

2. Select your subscription. For this project, select "Try Azure for free".

![Select Subscription](./img/Select-Subscription.JPG)

3. Create account by filling in your data.

![Fill in data](./img/Create-account.JPG)

![Homepage](./img/Homepage-Azure.JPG)

### Create a Resource Group

- In the portal, search for *resource Groups* and click *Create*.

![Search](./img/Select-Resource-Group.JPG)

![Click create](./img/Resource-group.JPG)

- Choose a name and select a region.

![Choose a name](./img/Name-RG.JPG)

- Click *Review + Create* to create.

![Create Resource Group](./img/Create-RG.JPG)

![RG Creation](./img/RG-Creation.JPG)

![Created Resource Group](./img/Created-RG.JPG)


### Create a Linux Virtual Machine

- Search for Virtual Machines in the Azure Portal and click *Create*.

![VM Search](./img/VM-search.JPG)

![Create VM](./img/Create-VM.JPG)

![Select VM](./img/Select-VM.JPG)

![Input data](./img/Input-data.JPG)

- Fill out the *Basics* tab:

1. *VM name: 'linux-vm'*

2. *Region:* Same as resource group

3. *Image:* Ubuntu LTS 

4. *Authenication:* SSH public key. If needed, generate a key with: *'ssh-keygen -t rsa*

5. *Username:* Choose a non-root name like *azureuser*

- Click on 'Review + create'.

![VM data](./img/VM-data.JPG)

![VM data 1](./img/VM-data-1.JPG)

![VM data 2](./img/VM-data-2.JPG)

![Key pair generation](./img/Key-pair-generation.JPG)

![Created VM](./img/Created-VM.JPG)

### Connect to the Linux VM via SSH

- Once the deployment is complete, go to the VM's Overview page.

![VM page](./img/VM-Page.JPG)

- Copy the *public IP address* and in your terminal, connect via SSH.

![IP address](./img/IP-address.JPG)

- Set up the Native SSH to connect to the local by adding the downloaded key pair.

![Pem key](./img/VM-Settings.JPG)

- Connect to your VM via SSH by copying the SSH command and pasting in your local machine. Ensure you are on the 'Downloads' environment where you have the downloaded key pair.

'ssh -i linux-vm_key.pem azureuser@74.235.223.90'

- Accept the host key fingerprint on first login.

![Connected VM](./img/Linux-VM-SSH-Connection.JPG)


### Explore VM Configuration

- In the Azure Portal, view the *VM details*.

1. OS type, VM Size, attached disk, and IP info.

![VM-details](./img/VM-details.JPG)

![VM disk](./img/VM-disk-settings.JPG)

- On the Linux VM, explore using commands like;

'uname -a
df -h
ip a'

![Trial](./img/VM-trial.JPG)


### Manage VM Lifecycle 

- From the Azure Portal:

1. Use  the *Stop,Start, and Restart* buttons.

For Stop VM:

![Stop](./img/Start-Stop.JPG)

![Stop-VM](./img/Stop-VM.JPG)

For Start VM:

![Start-VM](./img/Start-VM.JPG)

![Start](./img/VM-Start.JPG)

For Restarted VM:

![Restart-Vm](./img/Restart-VM.JPG)

![Restart](./img/VM-Restart.JPG)

![Restarted-VM](./img/Restarted-VM.JPG)

2. Click *Size* to *resize* the VM to a smaller/lager SKU.

![Size](./img/Size-VM.JPG)

![Resize](./img/Resize.JPG)

