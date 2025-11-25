# Capstone Project: E-Commerce Platform Deployment with Git, Linux, and AWS.

## Scenario:

You have been assigned to develop an e-commerce website for a new online marketplace named "MarketPeak". This platform will feature product listings, a shopping cart, and user aurhenication. Your objective is to utilize Git for version control, develop the platform in a Linux environment and deploy it on an AWS EC2 instance. 

## Tasks

### Implement version control with Git.

1. Initialize git repository:

- We begin by creating a project directory named **"MarketPeak"**

'mkdir MarketPeak'

![MarketPeak](./img/MarketPeak-app.JPG)

- Inside the directory, initiliaze Git repository to manage your version control.

'cd MarketPeak'

![Open-file](./img/Open-MarketPeak.JPG)

'git init'

![Initialize-git](./img/Init-MP.JPG)


2. Obtain and prepare the e-commerce website template.

Visit Tooplate via https://www.tooplate.com/free-templates or any other free template resources and download a suitable e-commerce website template. Extract the dowmloaded template into the project directory and Adjust as much as possible.

![Tooplate-file](./img/tooplate-file.JPG)

![Extract-file](./img/extract-file.JPG)


3. Stage and commit the template to git.

- Add the website files to the Git repository.

'git add .'

![Add-files](./img/add-file.JPG)

- Set the git global configuration with a username and email.

'git config --global user.name "brucebruyo"'

![Git-username](./img/git-username.JPG)

'git config --global user.email "brucebruyo@gmail.com"'

![Git-email](./img/git-email.JPG)

- Commit the changes with a clear, descriptive message.

'git commit -m "Initial commit with basic e-commerce site structure"'

![Git-commit](./img/git-commit.JPG)

4. Pusdh the code to a git repository.

After initializing the git repository and adding the e-commerce website template, the next step is to push the code to a remote repository on Github. This step is crucial for version control and collaboration.

- Create a remote repository on Github: Login to Github account and create new repository named **"MarketPeak_Ecommerce"**. Leave the repository empty without initializing it with a README, .gitignore, or license.

![Git-Dashboard](./img/git-dashboard.JPG)

![Create-Repository](./img/create-repo.JPG)


- Link the local repository to Github: On the terminal, within the project directory, add the remote repository URL to the local repository configuration.

'git remote add origin https://github.com/bruyo/MarketPeak_Ecommerce.git'

![Remote-repository](./img/remote-repo.JPG)

- Push the code: Upload the local repository content to Github.

'git push -u origin main'

![Git-push](./img/push-file.JPG)


### AWS Deployment

To deploy **"MarketPeak_Ecommerce"**, we start by setting up an Amazon EC2 instance.

1. Set up an AWS EC2 Insstance.

- Log in to the AWS Management Console.

![AWS-signin](./img/aws-signin.JPG)

- Launch an EC2 instance using an Amazon Linux AMI.

![Instance-launch](./img/EC2-launch.JPG)

![EC2-Setup](./img/EC2-setup.JPG)

![Select-keypair](./img/select-keypair.JPG)

![Launch-EC2-Instance](./img/launch-EC2.JPG)


- Connect to instance using SSH.

![Select-EC2-to-connect](./img/connect-EC2.JPG)

![Select-SSH](./img/select-ssh.JPG)

![Copy-code](./img/copy-code.JPG)


2. Clone the repository on the Linux Server.

Before deploying the e-commerce platform, you need to clone the Github repository to the AWS EC2 instnace. This process involves authenicating with Github and choosing between two primary methods of cloning a repository: **SSH** and **HTTPS**.

- Navigate to the repository in the github console.

![Github-dashboard](./img/MarketPeak-github.JPG)

- Select the **'code'** as highlighted in the image below.

![Click-code](./img/click-code.JPG)


### SSH Method:

- On the EC2 instance, generate SSH keyoair using ssh-keygen.

'ssh-keygen'

![SSH-keygen](./img/ssh-keygen.JPG)

![Keygen](./img/keygen.JPG)


- Display and copy the public key.

'cat /home/ec2-user/.ssh/id_rsa.pub'

![Public-key](./img/public-key.JPG)


- Add the SSh public key to the Github account.

![Git-homepage](./img/git-homepage.JPG)

![Click-setting](./img/Click-setting.JPG)

![Select-SSH-key](./img/select-ssh-key.JPG)

![Create-SSH-key](./img/create-ssh-key.JPG)

![SSH-key](./img/ssh-key.JPG)


- Use the SSH clone URL to clone the repository:

- Install git on the linux server.

'sudo yum install git -y'

'git clone git@github.com:bruyo/MarketPeak_Ecommerce.git'

![clone-git](./img/clone-git.JPG)


### HTTPS Method:

For repositories that you plan to clone without setting up SSH keys, use the HTTPS URL. Github will prompt for your username and password:

'git clone https://github.com/bruyo/MarketPeak_Ecommerce.git'

![HTTPS-method](./img/https-method.JPG)


3. Install a Web Server on EC2.

**Apache HTTP Server (httpd)** is a widely used web server that serves HTML files and content over the internet. Installing it on linux EC2 server allows you to host **MarketPeak E-commerce** site:

- Install Apache web server on the EC2 instance. Note that httpd is the software name for Apache on systems using yum package manager.

'sudo yum update -y'

![yum-update](./img/yum-update.JPG)

'sudo yum install httpd -y'

![httpd-install](./img/httpd-install.JPG)

'sudo systemctl start httpd'

![Start-httpd](./img/start-httpd.JPG)

'sudo systemctl enable httpd'

![Enable-httpd](./img/enable-httpd.JPG)

This first updates the linux server and then installs httpd (Apache), starts the web server, and ensures it automatically starts on server boot.


4. Configure httpd for Website.

To serve the website from EC2 instance, configure **httpd** to point to the directory on the Linux server where the website code files are stored. Usually in /var/www/html.

- **Prepare the Web Directory**: Clear the default httpd web directory and copy MarketPeak Ecommerce website files to it.

'sudo rm -rf /var/www/html/*'

![Configure-httpd](./img/configure-httpd.JPG)

'sudo cp -r ~/MarketPeak_Ecommerce/* /var/www/html/'

![MarketPeak-httpd](./img/MarketPeak-httpd.JPG)

The directory /var/www/html/ is a standard directory structure on Linux systems that host web content, particularly for the **Apache HTTP Server**.

When you install Apache on a linux system, the installation process automatically creates this directory. It's designated as the default document root in Apache's configuration, meaning that Apache is set up to serve web files (such as HTML, CSS, and JavaScript files) located in this directory to visitors of the website.

- Reload httpd: Apply the changes by reloading the httpd service.

'sudo systemctl reload httpd'

![Reload-httpd](./img/push-file.JPG)


5. Access website from browser.

- With **httpd** configured and website files in place, **MarketPeak_Ecommerce** platform is now live on the internet.

- Open a web browser and access the public IP of the EC2 instance to view the deployed website.

![Website-view](./img/website-view.JPG)


### Continuous Integration and Deployment Workflow.

To ensure a smooth workflow for developing, testing, and deploying the e-commerce platform, follow this structured approach. It covers making changes in a development environment, utilizing version control with Git, and deploying updates to the production server on AWS.

### Step1: Deveolping New features and fixes.

- Create a Deveolpment Branch: Begin the development work by creating a separate branch. This isolates new features and bug fixes from the stable version of the website.

'git branch development'

![Create-development-branch](./img/create-dev-branch.JPG)


'git checkout development'

![Switch-to-deveolpment-branch](./img/switch-dev.JPG)

- Implement Changes: On the development branch, add the new features or bug fixes. This might include updating web pages, adding new products, or fixing known issues.


### Step 2: Version Control with Git.

- Stage the changes: After making the changes, add them to the staging area in Git. This prepares the changes for a commit.

'git add .'

![Change-to-code](./img/changes-to-code.JPG)

- Commit the changes: Securely save the changes in git repository with a commit.

'git commit -m "add new feature"'

![Add-new-feature](./img/add-feature.JPG)

- Push changes to github: Upload the development branch with the new changes to Github. This enables collaboration and version tracking.

Generate github token 'https://github.com/settings/tokens'

'git push origin development'

![Pushed-file](./img/push-new-feature.JPG)


### Step 3: Pull Requests and Merging to the Main Branch.

- Create a Pull request (PR): On github, create a pull request to merge the development branch into the main branch. This process is crucial for code review and maintaining code quality.

![Pull-Request](./img/PR.JPG)

![Create-PR](./img/create-PR.JPG)

- Review and Merge the PR: Review the changes for any potential issues. Once satisfied, merge the pull request into the main branch, incorporating the new feautures or fixes into the production codebase.

![Merge-PR](./img/merge-PR.JPG)

![Confirm-merge](./img/confirm-merge.JPG)

![Merged-PR](./img/merged-PR.JPG)

'git checkout main'

![Switch-to-main-branch](./img/switch-main.JPG)

'git merge development'

![Merge-development-branch](./img/merge-dev.JPG)

- Push the Merged changes to Github: Ensure that the local main branch, now containing the updates, is pushed to the remote repository on Github.

'git push origin main'

![Push-feature](./img/push-feature.JPG)


### Step 4: Deploying updates to the production server

- Pull the latest changes on the server: SSH into the AWS EC2 instance where the production website is hosted. Navigate to the website's deirectory and pull latest changes from the main branch.

'git pull origin main'

![Update](./img/update.JPG)

- Restart the web server (if necessary): Depending on the nature of the updates, you may need to restart the web server to apply the changes.

'sudo systemctl reload httpd'

![Reload-server](./img/reload-server.JPG)


### Step 5: Testing New Changes

- Access the website: Open a web browser and navigate to the public IP address of the EC2 instance. Test the new features or fixes to ensure they work as expected in the live environment.

![Testing](./img/test.JPG)