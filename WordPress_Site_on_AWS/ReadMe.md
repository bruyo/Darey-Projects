# WordPress Site on AWS

## Project Review

A small to medium-sized digital marketing agency, **"DigitalBoost"**, wants to enhance its online presence by creating a high-performance **WordPress-based** website for their clients. The agency needs a scalable, secure, and cost-effective solution that can handle increasing traffic and seamlessly integrate with their existing infrastructure. Your task as an AWS Solutions Architect is to design and implement a WordPress solution using various AWS services, such as Networking, Compute, Object Storage, and Databases.

### Task

### VPC Setup

- Navigate to search bar and type VPC. Then click on VPC.

![AWS-sdashboard](./img/aws-console.JPG)

- Click on "Create vpc".

![VPC](./img/create-vpc.JPG)

- Setup the VPC by filling in the details such name, IPv4 CIDR etc.

![Setting](./img/vpc-setting.JPG)

![Create-vpc](./img/vpc-creation.JPG)

![Created-vpc](./img/created-vpc.JPG)

### Setup the Public and Private Subnet with a NAT Gateway.

- Navigate to the leftside bar and click on subnet section. Click on "Create subnet".

![Subnet](./img/subnet.JPG)

- Select the VPC.

![Select-vpc](./img/select-vpc.JPG)

- Setup both the private and public subnet.

![Private](./img/private-subnet.JPG)

![Public](./img/public-subnet.JPG)

![Click-create](./img/create-subnet.JPG)

![Created-subnet](./img/created-subnets.JPG)

- Create a route table. Click on route table on the leftside bar and click on "Create route table".

![route-table](./img/route-table.JPG)

- Name your route table and select the VPC. Then click "create route table".

![create-RT](./img/click-create-rt.JPG)

- Associate route table to subnet by clicking on "Edit subnet association".

![Edit-subnet-association](./img/associate-subnet.JPG)

- Select subnets and click on "Save association".

![Save-association](./img/subnet-association.JPG)

![route-table](./img/rt.JPG)

- Create NAT gateway and attach to the private subnet by clicking on NAT gateway on the leftside bar. 

![NAT-gateway](./img/nat-gateway.JPG)

- Choose the name of the NAT gateway and select zonal to choose the private subnet.

![Nat-gateway](./img/private-nat.JPG)

- Click on "Create nat gateway".

![Create-NAT](./img/create-nat.JPG)

![Created-NAT](./img/nat-created.JPG)

- Create an internet gateway by clicking on it on the leftside bar. Click on "Create internet gateway".

![Internet-gateway](./img/internet-gateway.JPG)

- Choose the name of the Internet gateway and click on "Create internet gateway".

![Create-igw](./img/create-igw.JPG)

- Attach igw to VPC.

![Attach-igw](./img/created-igw.JPG)

![Attached-igw](./img/attach-igw.JPG)

- Edit the route on the route table to control traffic.

![edit-route](./img/edit-route.JPG)

- Click on add route.

![add-route](./img/add-route.JPG)

- Select 0.0.0.0/0 which for the internet and also select the created igw.

![Added-route](./img/added-route.JPG)

- Click on the private subnet route table and click on "Edit route".

![private-rt](./img/nat-rt.JPG)

![private-rt](./img/edit-private-rt.JPG)
![Add-route](./img/route-nat.JPG)

### AWS MySQL RDS Setup

- Search for RDS on the search bar and click on it.

![RDS-search](./img/rds.JPG)

- Click on database on the leftside bar and click on "Create database".

![Database](./img/database.JPG)

- Choose "full configuration" as the database creation method and click MySQL as the engine option.

![RDS-setup](./img/mysql.JPG)

- Select the latest engine version and select a free tier template.

![Version](./img/engine-version.JPG)

- Choose the DB instance name.

![instance-name](./img/db-name.JPG)

- Choose the master name and password. Select self-managed.

![Master](./img/master-credentials.JPG)

- On the instance type select "db.t3.micro".

![instance-type](./img/instance-type.JPG)

- On the connectivity, select the VPC created. Allow public access by clicking on it.

![connectivity](./img/connectivity.JPG)

- Create a security group that allows inbound traffic with port 3306. Click on security group on the EC2 leftside bar.

![Security-group](./img/security-group.JPG)

![Settings](./img/sg-setup.JPG)

![Create-SG](./img/create-sg.JPG)

- Select the existing security group and availability zone.

![Select](./img/select-sg.JPG)

- Leave the rest configuration in default and click on "create database"

![Create-DB](./img/create-DB.JPG)

- Create another public subnet in another availability zone.

![create-PS](./img/new-public-subnet.JPG)

![Public-subnet-2](./img/ps-2.JPG)

- Associate route table to public subnet.

![Associate-rt](./img/associate-route.JPG)

![save-association](./img/associate-rt.JPG)

![created-db](./img/successfully-created-db.JPG)

You have successfully created the Amazon RDs.

**Note:** You need two availability zones to create the database which is why we created the second public subnet.

- Connect the WordPress instance to the RDS.

- Create the WordPress Instance. Go to Instance on the EC2 leftside bar and click on it.

![Ec2](./img/ec2.JPG)

- Click on "Launch instance" and setup the instance.

- Choose the name of the VM and instance engine.

![Setting](./img/wordpress-ec2.JPG)

- Click on create keypair.

![Keypair](./img/keypair.JPG)

![create-keypair](./img/create-keypair.JPG)

- Select the VPC and Security group created.

![Network-setting](./img/sg-vpc.JPG)

- Click on "Launch instance"

![launch-instance](./img/click-launch.JPG)

![WordPress](./img/ec2-wordpress.JPG)

- Install the MySQL server.

'sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm'

![Configuration](./img/mysql-conf.JPG)

'sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm'

![Community-release](./img/community-release.JPG)

![Community-release](./img/comm.JPG)

'sudo rpm --import https://repo.mysql.com//RPM-GPG-KEY-mysql-2022'

![Repo](./img/repo.mysql.JPG)

'sudo yum install mysql-community-server'

![Install](./img/install-mysql.JPG)

![Install](./img/installed-mysql.JPG)

'sudo systemctl start mysqld.service' 

![Start](./img/start-mysql.JPG)

'systemctl enable mysqld.service' 

![Enable](./img/enable-mysql.JPG)

'systemctl status mysqld.service'

![Status](./img/status-mysql.JPG)

'mysql -h wordpress-rds-database.ckd4oq4ey3gn.us-east-1.rds.amazonaws.com -P 3306 -u admin -ptest_2026'

![Connection-btwn-rds-wordpress](./img/rds-wordpress.JPG)

'SHOW DATABASES;'

![Show-DB](./img/show-DB.JPG)

### EFS Setup for WordPress Files

- Navigate to the aws console search bar and search for EFS. Click on it.

![EFS](./img/efs.JPG)

- Click on "Create file system".

![Create-EFS](./img/efs-dashboard.JPG)

- Click on "customize".

![Customize](./img/customize.JPG)

- Choose the name and select same VPC as the WordPress instance. Click "next"

![Setting](./img/setting-efs.JPG)

![Setting](./img/efs-setting.JPG)

- Select the VPC previously created.

![VPC](./img/network-efs.JPG)

- Click on next.

![Policy-efs](./img/policy-efs.JPG)

- Review and click "create".

![Create-efs](./img/create-efs.JPG)

- Add NFS with port 2049 to the EFS security group.

![Security-Group](./img/efs-sg.JPG)

- Install EFS utilities on WordPress EC2.

'sudo yum update -y'

![Update](./img/update-yum.JPG)

'sudo yum install -y amazon-efs-utils'

![Install-efs](./img/install-efs.JPG)

'sudo mkdir -p /mnt/efs'

![Mount](./img/mount-efs.JPG)

- Copy the efs dns name and edit in the code below.

![efs-dns-name](./img/dns-efs.JPG)

'sudo mount -t efs fs-093dd6384b5d92f2d.efs.us-east-1.amazonaws.com:/ /mnt/efs'

![mounted-efs](./img/mounted-efs.JPG)

- Test the mounted efs file system.

'df -h | grep efs'

![Test](./img/test.JPG)

- Make the mount persistent.

'sudo nano /etc/fstab'

- Copy in the text and paste in text editor.

fs-093dd6384b5d92f2d.efs.us-east-1.amazonaws.com:/  /mnt/efs  efs  _netdev,tls  0  0

![Type](./img/edit-efs-file.JPG)

**fs-xxxxxxxx:/:**	Your EFS file system ID (replace xxxxxxxx with the real ID).

**/mnt/efs:**	Local mount point on the EC2 instance.

**efs:**	File system type (Amazon EFS driver).

**_netdev,tls:**	Options:

- _netdev: mount only after network is ready.

- tls: encrypt traffic in transit.

**0:**	Dump (not used, keep 0)

**0:**	FSCK order (do not check, keep 0)

- Test it.

'sudo mount -a'

![Test](./img/test-mount.JPG)

'df -h | grep efs'

![Test](./img/test-.JPG)

### Configure WordPress to use the shared file system.

1. Install WordPress directly onto EFS.

'cd /mnt/efs'

![mnt](./img/mnt-efs.JPG)

'sudo wget https://wordpress.org/latest.tar.gz'

'tar -xvzf latest.tar.gz'

![Tar](./img/tar.JPG)

'sudo tar -xvzf latest.tar.gz'

![Move-tar](./img/mv-tar.JPG)

'sudo rm latest.tar.gz'

![Remove](./img/rm-.JPG)

'sudo mv wordpress/* .'

![Wordpress](./img/wordp.JPG)

'sudo rmdir wordpress'

![rmdir](./img/rmdir.JPG)


2. Move the wp-content.

'sudo rm -rf /var/www/html'

![Wp-content](./img/wp-content.JPG)

- Create the parent directory.

'sudo mkdir -p /var/www/html'

![var](./img/var.JPG)

- Remove any placeholder index file.

'sudo rm -f /var/www/html/index.html'

![rm](./img/rm-var.JPG)

- Create the symlink from EFS.

'sudo ln -s /mnt/efs /var/www/html'

![symlink-from-EFS](./img/symlink-EFS.JPG)

3. Fix permissions.

- Install apache (httpd) web server.

'sudo yum update -y'

'sudo yum install -y httpd'

![httpd](./img/apache.JPG)

- Enable Apache.

'sudo systemctl enable httpd'

![Enable](./img/start-apache.JPG)

- Start Apache

'sudo systemctl start httpd'

![Start](./img/enable-apache.JPG)

'sudo chown -R apache:apache /mnt/efs'

![Permission](./img/permission-apache.JPG)

'sudo chmod -R 755 /mnt/efs'

![Permission](./img/chmod-apache.JPG)

- Restart Apache.

'sudo systemctl restart httpd'

![restart](./img/restart-apache.JPG)

### Create an Application Load Balancer

- Go to the EC2 instance, on the leftside bar click on "load balancers" section. Click on "Create load balancer".

![Load-balancer](./img/lb.JPG)

- Select Application Load Balancer by clicking on "Create" icon underneath.

![Create](./img/create-lb.JPG)

- Choose the VPC and availability zone.

![Network](./img/lb-setting.JPG)

- Choose the security group.

![Security-Group](./img/sg-lb.JPG)

- On the listening setting, set it to HTTP protocol with port 80 and then create a target group for the EC2 instance.

![Target-group](./img/tg.JPG)

![Tg-setting](./img/tg-setting.JPG)

![VPC](./img/tg-vpc.JPG)

![Next](./img/next-tg.JPG)

![Create-TG](./img/create-tg.JPG)

![launch-tg](./img/launch-tg.JPG)

![launched-tg](./img/launched-tg.JPG)

![Select-tg](./img/select-tg.JPG)

- Leave the remaining in default setting and click on "Create load balancer".

![Launch-Load-Balancer](./img/launch-lb.JPG)

![Successfully-launched](./img/launched-lb.JPG)

![wordpress-lb](./img/wordpress-lb.JPG)

### Create an Auto Scaling Group

- Go to the EC2 instance, on the leftside bar click on "Auto Scaling Groups" section. Click on "Create Auto Scaling group".

![ASG-dashboard](./img/asg.JPG)

- Choose the ASG name and click on "create a launch template".

![ASG-dashboard](./img/asg-setting.JPG)

![Template-setting](./img/lt.JPG)

![Setting](./img/lt-setting.JPG)

![Instance-type](./img/instance-lt.JPG)

![Keypair](./img/keypair-lt.JPG)

![Network](./img/network-lt.JPG)

**Note:** At the launch template, you do not set the VPC and availability on the network setting than just your security group.

- Copy the text below and paste it on the advanced settings.

'#!/bin/bash
set -xe

yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Welcome to My Website!</h1>
    <p>This content is served by an EC2 instance launched by an Auto Scaling Group.</p>
    <p>Hostname: $(hostname)</p>
  </body>
</html>
EOF'

![launch-lt](./img/create-lt.JPG)

![Successfully-launched](./img/launched-lt.JPG)

![Launch-template](./img/wordpress-lt.JPG)

- Select the launch template created and click on "next".

![ASG-lt](./img/asg-lt.JPG)

- Now, you can select the VPC and availability zones.

![Network](./img/asg-network.JPG)

- Select the existing load balancer and target group created.

![LB](./img/lb-tg.JPG)

- Leave the rest in default setting and click on "next".

![Next](./img/health-check.JPG)

- Choose the group and scaling size.

![Size-setting](./img/group-size.JPG)

- Set the scaling policy to match the cpu utilization.

![Scale](./img/scale.JPG)

- Leave the rest on default setting and click on "next".

![Next](./img/click-next.JPG)

- Click on "next"

![tag](./img/tag.JPG)

- Add tag name and value, then click on next.

![name](./img/tag-name.JPG)

- Review and click on "Create auto scaling group".

![Review](./img/review.JPG)

![success](./img/success.JPG)

You have successfuly created your ASG and ready to scale instance to desired capacity.

![Wordpress-asg](./img/asg-wordpress.JPG)

- Test on the browser by copying and pasting load balancer dns name or the public IP address of the EC2 instance.

'http://52.71.162.19/'

![Test](./img/test--.JPG)

'wordpress-lb-1295440587.us-east-1.elb.amazonaws.com'

**Note:** For it to access the internet, allow the HTTP protocol on the inbound rule of the security group. Also set the NACL to give access to both inbound and outbound rule.