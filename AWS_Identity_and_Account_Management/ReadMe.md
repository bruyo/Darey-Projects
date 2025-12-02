# AWS Identity and Access Management

## Project Review

In this project, we are going to learn about aws identity and access management (IAM), which helps control who can access the aws account. This entails things like users, roles, policies, and groups, and how they are set up to keep your resources safe.


### What is IAM?

IAM, or Identity and Access Management. This can be termed as the gatekeeper for the AWS resources, it decides who gets in and what they are allowed to do once they get inside.


### What is IAM User?

IAM users are like individual accounts for different people or entities within the AWS environment. For example, if you have a team working on a project, you can creat a separate IAM user for each team members. Each team member will have its own unique username and password, giving them access to the AWS resources they need to work with.

IAM User ensures that users can only access resources they need to perform their tasks with.

### What is IAM Role?

An IAM Role defines what someone or something (like application or service) can do within an AWS account. Each roles has a set of permissions that determine what action can be performed and which aws resoruces it can access.

IAM roles are flexible and can be assumed by users, services, or applications as needed. They are commonly used for tasks such as granting permissions to AWS services, allowing cross-account access, or providing temporary access to external users. IAM roles enhances security and efficiency by providing controlled access to AWS resources without the need for permanent credentials.

### What is IAM Policy?

An IAM Policy is a set of rules that define what actions a role can take. These rules specify the permissions granted to the role. It is a rulebook that outlines which actions are allowed and which are not, helping to ensure secure and controlled access to the AWS resources.

IAM Policy defines the permissions granted to an IAM user and IAM role, specifying which resources that is accessible to them and what actions they can take.

### What is IAM Group?

An IAM Group is a collection of IAM Users. Instead of managing permissions for each users separately, users can be organize into a group based on their roles or responsibilities. So with similiar roles or responsibilities can be grouped into a group.

You can also assign permissions to the group instead of individual users with similiar tasks.

### Task

A growth marketing consultancy company called GatoGrowFast.com wants to give some access to their employee Eric, Jack and Ade to AWS resources. Eric has only access to EC2 instance while Jack and Ade has access to both EC2 instance and S3 Bucket.

1. Navigate ti the AWS Management Console.

- Use the search bar to locate the Identity and Access Management (IAM) Service.

![AWS-Console](./img/AWS-console.JPG)

2. Now, on the IAM dashboard, navigate to the left sidebar and click on "Policies".

![IAM-Dashboard](./img/IAM-dashboard.JPG)

- From there, search for "EC2" and select "AmazonEC2fullaccess" from the list of policies.

- Proceed by clicking on "Create Policy" to initiate the policy creation process.

![Create-policy](./img/IAM-Policy.JPG)

3. Now, select all EC2 actions.

![Select-All-Actions](./img/all-actions.JPG)

4. Tick "All resources" and click "Next".

![click-Next](./img/next-IAMP.JPG)

5. Now click on create policy.

![Created-policy](./img/create-policy.JPG)


This is the policy created.

![D-team](./img/d-team.JPG)

6. Proceed to "Users" section, and select the option to "Creat User"

![Create-user](./img/create-user.JPG)

7. Enter the username for the user.

- Then select the option "Provide user access to the AWS Management Console" if access to the web-based console interface is required.

- Proceed to set up a password for the user.

- Check the box "Users must create a new password at next sign-in" if allowing users to change their password upon first sign-in is preferred.

![Eric](./img/eric-user.JPG)

8. Select "Attach policy directly" and navigate to "Filter customer managed policies"

- Choose the policy created named "D-team".

- Then proceed by clicking "Next".

![Add-policy](./img/create-user-policy.JPG)

**Note - AWS Policies -**

- Managed Policies: Made by AWS, used by  many.

- Customer Managed policies: You make and manage them.

- Inline Policies: Made for specific thing.

9. Next, click on "Create User".

![Create-Eric](./img/Created-user.JPG)

10. Ensure to save these details securely for future reference.

- Click on "Return to user list".

![User-list](./img/created-successfully.JPG)

Eric's user has been successfully created, and the policy granting him full access to EC2 has been attached.

### For the other part

1. On the "User Groups" section, enter a name for the group.

![User-group](./img/user-group.JPG)

![Enter-group-name](./img/group-name-1.JPG)

- Click on "Create a group".

![Click-create-group](./img/create-group.JPG)

This is the user created.

- Then, proceed to the "Users" section.

![Created-development-team-group](./img/Development-team.JPG)

2. Now, let's create a user named "Jack".

![Jack-user](./img/Jack-user.JPG)

3. In the "Permission" option, select "Add user to group".

- Then in the "User group" section, choose the group created named "Development-team".

- Click "Next".

![Permmission](./img/permission-jack.JPG)

4. Then, click on "Create user".

![Create-jack-user](./img/created-jack-user.JPG)

![Successfully-created-user](./img/successfully-created-jack-user.JPG)


We will repeat the same process for Ade.

1. Now, let's create a user named "Jack".

![Ade-user](./img/Ade-user.JPG)

2. In the "Permission" option, select "Add user to group".

- Then in the "User group" section, choose the group created named "Development-team".

- Click "Next".

![Permmission](./img/permission-ade.JPG)

3. Then, click on "Create user".

![Create-ade-user](./img/created-ade-user.JPG)

![Successfully-created-user](./img/successfully-created-ade-user.JPG)


4. Navigate to the "Policies" section and click on "Create policy"  to begin crafting a new policy.

![Policy](./img/Policy.JPG)

5. Choose the two services, EC2 and S3, fromthe avialable options.

![Select-EC2](./img/EC2.JPG)

![EC2-Resources](./img/EC2-resources.JPG)

![Select-S3](./img/S3.JPG)

![S3-resources](./img/S3-resources.JPG)

6. Enter a policy name and click on "Create policy" button.

![dev-policy](./img/dev-policy.JPG)

![Create-policy](./img/create-dev-policy.JPG)

7. Navigate to the "User Group" section and select the "Development-team" group.

![Development-group](./img/dev-group.JPG)

8. Proceed to "Permissions" section and add the necessary permissions.

![Permissions](./img/add-permmision.JPG)

9. Click on "Attach policies".

![Attach-policy](./img/attach-policy.JPG)

10. Select "Customer Managed Policy" as the policy type.

![Policy-type](./img/policy-types.JPG)

- Then choose "dev-policy".

- Clicak "Attach policy".

![Select-policy](./img/select-policy.JPG)

the policy is now atteched to the Development-team group, granting full access to EC2 and S3.

![attached-policy](./img/dev-team-policy-attached.JPG)

### Conclusion

In conclusion, we have been able to securely create the different users Eric, jack and Ade. We also gave Eric full access to EC2 by creating a policy while both Jack and Ade were added to the development group and also given full access to both EC2 and S3 by creating a policy.