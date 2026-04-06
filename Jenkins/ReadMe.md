# Introduction of Jenkins

## Project Reviews

We will explore how Jenkins simplifies and streamlines your development workflows, empowering you to build, test, and deploy software with ease.

### Introduction to CICD

Continuous Integration and Continuous Delivery (CI/CD) is a set of best practices and methodologies that revolutionize the software development lifecycle by enhancing efficiency, reliability, and speed. CI/CD represents a seamless integration of automation and collaboration throughout the development process, aiming to deliver high-quality software consistently and rapidly. 

In the realm of CI, developers regularly integrate their code changes into a shared repository, triggering automated builds and tests to detect integration issues early. On the other hand, CD encompasses both Continuous Delivery and Continuous Deployment, ensuring that software is always in a deployable state and automating the deployment process for swift and reliable releases. The CI/CD pipeline fosters a culture of continuous improvement, allowing development teams to iterate quickly, reduce manual interventions, and deliver software with confidence.

### What is Jenkins?

Jenkins is widely employed as a crucial CI/CD tool for automating software development processes. Teams utilize Jenkins to automate building, testing, and deploying applications, streamlining the development lifecycle. With Jenkins pipeline, developers can define, version and execute entire workflows as code, ensuring consistent and reproducible builds. Integration with version control systems allows Jenkins to trigger builds automatically upon code changes, facilitating early detection of issues and enabling teams to deliver high-quality software at a faster pace. Jenkins' flexibility, extensibility through plugins, and support for various tools make it a preferred choice for organizations aiming to implement efficient and automated DevOps practices.

### Task

**Getting Started with Jenkins**

1. Let's install jenkins.

- Update package repositories.

'sudo apt update'

![Update](./img/apt-update.JPG)

- Install JDK

'sudo apt install default-jdk-headless'

![JDK](./img/jdk.JPG)

- Install Jenkins.

'    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt-get install jenkins'

![Jenkins](./img/jenkins.JPG)

The command installs Jenkins. It involves importing the Jenkins GPG key for package verification, adding the Jenkins repository to the system's source, updating package lists, and finally, installing Jenkins through the package manager (apt-get).

- Check if jenkins has been installed, and it is up and running.

'sudo systemctl status jenkins'

![Status](./img/no-jdk.JPG)

Let's resolve this:

- Confirm ALL Jenkins repo files.

'ls /etc/apt/sources.list.d/'

![confirm-repo](./img/rm-jdk.JPG)

- Remove ALL Jenkins configs.

'sudo rm -f /etc/apt/sources.list.d/jenkins.*'

'sudo rm -f /usr/share/keyrings/jenkins-keyring.asc'

![Remove-duplicate](./img/rm-file.JPG)

- Fix the .sources file properly.

'sudo nano /etc/apt/sources.list.d/jenkins.sources'

'Types: deb
URIs: https://pkg.jenkins.io/debian
Suites: binary/
Components:
Signed-By: /usr/share/keyrings/jenkins-keyring.asc'

![code](./img/code-sources.JPG)

- Remove everything Jenkins-related (clean reset).

'sudo rm -f /etc/apt/sources.list.d/jenkins.list'

'sudo rm -f /etc/apt/sources.list.d/jenkins.sources'

![RM-jkn](./img/gpg.JPG)

- Make sure nothing is left.

'grep -r "pkg.jenkins.io" /etc/apt/'

![erase](./img/jenkins-script.JPG)

- Update.

'sudo apt update'

![update](./img/jenkins-spt.JPG)

- Re-add Jenkins properly.

- Add key.

'curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \'

'/usr/share/keyrings/jenkins-keyring.asc > /dev/null'

![Add-key](./img/clean-apt.JPG)

- Add repo.

'echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | \'

'sudo tee /etc/apt/sources.list.d/jenkins.list'

![Add-repo](./img/add-repo.JPG)

- Update.

'sudo apt update'

![Error](./img/err.JPG)

- Let's pinpoint the exact hidden file still causing the issue.

'grep -r "jenkins" /etc/apt/'

![error-file](./img/err-file.JPG)

Now we can see that we still have the file '/etc/apt/sources.list.d/jenkins.list', even though it looks correct, the error is NO_PUBKEY 7198F4B714ABFC68 which means the key file it references is either:

- missing.
- empty.
- corrupted.

- Remove ALL Jenkins-related files.

'sudo rm -f /etc/apt/sources.list.d/jenkins.*'

![remove-jkd](./img/rmove-jk.JPG)

- Recreate the key properly.

'sudo rm -f /usr/share/keyrings/jenkins-keyring.asc'

![rereate-key](./img/no-installation.JPG)

- Clear APT cache.

'sudo rm -rf /var/lib/apt/lists/*'

- Let's now add it again.

'curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | \'

'sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.asc'

![Add](./img/check.JPG)

- Fix permissions.

'sudo chmod 644 /usr/share/keyrings/jenkins-keyring.asc'

![Permission](./img/perm.JPG)

- Confirm the repo file is correct.

'sudo nano /etc/apt/sources.list.d/jenkins.list'

'deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/'

![asc-file](./img/asc-file.JPG)

- Update again.

'sudo apt update'

![Fix](./img/fontconfig.JPG)

This is a hostname resolution problem not Jenkins.

- Check your hostname.

'hostname'

![hostname](./img/jenkins-manually.JPG)

- Fix /etc/hosts.

'sudo nano /etc/hosts'

127.0.0.1 localhost
127.0.1.1 ip-172-31-28-138 (replace with hostname)

![Install](./img/jenkins-install.JPG)


- Then test.

'sudo ls'

![test](./img/list.JPG)

- Update.

'sudo apt update'

![update](./img/upd.JPG)


**We’ll bypass the broken repo completely and install Jenkins directly.**

- Install Java (required)

'sudo apt install openjdk-17-jdk -y'

![java](./img/java.JPG)

- Download Jenkins .deb package directly.

'wget https://get.jenkins.io/debian-stable/jenkins_2.452.1_all.deb'

![Jenkins](./img/installed.JPG)

- Install it.

'sudo dpkg -i jenkins_2.452.1_all.deb'

![fix](./img/fix-jenkins.JPG)

'sudo apt -f install -y'

![cat-repo](./img/cat-repo.JPG)


- Start Jenkins.

'sudo systemctl start jenkins'

'sudo systemctl enable jenkins'

![permission](./img/permission.JPG)

- Let's check if jenkins has been installed, and it is up and running.

'sudo systemctl status jenkins'

![Test](./img/test.JPG)


On our Jenkins, create a new inbound rule for port 8080 in the security group. By default, jenkins listens on port 8080, we need to create an inbound rule for this in the security group of our jenkins instance.

![SG-setting](./img/sg.JPG)

![setting](./img/rule.JPG)

2. **Set up Jenkins on the Web Console**

- Input your jenkins instance ip addresses on the browser i.e http://public_ip_address:8080.

'http://51.20.118.129:8080'

- On the Jenkins instance, check "/var/lib/jenkins/secrets/initialAdminPassword" to know your password.

![browser](./img/jenkins-browser.JPG)

'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'

![password](./img/pwd.JPG)

- Install suggested plugins.

![plugins](./img/plugin.JPG)

- Create a user account.

![remove-key](./img/rm-key.JPG)

![add-key](./img/add-key.JPG)

- Log in to jenkins console.

![stable-repo](./img/stable-repo.JPG)
