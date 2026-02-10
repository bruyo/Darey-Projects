# Load Balancer and Auto-scaling Group in AWS

## Project Review 

Today, we're exploring two essential tools in AWS; Load Balancers and Auto-Scaling Group. Imagine Load Balancers as traffic directors, making sure every visitor coming to your website gets where there need to go without any jams. And when the crowd starts pouring in, Auto-Scaling kick into gear, bringing in extra servers to handle the rush. But before we jump in, let's get comfy with some basic cloud networking concepts. 

### What is High Availability?

High availability refers to a system or service that's always up and running, without any significant downtime. It's like having a reliable friend who alway's there when you need them. In tech terms, this means designing systems in a way that minimizes the chances of failure. For example, if one part of a system goes down, there's another backup ready to take over immediately, like a spare tire in a car. High availability ensures that even if something breaks, the overall service remains accessible and reliable for users.

### What is scalability?

Scalability is like being able to handle growth without breaking a sweat. Imagine you have a small bakery, and suddenly, you get a lot more customers than expected. Scalability means you can quickly bake more bread and pastries without the bakery falling apart. In tech, it's similar to setting up your system so that they can handle more and more users or customers without crashing or slowing down. So, whether it's adding more servers to your website during a big sale or making sure your app can handle a sudden surge in downloads, scalability ensures everything runs smoothly.

### Let's understand some terms before going ahead with our protocol.

1. **Server:** It's like a big computer that stores and shares stuff, like websites or apps, with other computers.

2. **Client:** This is your computer or phone, asking the server for stuff, like loading a web page or using an app.

3. **Traffic:** Think of the "busy road" as the network infrastructure, like highways and streets, that connects servers (where websites and apps are hosted) to clients (like your computer or phone). It's where data packets travel back and forth, carrying information between the servers and the clients.

4. **Redundancy:** this is like having backups for important stuff, just in case something breaks. It's like having spare parts for your bike so you can keep riding even if something breaks.

5. **Server Load:** Imagine a server like a superhero carrying heavy bags of data. Server load is like how heavy those bags are. Too many bags can slow the superhero down.

6. **Routing:** Routing refers to the process of determining the best path for data packets to travel from their source (like a server) to their destination (like a client device). It's like finding the most efficient route on a map to reach your destination while avoiding traffic jams and roadblocks. Routing ensures that data packets reach their intended destination quickly and reliably across the network.

### What is Load balancer?

Imagine you have a popular restaurant with only one cashier. As the day goes by, more and more customers start coming in, lining up to place their orders. Eventually, the line gets so long that customers become frustrated, some may even leave without ordering, and the cashier gets overwhelmed trying to handle all the orders.

A load balancer is like adding more cashiers to the restaurant to help manage the increasing number of customers. It's a specialized device or software that evenly distributes incoming network traffic or wokload across multiple servers or resources.

So you can say that a load balancer helps to spread the workload across several servers, ensuring that no single server gets overwhelmed with too much traffic or requests. This not only improves the performance and response time of the system but also increases its reliability and availibility. If one server goes down, the load balancer can redirect traffic to the remaining servers, minimizing downtime and ensuring that the service remains operational.

### Why is a load balancer important, and what could happen if we don't use it?

Imagine your website is like a bustling restaurant, and each visitor is a hungry customer lining up to place an order. Just like how a single cashier would struggle to handle a long line of customers, a single server for your website would struggle to handle too many visitors at once.

That's where the load balancer comes in, it's like hiring extre cashiers for the restaurant. The load balancer helps spread out all those incoming visitors across multiple servers, so no single server gets overwhelmed. This keeps things running smoothly, and visitors don't have to wait forever to to see the website.

Similarly, without a load balancer, the website could slow down or even crash when too many people try to visit it at once. Visitors would get error messages instead of seeing the awesome, and you could end up losing customers and business.

### Types of Load balancer

In AWS, there mainly four types of load balancers:

1. Application Load Balancer.

2. Network Load Balancer.

3. Classic Load Balancer.

4. Gateway Load Balancer.

In this project, we will exclusively focus on the Application load balancer.

### What is an Application Load Balancer?

Imagine you have q website that's getting a lot of visitors. When someone visits the website, their request needs to be sent to one of your website's servers to show them the webpage they want. Now, if you have multiple servers running your website, you need a way to decide which server should handle each request. That's where an Application Load Balancer (ALB) comes in.

Think of an ALB as a traffic cop for the website. He sits infront  of the servers and receives all the incoming requests from users. When a user wants to visit the website, their request goes to the ALB first.

The ALB decides which server should handle each requests by using set of rules that you define. These rules can be based on things like the URL the user wants to visit, the type of request (like HTTP or HTTPS), or even custom conditions you specify.

Once the ALB decides which server should handle the request, it sends the request to that server. This helps distribute the incoming traffic evenly among all your servers, so no single server gets overloaded.

But the ALBs don't just send requests to servers blindly. They monitor the health of the servers. If a server goes down or become unhealthy for some reason, the ALB stops sending requests to that server until it's back up and run properly. This helps ensure that the website stays reliable and available even if one of your servers has issues.

An application load balancer (ALB) works at layer 7 of the OSI model, which is the application layer. This is what makes it different from other load balancers. Because it works at Layer 7, the ALB can make smart decisions based on the actual content of the web traffic. For example, if a request comes in for **www.aws.com/login**, the ALB can send it to a server that handles login requests. If another request comes in for **"www.aws.com/ec2"**, it can route that to a different server that deals with the ec2 section. This ability to understand and manage different types of traffic helps improve how well your applications run.

So, in simple terms, an ALB is like a traffic cop for your website, directing incoming requests to the right servers based on predefined rules, making sure everything runs smoothly and efficiently.

**Note:** The OSI model is a framework used to understand how different network protocols interact. It has seven layers: Physical, Data link, Network, Transport, Session, Presentation, and Application. each layer has a specific role, like how data is transmitted, routed, and presented to users. The Application Load Balancer (ALB) operates at the Application layer (Layer 7), allowing it to make decisions based on the content of the data.

### Let's take a look at a few terms that will help you grasp Auto Scaling Groups easily.

**Scaling:** Scaling refers to adjusting the size of something to meet changing needs. In the context of technology, like with websites or apps, scaling means adding more resources, like servers, when there's lots of demand, and removing them when demand goes down. It's like having more waiters in a restaurant during busy times and fewer when it's quiet, so customers don't have to wait to long to be served.

**Scaling out:** When things get busy, scaling out means adding more helpers to handle the work. It's like calling in extra staff at  a restaurant when there's a rush of customers. This helps keep things running smoothly and prevents long waits. So scaling out refers to increasing the number of instances in response to increased demand or workload.

**Scaling in:** On quieter days, scaling in means sending some of the extra helpers home. It's like letting staff go home early when the restaurant isn't as busy. This saves money and makes sure you're not paying for more help than you need. So scaling in refers to decreasing the number of instance when the demand or workload decreases.

**Auto Scaling:** Auto Scaling means automatically adjusting the number of servers or resources based on demands or workload. It's like having a smart system that adds more waiters to a restaurant when it gets busy and sends them home when it's quiet, without needing some to do it manually. This helps ensure that the websites or apps can handle varying levels of traffic efficiently and cost-effectively.

### What is Auto Scaling Group in AWS?

Think of Auto Scaling Group in AWS  like a team of workers ready to help out when thing get busy. You tell AWS how many workers you will need at different times, and automatically adds or removes them based on how much work there is. So, if the website suddenly gets a lot of visitors, AWS will quickly add more servers to handle traffic. And when things calm down, it'll send some servers home to save money. It's like having a flexible workforce that grows and shrinks with the needs, ensuring your website stays up and running smoothly with minimal effort on your part.

## Task

1. Setting up the Application Load Balancer.

2. Configuring the Auto Scaling Group.


### Setting up the Application Load Balancer

- Create Ec2 instances. Attach the VPC and also to a public subnet previously created.

![Created-Instances](./img/created-instances.JPG)

And these instances contain some website having the below content,

'vim index.html'



![Instance1-content](./img/instance1-content.JPG)

![Network-details](./img/instance2-network-details.JPG)

![Instance2-content](./img/instance2-content.JPG)

![Network-details](./img/instance1-network-details.JPG)

![Instance3-content](./img/instance3-content.JPG)

![Network-details](./img/instance3-network-details.JPG)

In a real-world scenario, all targets would typically have some data. But here we've added different data to each of the three target instances to show how the load balancer connects to all of them.

### Creating Target Groups.

1. First, navigate to the AWS console.

- Then, locate the EC2 service by using the search function.

- Then click on "EC2".

![EC2-Search](./img/EC2-Search.JPG)

2. Now, scroll down until you locate the target groups, click on it.

- Then select the option to create a new target group.

![Target-group](./img/target-group.JPG)

3. Choose instances as a target type.

![TG-Setting](./img/TG-setting.JPG)

4. Now, provide a name for your target group.

- Set the protocol to HTTP.

- Choose port number as 80.

- Select "IPV4" as the IP address type.

- Next, select the VPC that you've (previously created) in your projects from the available options.

![Setting](./img/target-group-setting.JPG)

![Setting](./img/setting-TG.JPG)

- Keep all settings at their default values and proceed by clicking on the "Next" button.

![Setting](./img/health-checks.JPG)

![Setting](./img/create-TG.JPG)

5. Now, choose the instances that you've created to serve as targets for the application load balancer.

![Register-target](./img/addition-of-instance.JPG)

- Now, click on "include as pending below".

- Now, click on "create target group".

![Include-as-pending](./img/include-as-pending.JPG)

![Remove-pending](./img/remove-pending.JPG)

Your target group is being successfully created,

![Create-TG](./img/create-target-group.JPG)

![Created-TG](./img/created-TG.JPG)

### Creating Load Balancer

1. On EC2 page, scroll down until you locate the Load Balancer service. Click on it, 

- Then select the option to create a new load balancer.

![Create-load-balancer](./img/LB.JPG)

2. After selecting to create a new load balancer, proceed by choosing the "Create" option specifically for Application Load Balancer.

![Choose-ALB](./img/choose-lb.JPG)

3. Enter the name for your load balancer, ensuring it reflects its purpose clearly.

- Then, select "internet-facing" as the scheme.

- Choose "IPV4" as IP address type.

![ALB-Setting](./img/alb-setting.JPG)

- Select the VPC you created in previous project.

![Network-setup](./imgnetwork-setting.JPG)

- Select the AZ and choose the public subnet there.

As in our previous VPC project, we have created only one public subnet but here while creating load balancer, we need at least two public subnets in different Availability Zones (AZ's), so now you are aware of how to create subnet and how to do subnet association for route table, so first do that part by clicking on the tab where you currently are and open a duplicate tab and then on that duplicate tab, first create subnet and attach the route table with that subnet in which we have provided the way how to connect to internet gateway, and then process with this load balancer part on the previous tab.

*Note:** Your subnet will not be considered as public subnet until you associate the route table which we have given the path for internet gateway so make  sure to do so that part.

### Create a second public subnet

- Go to your aws dashboard, search for VPC and click on it.

![VPC-dashboard](./img/vpc-dashboard.JPG)

- On the right sidebar, click on subnet.

- Click on "create subnet".

![VPC-homepage](./img/vpc-homepage.JPG)

- Select your VPC, input your subnet details and click on create subnet.

![Select-VPC](./img/select-vpc.JPG)

![Create-Subnet](./img/create-subnet.JPG)

- Associate the public subnet to a route table.

![public-subnet](./img/public-subnet.JPG)

![associate-subnet](./img/associate-subnet.JPG)

![Created-public-subnet-2](./img/created-public-subnet-2.JPG)

![Networking-mapping](./img/network-mapping.JPG)

- For now, we can use the default security group.

![Security-group](./img/security-group.JPG)

- Here select the Traget group created.

![Add-target-group](./img/add-target-group.JPG)

- Now, leave everything as it is and click on create load balancer.

![Create-load-balancer](./img/create-LB.JPG)

Your application load balancer has been successfully created.

![Launched-LB](./img/successfully-created-lb.JPG)

After creating the ALB (Application Load Balancer), go to target groups section and check the health of your instances.

![Target-Group-Health](./img/TG-health.JPG)

**Note:** If you notice that all instances are marked as unhealthy or if any individual instance is deemed unhealthy, it's essential to first verify connectivity. You can do this by attempting to ping the instances to confirm network reachability.

To troubleshoot, follow these steps:

1. Search for "Command Prompt" on your laptop.

![cmd](./img/cmd.JPG)

2. Copy the public IP addresses of the instances.

![Instance3](./img/instance3.JPG)

3. Open Command Prompt and type:

'ping <Public IP of instance>'

![Ping-instances](./img/ping-instance.JPG)

It appears that we're currently unable to establish a connection to the instance using its public IP address. If you're able to successfully connect to the instance via their public IP addresses, it confirms that there's connectivity to them. In that case, if the instances are still marked as unhealthy in the load balancer, you may need to investigate further to determine the root cause of the issue.

Things to look out for:

**Security Group Configuration:** Make sure that the security groups associated with the instances allow inbound traffic from the application load balancer (ALB) on the necessary ports. Check that the security groups rules are correctly configured to allow traffic from the ALB's security group.

**Network ACL Configuration:** If a network acl (NACL) is attached to the subnet where the target instances are running, review the inbound and outbound traffic rules of the NACL. Ensure that the NACL is not blocking traffic from the ALB or from the internet to the instance.

**Web Server Configuration:** Verify that the web server is configured correctly on the instances. Check that the web is listening on the correct port and is serving the correct content. Ensure that there are no misconfigurations or errors in web server configuration files.

**Firewall Rules:** Check if there are any firewall rules or ip tables rules on the instances that may be blocking incoming traffic. Review the firewall settings to ensure that they allow traffic from the ALB and from the internet.

**Health Check Configuration:** Review the health check settings for the target group. Ensure that the health check path and protocol are configured correctly to match te configuration of the web server. Check that the health check endpoint is accessible and returning the expected response.

**Instance status:** Verify the status of the instances in the EC2 dashboard. Ensure that the instances are running and reachable within the VPC. if there are any issues with the instances themselves, troubleshoot and resolve them accordingly.

If you're seeing this type of output, it indicates that the connectivity has been established.

![Connectivity](./img/ping-inst.JPG)

Currently, our actual output indicates that all our instances are healthy.

**Note:** Ensure that each instance have a webserver for this we used Apache so that it can connect via HTTP on the browser.

'curl -I http://localhost/health'

![Health-Status](./img/health-status.JPG)

Now, 

4. From the Load balancer page, copy the DNS of the load balancer.

![DNS-name](./img/dns-name.JPG)

5. Paste it into the new tab within the chrome browser

'my-first-applicalition-lb-704617079.eu-north-1.elb.amazonaws.com'

Here, you'll observe that the load balancer is evvenly distributing the workload across all the three instances.

![ALB-test](./img/alb-check.JPG)

### Creating Auto Scaling Group.

1. Go to the search bar on the AWS console and search for "Auto Scaling Group". You'll find it there 

- Click on it.

![Search-AS](./img/auto-scaling.JPG)

Alternatively, you can scroll down on the EC2 page and navigate to the Auto Scaling Group in the Auto Scaling section. Once there, click on the "Auto Scaling Groups" link to proceed.

2. Click on "Create auto scaling group".

![Create-AS](./img/create-AS.JPG)

3. Click on "create a launch template".

![Create-template](./img/create-template.JPG)

Now, you'll be navigated to the new tab where you will have to launch a template.

4. Choose a name for the launch template.

- In the "Quick Start" section of the AWS management console, select the "Amazon Linux AMI" option.

![Choose-name](./img/group-name.JPG)

This will provide you with a pre-configured Amazon Machine Image (AMI) for launching instances based on Amazon Linux operating system.

- Choose the instance type as "t2 micro".

![Setting](./img/setting-asg.JPG)

- Now, choose the "Create new key pair" option in the key pair section.

![Setting](./img/ami-setting.JPG)

- Provide a name for the key pair.

- Click on "Create key pair".

![Create-key-pair](./img/key-pair.JPG)

![Created-keypair](./img/create-keypair.JPG)

You've successfully created and added the key pair to the launch template.

- If the network settings, select the public subnet that you created previously for launching the instance.

- When configuring the security groups, you have two options: you can either use a pre-existing security group or create a new one.

**Note:** Ensure that the security group being used allows inbound and outbound traffic for all types of traffic for the CIDR 0.0.0.0/0. 

- Now, click on "Advanced Newtwork Congiguration".

![Setting](./img/asg-network-setup.JPG)

- Select the "Enable" option for auto-assigning public IP addresses.

- And choose the security group that has an inbound and outbound rule allowing all traffic.

![Advanced-setting](./img/advanced-setting.JPG)

![Setup](./img/advanced-setup.JPG)

- Now go to Advanced settings.

![Advanced-details](./img/advanced-details.JPG)

- In the user data section, include the following code.

![Input-data](./img/input-data.JPG)

'#!/bin/bash
yum update -y
yum install -y httpd
service httpd start
chkconfig httpd on
echo "<html><body><h1>Welcome to My Website!</h1><p>This content is served by an EC2 instance launched by an Auto Scaling Group.</p></body></html>" > /var/www/html/index.html'

**Explanation of the user data script:**

**#!/bin/bash:** This line specifies that the script should be executed using the Bash shell.

**yum update -y:** Updates the package repository and installs any available updates.

**yum install -y httpd:** Installs the Apache web server (HTTPD) package.

**service httpd start:** Starts the Apache web server.

**chkconfig httpd on:** Configures Apache to start automatically upon instance boot.

- chkconfig: This command manages which services start automatically at different runlevels.

- httpd: This refers to the Apache HTTP server service.

- on: This option enables the service to start at boot time.

**echo"">/var/www/html/index.html:** Creates a basic HTML file with a welcome message and saves it as index.html in the default web root directory (/var/www/html).

- Now, click on "Create launch template".

![Create-template](./img/launch-asg.JPG)

You have successfully created a launch template.

Now, return to the previous tab containing the Auto Scaling Group settings.

![succussfully-created](./img/created-template.JPG)

**Note:** You have to remove subnet and availability zone when setting up to create launch template, this is because aws blocks creation but can be defined later in the Auto Scaling Group.

![Launched-Template](./img/launch-template.JPG)

5. Now, provide a name for the Auto Scaling Group.

- Select the launch template that was created earlier.

![ASG-setting](./img/asg-setting.JPG)

6. Now click on "Next".

![Click-next](./img/next-click.JPG)

7. Choose the required instances attributes.

![Instance-attributes](./img/asg.JPG)

8. Select the VPC that was previously created.

- Select the availability zones.

- Click on "Next".

![VPC-setup](./img/vpc-setup.JPG)

9. Now, choose the option to "Attach to a new load balancer".

![Load-balancer](./img/lb-setting.JPG)

- Select the load balancer type as "Application Load Balancer".

- Provide a name for the load balancer.

- Choose "internet-facing" for the load balancer scheme. Ensure to review the VPC ID before proceeding.

- Please select public subnets for both availability zone.

![Load-balancer-setting](./img/load-balancer.JPG)

**Note:** 

**Region:** Think of a region as a big area, like a country or state, where cloud services are available. Each region has multiple data centers, and they're located in differents parts of the wrold. For example, there might be a region in the United States, another in Europe, and so on.

**Availability Zone (AZ):** Within each region, there are separate buildings or facilities called availability zones. You can think of these as neighborhoods within region. Each availability zone is isolated from the others, so if something goes wrong in one zone, it doesn't affect the others. This adds an extra layer of resilience and reliability to the cloud infrastructure.

- In the default routing configuration, you have the option to create a new target group.

![Target-group-setting](./img/target-gs.JPG)

- Provide a name for the target group.

![Name-TG](./img/name-tg.JPG)

- Now, click on "Next".

![Next](./img/click-next.JPG)

10. In this section, you can specify your desired capacity for instances created by the Auto Scaling Group.

![Group-size](./img/group-size.JPG)

- Also, specify the minimum and maximum capacity as per the requirements.

![Scaling-size](./img/scaling-size.JPG)

**Note:**

**Desired Cappacity:** This is like deciding how many chairs you want to set up for a party before your guests arrive. It's the number of instances you want the Auto Scaling Group (ASG) to maintain at all times, based on the expected workload.

**Minimum Capacity:** Think of this as the lowest number of chairs you absolutely need to have available no matter the circumstances. It's the minimum number of instances the the ASG will always keep running, even if there's very little traffic or workload.

**Maximum Capacity:** This is like setting a limit on how many chairs you can have at the party, even if more people show up unexpectedly. It's the maximum number of instances that the ASG can scale up to in response to increased traffic or workload.

So, in simpler terms, the desired capacity is what you aim for, the minimum capacity is the lowest you will accept, and the maximum capacity is the most you're willing to have, even if things get busy.

- Now, proceed by clicking on "Next".

![Create-asg](./img/create-asg.JPG)

11. Click on "Next" once more to proceed further.

![Click-next](./img/add-next.JPG)

12. You can add tags by clicking on "Add Tags".

![add-tags](./img/add-tags.JPG)

- Choose the desired key and value for the tag.

- Then proceed by clicking on "Next".

![Add-key-and-value](./img/key-value.JPG)

13. Review the settings you have configured for the Auto Scaling Group, and once you're satisfied, click on "Create Auto Scaling Group".

![Create-ASG](./img/create-auto-scaling-group.JPG)

Your auto scaling group is being configured successfully.

![Auto-Scaling-Group](./img/new-asg.JPG)

14. Click on "new-asg".

15. Navigate to the "Instance Management" section.

![Instance](./img/instance-management.JPG)

Here, you'll observe that the Auto Scaling Group has successfully created instances according to the desired capacity you specified, which in this case is 2. 

16. If  you navigate to the Load balancer section in EC2 page, you'll notice that our load balancer has been created also.

![Load-balancer](./img/asg-lb.JPG)

**Note:** In case if doesn't appear immediately, try refreshing the page by clicking on the top square-shaped icon. Click on it.

The two instances were created by the ASG. Since the desired capacity was set to 2, the ASG instantiated two instances accordingly. Regarding scaling, the ASG is configured to scale in until there are no instance remaining. It wont decrease the count below this threshold. Similarly, it can scale out to a maximum of four instances based on the load. However, it won't exceed this limit. Now if you want to see the website, you can again use the Load balancer DNS.

![DNS](./img/copy-dns.JPG)

![Test](./img/test.JPG)

Let's observe the behaviour when one of the instance created by the ASG is deleted.

![Behaviour](./img/new-instance.JPG)

The Auto Scaling Group will automatically launch a new instance to maintain the desired state. This demonstrates the dynamic nature of ASG, which adjusts the number of instances based on the configured capacity settings.