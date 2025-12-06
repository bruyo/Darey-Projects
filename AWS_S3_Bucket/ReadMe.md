# AWS S3 Mini Porject

## Project Review

The primary goal of this project is to farmiliarize individuals with Amazon S3 (Simple Storage Service) and its fundamental concepts. This entails how to create and manage S3 buckets, upload objects, enable versioning, set permissions for public access, and implement lifecycle policies.

### What is Amazon S3?

An Amazon S3 or Simple Storage Service, is like a big digital warehouse where you can store all kinds of data. It's a part of Amazon Web Services (AWS), which is a collection of cloud computing services. It can be described as a giant virtual filing cabinet in the cloud, where you can save your files, pictures, videos, documents etc safe and accessible.

Data can be stored across multiple servers in different locations, so even if something goes wrong with one srver, your diles are still safe. S3 is very reliable, that is you can easilty access your files from anywhere using the internet and you can control who gets access to your files by setting permissions.

### S3 Benefits

Amazon S3 has range of benefits that makes it a top choice for storing and managing data in the cloud;

- S3 provides exceptional durability and reliability. Data can be stored across multiple servers and data centers, ensuring that even if one server fails, the date remain safe and accessible.

- S3 offers scalability, that you can easily increase or decrease the storage capacity as demanded.

- S3 offers acccessibility, that is you can access your data from anywhere in the world via the internet.

- With S3, you can control who access your data and encrypt your files to ensure it remains confidential and secured, making security a priority.

- S3 is cost-effective, that is you can only pay for the storage used.

### What is S3 Versioning?

S3 Versioning is basically restoring or recovering a file or resources that was acccidentally deleted. When the S3 versioning is turned on, S3 keeps a copy of every version of your file even if you delete it or overwrite without S3 versioning activated S3 looses every deleted file.

### Task

Create a new bucket in Amazon S3 to store our files. Following that, upload file into the newly created bucket and subsequently, enable versioning for the bucket, allowing it to retain multiple versions of files uploaded for tracking overtime. Configure permissions for the bucket to enable public access, ensuring that the files can be accessed by anyone with the appropriate link. Finally, implement the lifecycle policies to automate management of the files.

### Creation and setting up of Amazon S3 Bucket

1. Navigate to the search bar on the AWS Management Console.

- Search for S3.

![S3-bucket](./img/s3.JPG)

2. After clicking on S3 in the search results, you'll be directed to the S3 page.

- From there, locate and click on the "Create bucket" button.

![Create-S3](./img/create-bucket.JPG)

3. Proceed with creating new bucket. Please provide the bucket with a unique name, ensuring is distinct from any existing ones.

![name-bucket](./img/name-bucket.JPG)

- Select "ACL Disabled" for object ownership.

![ACL](./img/acl-disabled.JPG)

- Ensure to check "Block all public access" option.

![Block-access](./img/block-access.JPG)

- Leave the "Bucket versioning" disabled.

![Bcket-versioning](./img/bucket-versioning.JPG)

- Proceed with the default settings.

![Default-settings](./img/default-setting.JPG)

- Once done, click on the "Create bucket" button to finalize the creation process.

![Create-s3](./img/create-s3.JPG)

![Bucket-created](./img/created-s3.JPG)

**Note:** ACL  or Access Control List, is like a set of rules that decides who can access data in Amazon S3. You can use ACL to grant or deny access to the bucket and files for specific AWS accounts or predefined groups of users. It's a way to control who gets to see or mess with the data in the cloud.

### Upload object in the "s3-mini-project-001" bucket.

1. Create a file named "index.html", type "welcome to AWS world" and save the file.

![Create-file](./img/object.JPG)

![Type-in-content](./img/object-content.JPG)

2. Upload file into the bucket by clicking "Upload".

![Upload-file](./img/upload-object.JPG)

3. Click on "Add file" and select the file created "index.html".

- Once selected, click "Open".

![Add-file](./img/add-file.JPG)

![Select-file](./img/select-file.JPG)


4. You'll see the file being added.

![Added-file](./img/added-file.JPG)

- Select the added file and click on"Upload' to complete the process.

![Upload-file](./img/upload-file.JPG)

![Uploaded-file](./img/uploaded-file.JPG)

Congratulations! You have finally uploaded the object (file) to the S3 bucket (folder).

### Enable Versioning

1. In the bucket's properties section on the right side, you'll notice that the bucket versioning is currently disabled.

![Disabled-bucket-versioning](./img/disabled-bucket-versioning.JPG)

2. Now, we'll enable it by clicking on edit.

![Edit](./img/edit-bucket-versioning.JPG)

3. Select "Enable".

- Then click on "Save changes" to enable versioning for the bucket.

![Enable-versioning](./img/enable-bucket-versioning.JPG)

![Versioning-enabled](./img/versioning-enabled.JPG)

4. Now, if you modify the content of the file and upload it again, you'll create a new version of the file.

![Updated-file](./img/updated-content.JPG)

- Upload file into the bucket by clicking "Upload".

![Upload-file](./img/upload-object.JPG)

- Click on "Add file" and select the file created "index.html".

- Once selected, click "Open".

![Add-file](./img/add-file.JPG)

![Select-file](./img/select-file.JPG)


- You'll see the file being added.

![Added-file](./img/check-file.JPG)

- Select the added file and click on"Upload' to complete the process.

![Added-file](./img/check-file.JPG)

![Upload-file](./img/upload-file.JPG)

![Uploaded-file](./img/uploaded-file-1.JPG)

- By clicking on "Show versions", you'll be able to see all the versions of the file you've uploaded.

![Objects-version](./img/obeject-version.JPG)

- Now, whenever you make changes to the file and upload it again to the same bucket, it will continue creating versions of that file for future reference.

### Setting Permission

1. In the permissions section of the bucket, you'll notice that "Block all public access" is enabled.

- Click on "Edit" to make changes.

![Edit-blocked-access](./img/access-blocked.JPG)

2. Now unchecked "block all public access" option.

- Then click on "Save changes".

![Uncheck-blocked-access](./img/unblock-access.JPG)

![Confirm-changes](./img/confirm-changes.JPG)

- Now, type "confirm" and click on "Confirm".

By taking this action, you are allowing your file to be publicly accessible. This confirmation step ensures that you are aware of the implications of making your file public.

![Successfully-unblocked](./img/successfully-unblocked.JPG)


3. Now, you need to create a bucket policy to specify the actions you want the public to be able to perform on the file. 

- Click on "Edit".

![Edit-bucket-policy](./img/bucket-policy.JPG)

4. Click on the "Policy generator".


5. Select the "Type of policy" as "S3 Bucket Policy".

- Set the "Effect" to "Allow".

- Specify the "Principal" as "*", which means all users.

- Choose the action "Get object" and "Get object version".

- In the field of Amazon Resource Name (ARN), type the ARN of your bucket and add by "/*" after the ARN. Then,

- Click on "Add statement".

**So Actual ARN is -**

arn:aws:s3:::s3-mini-project-001

**And we need to add**

arn:aws:s3:::s3-mini-project-001/*

- Copy the ARN from here.

**Note -** ARN stands for Amazon Resource Name. It's like a unique address for every resource in AWS, such as buckets in S3. Just like your home address tells people where you live, an ARN tells AWS where a specific resource is located. It helps AWS know exactly which resource you're referring to when you're setting up permissions or policies.

6. Click on "Generate policy".

- Copy this and click on "Close".

**"Id": "Policy1714394236530":** This line specifies the unique identifier for the policy. The ID is used for reference and can be helpful for manageing policies within aws.

**"Version*: "2012-10-17":** This line indicates the version of the policy language being used. In this case, it is using version "2012-10-17" of the policy language.

**"Statement": "[...]":** This line begins the definition of the policy's statements. Policies can have multiple statements, each defining a set of permission.

**"Sid": "Stmt17":** This line assigns a unique identifier to the statement. Similiar to the policy ID, the statement ID is used for reference and management purposes.

**"Action": ["s3:GetOject", "s3:GetObjectVersion"]:** This line specifies the actions allowed by this policy. In this case, it allows the s3:GetObject and s3:GetObjectVersion action, which are used to retrieve objects and object versions from an S3 bucket.

**"Effect": "Allow":** This line specifies the effect of the statement, which is either "Allow" or "Deny". Here, it indicates that the actions specified in the Action field are allowed.

**"Resource": "arn:aws:s3:::s3-mini-project-001/*":** This line specifies the AWS resource to which the policy applies. In this case, it applies to all objects (/) withi the S3 bucket named s3-mini-project-001. The ARN (Amazon Resource Name) uniquely identifies the resource.

**"Principal": "*":** This line specifies the entity to which the policy applies. The * wildcard means  that the policy applies to all users and roles (i.e any principal) in the AWS account.

- Navigate to the bucket policy tab.

- Paste the policy you've generated using the Policy Generator.

7. Click on "Save changes".

8. Click on this version on the file.

9. Click on the object URl.

Here, you'll see the previous data.

If we click to the latest version.

And click on the object URL.

You'll get the latest data.


### Creating lifecycle Policies.

1.  For this, navigate to the management section of the bucket.

- Click on "Add lifecycle rule"

![Lifecycle-rule](./img/setup-lifecycle.JPG)

2. Give the specifications, and click to create rule.

![Settings](./img/set-specification.JPG)

![Settings](./img/size-spec.JPG)

![Settings](./img/max-size.JPG)

![Settings](./img/transition.JPG)

![Create-rule](./img/create-rule.JPG)

Now the lifecycle rule is created successfully.

![Created-lifecycle](./img/created-lifecycle.JPG)


This rule is set up to automatically move files from one type of storage to another in  the Amazon S3 bucket. Specifically, it moves files to storage type called Standard-IA after they've been sitting in the bucket for 30 days. This helps to save money because the Standard-IA storage is cheaper than the default storage option. So, if you have files that you don't access very often but still want to keep, this rule helps to save costs by storing them in a cheaper storage class after a certain period of time. 