# Setting up secure authentication to AWS API

## Project Review

In this project, we will be jsetting up a secure authentication to AWS API. An Application Programming Interface (API) is a set of protocols and tools that allows different software applications to communicate with each other. In the context of AWS, the AWS API enables the scripts or the AWS CLI to interact with AWS services programmatically. This means you can create, modify. and delete AWS resources by making API calls, which are just structured  requests that the AWS platform can understand and act upon.

### What is AWS CLI? 

AWS CLI (Command Line Interface) is a command-line tool that lets you interact with AWS services by typing commands instead of using the AWS Management Console.

### What is AWS API?

AWS API (Application Programming Interface) is the backend interface that allows software applications to communicate directly with AWS services.

### Task

1. Setup IAM (role, user, policy etc)

- Create an IAM role. Go to the aws management console and search for IAm on the search bar.

![AWS-dashboard](./img/iam.JPG)

- On the leftside bar of the IAM dashboard click on roles. Then click on "Create role"

![Role](./img/iam-role.JPG)

![Use-case](./img/use-case.JPG)

![click-next](./img/next.JPG)

![Next](./img/click-next.JPG)

![name](./img/role-name.JPG)

![Create-role](./img/create-role.JPG)

- On the leftside bar of the IAM dashboard click on policies. Then click on "Create policy"

![Policy](./img/iam-policy.JPG)

![EC2](./img/ec2-policy.JPG)

![Resources](./img/res.JPG)

![Add-permission](./img/add-permission.JPG)

![S3](./img/s3-policy.JPG)

![Resources](./img/res.JPG)

![Click-next](./img/click.JPG)

![Policy-name](./img/admin-policy.JPG)

![Create](./img/create-policy.JPG)

-  On the leftside bar of the IAM dashboard click on user. Then click on "Create user"

![IAM-user](./img/admin.JPG)

![user-name](./img/user.JPG)

![attach](./img/attach-policy.JPG)

![nxt](./img/next-click.JPG)

![Create](./img/review-user.JPG)

- Create programmatic access credentials.

![Access-key](./img/access-key.JPG)

![cli](./img/cli.JPG)

![tag](./img/tag.JPG)

![key](./img/key.JPG)

2. Installing and configuring the AWS CLI.

- Download the AWS CLI version 2 installation file for Linux.

'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'

![AWS](./img/aws-cli.JPG)

- Unzip the installer.

'unzip awscliv2.zip'

![unzip-asw-cli](./img/unzip-cli.JPG)

- Run the installer.

'sudo ./aws/install'

- To ensure that aws cli is installed type the code below.

'aws --version'

![Version](./img/aws-version.JPG)

- Configuring AWS CLI for access to AWS. On the linux terminal enter;

'aws configure'

![Configuration](./img/config-aws-cli.JPG)

3. Testing the configuration.

- To verify communication between the AWS CLI and AWS services. 

'aws ec2 describe-regions --output table'

![Verify](./img/check.JPG)

Now you are ready to develop scripts.

