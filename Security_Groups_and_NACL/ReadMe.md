# Security Groups and NACLs

## Project Overview

We are goinig to explore the core concepts of Amazon Web Services (AWS), specifically focusing on security groups and network access control lists (NACLs). These are fundamental components of the AWS infrastructure which entails how security group control inbound and outbound traffic to EC2 instances, and how NACLs acts as subnet-level firewalls, regulating traffic entering and exiting subnets.

### Security Group (SG)

**Inbound Rules:** These are rules that control incoming traffic to AWS resource, such as EC2 instance or an RDS database.

**Outbound Rules:** These are rules that control the outgoing traffic from an AWS resource.

**Stateful:** Security groups automatically allow return traffic initiated by the instances to which they are attached.

**Port:** A communication endpoint that processes incoming and outgoing network traffic. Security groups use ports to specify the types of traffic allowed.

**Protocol:** The set of rules that governs the communication between different endpoints in a network. Common protocols include TCP, UDP, and ICMP.

### Network Access Control List (NACL)

**Subnet-level Firewall:** NACLs act as a firewall at the subnet level, controlling traffic entering and exiting the subnet.

**Stateless:** Unlike security groups, NACLs are stateless, meaning they do not automatically allow return traffic. You must explicitly configure rules for both inbound and outbound traffic.

**Allow/Deny:** NACL rules can either allow or deny traffic based on the criteria.

**Ingress:** Refers to inbound traffic, i.e traffic entering the subnet.

**Egress:** Refers to outbound, i.e traffic exiting the subnet.

**CIDR Block:** Specifies a range of IP addresses in CIDR notation (e.g 10.0.0.0/24) that the NACL rule applies to.


**Default settings:**

**Default Security Group:** Every VPC comes with a default security group that allows all outbound traffic and denies all inbound traffic by default.

**Default NACL:** Every subnet within a VPC is associated with a default NACL that allows all inbound and outbound traffic by default.

**What is Security Group?** 

In simple terms, security groups act as barriers that control who can access your AWS resources and what they can do once they are in. They're like digital bouncers that keep your party (your cloud) safe and secure.

**What is NACLs?**

NACLs are like neighborhood security guards. They sit at the entrance and check every person (packet or data) that wnats to enter or leave the neighborhood. It works ate the subnet level not the individual resources level like the security groups. So instead of controlling access for each house (AWS resource), they control the entire neighborhood (subnet).

You can set rules in your NACL to allow or deny traffic based o things like IP addresses, protocols, and ports. For example, you can allow web traffic (HTTP) but block traffic on other ports like FTP or SSH.

### Tasks

1. Security Groups

2. NACLs

**For Security Groups**

1. EC2 instance creation.

- In the VPC we created previously, in the public subnet, create an ec2 instance.

![AWS-Search-page](./img/ec2.JPG)

![EC2-homepage](./img/lauch_instance.JPG)

![Ec2-setting](./img/ec2_setup-up.JPG)

![EC2-Setting](./img/key-pair.JPG)

![Create-keypair](./img/create_keypair.JPG)

![Network_setup](./img/network-setting.JPG)

![Edit-network](./img/edit-network.JPG)

![Security-Group](./img/sg.JPG)

![Launch-EC2](./img/launch-EC2.JPG)

![successful-launch](./img/successful-launch.JPG)

So this EC2 instance hosts our website.

![test-server](./img/created-instance.JPG)

Here's the security group configuration for the instance. In the inbound rules, only IPv4 SSh traffic on port 22 is permitted to access the instance.

![Inbound-SG](./img/inbound-sg.JPG)

For the outbound rule, you'll notice that all IPv4 traffic with any protocol on any port number is allowed, meaning the instance has unrestricted access to anywhere on the internet.

![Outbound](./img/outbound_SG.JPG)

Now, let's test accessibility to the website using the public IP address assigned to this instance.

Here, let's retrieve the public IP address.

![Public-address](./img/public-sddress.JPG)

If you enter "http://13.60.69.141" into your browser, and hit enter, you'll notice that the page doesn't load; it keeps attempting to connect. And finally it'll show this page. After sometime, you likely see a page indicating that itcan't be reached.

![Test](./img/test.JPG)

This is because of the security group, because we haven't defined HTTP protocol in the security group so whenever the outside world is trying to go inside our instance and trying to get the data, security group is restricting it and that's why we are unable to see the data.

To resolve this, we can create a new security group that allows HTTP (port 80) traffic:

1. Navigate to the "Security groups" section on the left sidebar.

- Then click on "Create Security Group".

![Create-Security-Group](./img/create-sg.JPG)

2. Please provide a name and description for the new security group.

- Ensure to select your VPC during the creation process.

![SG-setting](./img/SG-setting.JPG)

- Click on add rule.

![add-rule](./img/add-rule.JPG)

- Now, select "HTTP" as the type.

![Set_inbound_rule](./img/set-rules.JPG)

- Use 0.0.0.0/0 as the CIDR block. (Here we are allowing every CIDR block by using this CIDR).

Now you will see the rule have been created

- Keep the outbound rules as it is.

![outbound-rule](./img/outbound-rule.JPG)

- Now click on Create security group.

![Create-Security-Group](./img/create_SG.JPG)

Now, it is being created successfully.

![Created-SG](./img/Security-group-created.JPG)


Let's attach this security group to the instance.

3. Now navigate to the instance section of the left sidebar.

- Select the instance.

- Click on "Actions".

- Choose security.

![EC2-dashboard](./img/ec2-dashboard.JPG)

- Click on "Change security group".

![Change-Security-Group](./img/change-SG.JPG)

4. Choose the security group created.

![Select-SG](./img/select-SG.JPG)

- Click on Add security group".

- You can see security group is being added, click on "Save".

**Note -** The security group named "Launch Wizard" you see is the default security group automicatically attached when creating the instance. You can also edit this security group if needed.

![Save-SG](./img/save-sg.JPG)

5. Now it is being successfully attached,

- If you again copy the public IP address,

![Successfully-created-SG](./img/sg-created.JPG)

- And write http://13.62.46.7 in Chrome, we'll be able to see the data of our website.

Currently, let's take a look how our inbound and outbound rules are configured.

This setup allows the HTTP and SSH protocols to access the instance.

![http-test](./img/http-test.JPG)

**Install a web server**

- SSH into your EC2 instance.

'ssh -i "test-server.pem" ubuntu@13.62.46.7'

![SSH-EC2-instance](./img/ssh-ec2.JPG)

- Update packages.

'sudo apt update -y'

![Update](./img/update-apt.JPG)

- Install the web server (apache2).

'sudo apt install -y apache2'

![Apache-installation](./img/apache2-installation.JPG)

- Start the web server.

'sudo systemctl start apache2'

![Start-apache](./img/start-server.JPG)

- Enable web server.

'sudo systemctl enable apache2'

![Enable-server](./img/enable-server.JPG)

- Now, go to the browser and test the public address.

'http://13.62.46.7'

Currently, let's take a look at how our inbound and outbound rules are configured.

This setup allows the HTTP and SSH protocols to access the instance.

![Inbound-Security-Group](./img/sg-inbound.JPG)

The outbound rule permits all traffic to exit the instance.

![Outbound-Security-Group](./img/sg-outbound.JPG)

Through this rule, we're able to access the website.

6. Let's see how removing the outbound rule affects the instance connectivity. Means now, no one can go outside to this instance.

- Go to outbound tab.

- Click on "edit outbound rules".

![Eidt-outbound-rule](./img/edit-outbound-rule.JPG)

- Click on "Delete".

- Click on "Save rules".

![Outbound-setting](./img/outb-edit.JPG)

Now that we have removed the outbound rule, let's take a look at how it appears in the configuration.

![Removed-outbound-rule](./img/no-outbound-rule.JPG)

After making this change, let's test whether we can still access the website.

![Test](./img/test-removed-outbound-rule.JPG)

So, even though we've removed the outbound rule that allows allows all traffic from the instance to the outside world, we can still access the website. According to the logic we discussed, when a user accesses the instance, the outbound rule permits HTTP protocol traffic to enter. However, when the instance sends data to the user's browser to display the website, the outbound rule should preveent it. Yet, we're still able to view the website.

Why mught that be?

Security groups are stateful, which means that they automatically allow retun of traffic initiated by the instance to which they are attached. So, even though we removed the outbound rule, the security group allows the return traffic necessary for displaying the website, hence we can still access it.

Let's explore the scenario;

If we delete both the inbound aand outbound rules, essentially, we are closing all access to and from the instance. This means no traffic can come into the instance, and the instance cannot send any traffic out. So, if we attempt to access the website from the browser or any other client, it will fail because there are no rules permitting traffic to reach the instance. Similarly, the instance won't be able to communicate with any external services or websites because all outbound traffic is also blocked.

7. You will be able to delete the inbound rule in the same way we have deleted the outbound rule.

- Go to the inbound tab.

- Click on edit inbound rule.

![Edit-inbound-rule](./img/edit-inbound-rule.JPG)

- Click on delete.

- Click on "Save rule".

![Inbound-setting](./img/inbound-setting.JPG)

Currently, let's have a look at how our inbound and outbound rules are configured.

![removed-inbound](./img/remove-inbound.JPG)

![Removed=outboung](./img/no-outbound-rule.JPG)

Now, as both the inbound and outbound rules are deleted, there's no way for traffic to enter or leave the instance. This means that any attempt to access the website from a browser or any client will fail because there are no rules permitting traffic to reach the instance. In this state, the instance is essentially isolated from both incoming and outgoing traffic. 

So you can't access the website now.

![Test-without-rule](./img/test-without-rule.JPG)

In the next scenario;

We'll add a rule specifically allowing HTTP traffic in the outbound rules. This change will enable the instance to initiate outgoing connections over HTTP.

8. Click on edit outbound rule in the outbound tab,

![Edit-outbound](./img/edit-outbound-rule.JPG)

- Click on "add rule".

- Choose type.

- Choose destination.

- Choose CIDR.

- Click on "save rule".

![Outbound-setting](./img/outbound-setting.JPG)

![editted-outbound](./img/editted-outbound.JPG)

![Inbound-profile](./img/inbound-profile.JPG)

Now, let's see if we can access the website.

![Test](./img/test-add-inbound.JPG)

So, we are not able to see it.

But if you look here, we are able to go to the outside world from the instance. We are using here.

**Note:** curl is a command-line tool that fetches data from a URL.

As a result, the instance will be able to fetch data from external sources or communcate with other HTTP-based services on the internet. This adjustment ensures that while incoming connections to the instance may still be restricted, the instance itself can actively communicate over HTTP to external services.


Let's come to NACL.

1. First navigate to the search bar and search for VPC.

- Then click on VPC.

![Open-VPC](./img/search-vpc.JPG)

2. Navigate to the Network ACLs in the sidebar.

![NACL](./img/NACL.JPG)

3. Now, provide a name for your Network Access Control List (NACL).

- Choose the VPC you created in the previous session for the practical on VPC creation.

- Then click on "Create network ACL".

![Create-NACL](./img/nacl-setting.JPG)

4. If you selected the Network ACL you created,

- Navigate to the "inbound" tab.

By default, you'll notice that it's denying all traffic fromm all ports.

![Created-NACL](./img/created-nacl.JPG)

Similarly, if you look at the outbound rules, you'll observe that it's denying all outbound traffic on all ports by default.

- Select the NACL.

- And navigate to the "Outbound" tab.

5. To make changes, 

- Select the NACL,

- Go to the "inbound" tab.

- And click on "Edit inbound rules".

![NACL-setting](./img/edit-nacl.JPG)

6. Now. click on "Add new rule".

![Edit-inbound-rule](./img/nacl-inbound.JPG)

7. Now, choose the rule number.

- Specify the type.

- Select the source.

- And determine whether to allow or deny the traffic.

- Then click on "Save changes".

![Set-inbound-rule](./img/set-inbound-nacl-rule.JPG)

Currently, this NACL is not associated with any subnets in the VPC.

![Set-inbound-rule](./img/created-inbound-rule.JPG)

8. Let's associate it.

- Select your NACL.

- Click on "Actions".

- Choose "Edit subnet association".

![Associate-nacl](./img/associate-nacl.JPG)

- Then select your public subnet, as our instance resides in the public subnet.

![Select-subnet](./img/select-subnet.JPG)

Once selected, you'll see it listed under "Selected subnets".

- Finally, click on "Save changes".

You have successfully associated your public subnet to this NACL.

![Associated-subnet](./img/associated-subnet.JPG)

As soon as the NACL is attached to the public subnet, try to access the website again by typing the URL http://13.61.153.88/, you'll notice that you are unable to see the website.

![Test](./img/test-without-rule.JPG)

Although we've permitted all traffic in the inbound rule of the NACL, we're still unable to access the website. This raises the question: why isn't the website visible despite these permissions?

The reason why we are unable to access the website despite permitting inbound traffic in NACL is because NACLs are stateless. They don't automatically allow return of traffic. As a result, we must explicitly configure rules for both inbound and outbound traffic.

Even though the inbound rule allows all traffic into the subnet, the outbound rules are still denying all traffic.

You can see,

![nacl-inbound-setting](./img/nacl-inbound-setting.JPG)

![nacl-setting](./img/nacl-outbound-setting.JPG)

9. If we allow outbound traffic as well,

- Choose the NACL.

- Go to outbound tab.

- Click on "Edit outbound rules".

![Edit-nacl](./img/edit-nacl-outbound-rule.JPG)

- Click on "Add rule".

![Add-new-rule](./img/add-new-rule.JPG)

- Duplicate the process you followed for creating the inbound rules to establish the outbound rules in a similar manner.

![Edit-nacl](./img/edit-nacl-outbound.JPG)

You have successfully created the rules.

![Created-outbound-rule](./img/created-nacl-outbound.JPG)

Upon revisiting the website, even though both the inbound and outbound rule in the NACL allows traffic, it doesn't connect because of no inbound rule in the security group. To allow traffic the inbound rule in security group must be added.

![test](./img/no-access.JPG)

![Final-test](./img/test-add-inbound.JPG)

Now, let's see one more interesting scenario,

**In this Scenario:**

The Security group: Allows inbound traffic for HTTP and SSH protocols and permits all outbound traffic.

Network ACL: Denies all inbound traffic. Let's observe the outcome of this configuration.

**Security Group,**

Configuring it,

![Inbound-dashboard](./img/edit-inboud-dashboard.JPG)

![Test-SG](./img/my-test-sg.JPG)

![Outbound-dashboard](./img/edit-outbound-dashboard.JPG)

![Outbound-dashboard](./img/outbound-dashboard.JPG)

**NACL,**

Let's remove it so by default it denies all traffic.

![Remove-inbound-rule-nacl](./img/edit-nacl-inbound.JPG)

![nacl-dashboard](./img/nacl-outbound-dashboard.JPG)

Additionally, the outbound rule will be removed, defaulting to deny all traffic by default.

![NACL-outbound-edit](./img/nacl-edit.JPG)

![NACL-dashboard](./img/nacl-dashboard.JPG)

Now, let's try to access the website,

![Test](./img/test-nacl.JPG)

So we are unable to access the website. Why? Even if we have allowed inbound traffic for HTTP in security group.

Imagine you're at the entrance of a building, and there's a security guard checking everyone who wants to come in. That security guard is like the NACL. They have a list of rules (like "no backpacks allowed" or "no food or drinks inside"), and they check each person against these rules as they enter.

Once you're inside the building, there's another layer of security at each room's door. These are like the security Groups. Each room has its own rules, like "only employees allowed" or "no pets". These rules are specific to each room, just like Security Groups are specific to each EC2 instance.

### Let's have a look on some scenarios and their outcomes,

- NACL allows all inbound and outbound traffic, Security Group denies all inbound and outbound traffic. 
Outcome: Website access will be blocked because the Security Group denies all traffic, overriding the NACL's allowance.

- NACL denies all inbound and outbound traffic, Security Group allows all inbound and outbound traffic.
Outcome: Website access will be blocked because the NACL denies all traffic, regardless of the Security Group's allowances.

- NACL allows HTTP inbound traffic, outbound traffic is denied, Security Group allows inbound traffic and denies outbound traffic.
Outcome: Website access allowed because Security Group allows HTTP inbound traffic, regardless of the NACL's allowances. However, if the website requires outbound traffic to function properly, it won't work due to the Security Group's denial of outbound traffic.

- NACL allows all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic.
Outcome: Webaite access will be allowed because the Security Group allows RTTP inbound traffic, regardless of the NACL's allowance. However, if the website requires outbound traffic to function properly, it won't work due to Security Group's denial of outbound traffic.

- NACL allows all inbound and outbound traffic, Security Group allows all inbound snd outbound traffic.
Outcome: Website access will be allowed, as both NACL and Security Group allow all traffic.

- NACL denies all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic.
Outcome: Website access will be blocked because NACL denies all traffic, regardless of the Security Group's allowances.