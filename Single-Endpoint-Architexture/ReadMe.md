# Zappy E-Bank's Single Endpoint Architexture for EC2 and S3 Services.

This projected is crafted to deepen understanding of the cloud using Amazon Web Services (AWS), focusing on leveraging EC2 and S3 within a single, streamlined access framework.

Zappy e-bank is all about redefining how financial services are delivered by harnessing the cloud's scalability and flexibility. This project presents scenario that mirrors real-life applications, demonstrating how EC2 and S3 can work in tandem to support a dynamic financial services.

## The Project's Backbone:

### EC2 and S3 Integration for Zappy E-Bank.

For a Fintech company, agility and data security are not just opertaional goals, they are the essence of its competitive edge. Zappy e-bank plans to deploy its application on aws EC2, with S3 buckets serving as the backbone for storage solutions, including customer data, transaction logs, and analytical data. The integration of EC2 is facilitated by a reverse proxy setup, aims to provide a seamless experience for managing and accessing diverse resources under a unified access point.

### EC2 and S3: Pillars of Zappy e-bank's cloud strategy.

EC2: Hosts the core application, enabling scalable computing capacity to meet growing customer demands.

S3: Offers security, scalable object storage for vast amounts of data, ensuring that Zappy e-bank can serve its customers efficiently and reliably.

### Achieving Unified Access: The Role of a Reverse Proxy 

A reverse proxy will be configured on the EC2 instance, directing requests to the appropriate destination. Either to the EC2-hosted application or the S3 bucket, based on the request path. This setup exemplifies a best practice in cloud architexture, providing both operational simplicity and enhanced security.

## Project Goals:

By completion of this project, you'll have;

- Mastered the integration of EC2 and S3 to support a fintech application, balancing compute and storage needs.

- Gained practical experience in setting up a reverse proxy on EC2 to facilitate unified access to both EC2 and S3 resources.

- Learned the significance ofseamless resource integration in building scalable and secure fintech solutions.

- Developed a deeper understanding of AWS's capability to support fintech innovations through hands-on experience with its core services.

## Project Setup:

1. Two Separate Chrome browser profiles.

2. AWS Management Console Access: Using "John" the developer's IAM account, login to AWS Management Console.

3. EC2 Instance setup: Launch an EC2 instance that will host the main application, and associate it with an Elastic IP.

4. S3 bucket configuration: Using "Mary" the Data analyst's IAM account, Create and configure an S3 bucket for storing application data, ensuring proper permissions and web hosting settings are in place.

5. Reverse Proxy Configuration: Install and configure a web server (e.g Nginx) on the EC2 instanceto act as a reverse proxy, routing requests to either the application or S3 bucket based on the URL path.

### Setting up the EC2 instance 

- Login in to the AWS console as John.

![John-Sign](./img/John-login.JPG)

- Launch an ubuntu EC2 instance.

![EC2-Hompegae](./img/EC2-homepage.JPG)

![Launch-EC2](./img/launch-EC2.JPG)

![EC2-Setup](./img/EC2-Setup.JPG)

![Create-Key-Pair](./img/Create-key-pair.JPG)

![Create-Security-Group](./img/Security-Group.JPG)

![Launched-EC2](./img/Launched-EC2.JPG)

![Success](./img/successfully-launch-EC2.JPG)

- Assign a Static IP (Elastic IP): Associate an Elastic IP address with the EC2 instance to ensure it retains the same public IP address across reboots. Recall the earlier inconvenience faced when a static IP address was not utilized for the EC2 instance. Each time the instance was rebooted, it assigns a new public IP address, compelling a frequent updating of the SSH command with the latest IP to maintain access. This does not only disrupt the workflow, but also risk the connectivity issues or security concerns due to constantly changing access points.

1. In the EC2 console navigation, select elastic ip and click on allocate elastic ip in the top right.

![Elastic-IP](./img/Elastic-IP.JPG)

![Allocate-ep](./img/Allocate-EP.JPG)

2. Select the highlighted part of the image below and click on allocate.

![Click-Allocate](./img/Click-allocate.JPG)

![Success](./img/Successfully-allocated.JPG)

4. Select the highlighted part of image below and click on associate elastic ip.

![EC2-EP-Allocation](./img/Allocate-EP-EC2.JPG)

![Associate](./img/Associate.JPG)

![Allocated-EP](./img/EP-EC2-Successful.JPG)

- Creating S3 bucket

1. Log in to the S3 console as Mary.

![S3-Signin](./img/S3-signin.JPG)


2. Create a new bucket and give it a name.

![S3-Homepage](./img/S3-Homepage.JPG)

![Create-bucket](./img/Create-bucket.JPG)

![Name Bucket](./img/Name-bucket.JPG)

![Choose-bucket](./img/choose-bucket.JPG)

![Bucket-Versioning](./img/bucket-versioning.JPG)

![Bucket-encryption](./img/bucket-encryption.JPG)

![Bucket-Access](./img/bucket-access.JPG)

![Launch-Bucket](./img/launch-bucket.JPG)

![Created-bucket](./img/Created-bucket.JPG)

3. Create a new object inside the bucket. You should upload an index.html file containing a simple content;

- On your computer,create an index.html file with the content *Welcome to Amazon S3*

![Create-file](./img/index.JPG)

![Content in file](./img/content-index.JPG)

- Upload the index.html on S3 bucket as shown in the image below;

![S3-Home](./img/S3-Home.JPG)

![Upload-file](./img/Upload-file.JPG)

![Add file](./img/add-file.JPG)

![file-addition](./img/file-addition.JPG)

![Destination](./img/destination.JPG)

![Upload](./img/Upload.JPG)

![Uploaded-file](./img/Successfully-upload.JPG)


### Configuring S3 Bucket for Web Hosting.

- Enable static web hosting: In your S3 bucket settings, enable static web hosting. This makes the bucket content accessible via HTTP.

1. Click on the bucket name.

2.  Click on the properties tab and scroll down.

![bucket-properties](./img/Bucket-properties.JPG)

3. Click on edit as shown in the image below.

![Scroll-down to Static web hosting](./img/Static-web-hosting.JPG)

4. Select the part highlighted in the image below.

![Static web hosting edit](./img/Static-web-hosting-edit.JPG)

![Save Changes](./img/Save-changes.JPG)

5. The web hosting for the bucket has been enabled successfully.

![Static web hosting enabled](./img/Static-web-hosting-success.JPG)

![Static-web-hosting-address](./img/S3-web-hosting-address.JPG)

### Configuring a Web Server as a Reverse Proxy

Now that we have successfully assigned an elastic IP to the instance, let install nginx on it. Nginx is a popular open-source web server, reverse proxy, load balancer, and HTTP cache. It's known for its high performance, simple configuration, and low resource consumption. Originally created to solve the "C10K problem" (handling 10,000 simultaneous connections), Nginx has since gained widespread adoption and is used many large-scale websites and web applications.

- On the EC2 instance, Install Nginx web server.

1. Connect EC2 to local machine via SSH.

'ssh -i "Zappy-e-bank-1.pem" ubuntu@ec2-98-90-104-121.compute-1.amazonaws.com'

![EC2-Connect](./img/EC2-Connect.JPG)

2. Install Nginx.

'sudo apt update -y && sudo apt install nginx -y'

![Nginx](./img/Nginx-installation.JPG)

- Create the web server: Configure the web server to serve S3 app directly and forward requests to the S3 bucket. Follow the steps below to configure Nginx.

1. Create and edit a new file named **mybucket**.

'sudo nano /etc/nginx/sites-available/mybucket'

![mybucket](./img/mybucket.JPG)

2. Paste the configuration code snippet below in the file and replace the higlighted part with the S3 link.


'server {
    listen 80;
    server_name 16.171.196.210;  # Replace with your domain name or public IP

    location / {
        proxy_pass http://zappy-e-bank.s3-website.eu-north-1.amazonaws.com;  # Replace with your actual S3 bucket or backend URL

        proxy_set_header Host zappy-e-bank;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}'



![S3-link](./img/zappy-link.JPG)

3. Save and close file.

**Note:** Make sure to replace with the link above with the link generated after the static web hosting is enabled for the bucket.

- Note that by default, nginx keeps its configuration files in **/etc/nginx/sites-available** but it uses the file in the **/etc/nginx/sites-enabled**. We need to create a symbolic link between sites-available and sites-enabled so that the new configuration file we created for the static website in site-available folder can be used by nginx in site-enabled folder. Run the command below to symbloic link between **sites-available/mybucket** configuration file to **sites-enabled** directory. 

'sudo ln -s /etc/nginx/sites-available/mybucket /etc/nginx/sites-enabled'

![symbolic-link](./img/Symbolic-link.JPG)

Remove the default configuration file in sites-enabled using the command below;

'sudo rm /etc/nginx/sites-enabled/default'

![Remove-sites-enabled-default-config](./img/RM-default-configuration.JPG)

Reload Nginx using the command below;

'sudo systemctl reload nginx'

![Nginx-reload](./img/Nginx-reload.JPG)

4. Make your index.html file public.

- Navigate to the **index.html** file, click on **Actions** and then click on **Make public using ACL**

![Index.html](./img/SL.JPG)

- Select **Make public**

![Make-public](./img/Make-public.JPG)

![S3-make-public](./img/S3-make-public.JPG)


## Testing and Validation

After setting up EC2 instance, configuring S3 bucket, and establishing the reverse proxy, the next critical phase is testing and validation. This step is essential to ensure that the setup works as intended and that both the EC2-hosted application and the S3 bucket content are accessible through the unified access point created.

### Testing Steps:

1. Direct Application Access:

- Access the application hosted on the EC2 instance directly through the Elastic IP to confirm it's running as expected.

- Verify that the application responds to requests and functions correctly without any reverse proxy interference.

'13.220.98.187'

![EC2-Testing](./img/Testing-direct)


2. S3 Bucket Access via Reverse Proxy.

- Attempt to access S3 bucket content by navigating to **'< IP-address >/bucket-name'**.

- Check that the reverse proxy correctly routes the request to the S3 bucket and that the content is served without any issues.

'http://zappy-e-bank.s3-website.eu-north-1.amazonaws.com'


![Testiing-S3-bucket](./img/Testing-S3)

