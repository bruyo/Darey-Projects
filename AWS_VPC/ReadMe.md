# AWS Virtual Private Cloud (VPC)

## Project Review

In this project, we will explore the core concepts of Amazon Web Services (AWS), focusing specifically on Virtual Private Clouds (VPCs). The objective is to understand the fundamental components of VPC infrastructure, including subnets, gateways, and routing tables.Through practical demonstrations and interactive exercises, we'll navigate the AWS management console to deploy and manage these critical components effectively.

### What's VPC, Subnets, internet Gateway, and NAT gateway?

Taking GatoGrowFast.com's company for example, VPC is basically the system on a virtual space that allows their computers to communicate to each securely. It's creating a private room in the cloud for the company's use.

As a company, they will have different departments like the HR, Finance, Admin, IT etc, each departments will have specific access rules. Similiarly, in a VPC, the company can create different sections called subnets for different parts of the business.

Now, if the company  wants to connect the office to the internet, they would use a router to control flow of data in and out of the building. In VPC, we have the internet gateway. This allows their VPC communicate with the internet securely.

NAT (Network Address Translation) Gateway as a secret agent between the company's computers and the internet. When a computer inside their virtual office wants to talk to the internet, the NAT Gateway steps in. It translates the computer's message and send it out, but it hides who sent it. It's like sending a letter without your return address. This way, the internet only sees the NAT gateway address, keeping the company's computers safe and anonymous online.

**Note -** A router is a device that directs data packets between computer networks. Think of it as a traffic cop for the internet. When data is sent from one device to another across a network, it's broken down into smaller packets. These packets need to find their way to the correct destination, and that's where the router comes in.

Routers use routing tables, which are like maps of the internet, to determine the best path for the data packets to take. They analyze information in the packets, such as destination IP addresses, to make these decisions. Once the packets reach their destination, the router ensures they're delivered to the correct device.

### What is an IP address?

An IP address can be described to the phone number of the computer. It's a unique set of numbers that helps computers find and talk to each other on a network, like the internet.

There two main types of IP addresses; public and private IP addresses. However, each type has different versions, with IPv4 and IPv6 being the most common.

**Public IP address:** This is like your home address. It's unique and helps other computers on the internet find yours. Just like how people send letters to your house using your address, data packets are sent to your computer using its public IP address.

- A public IP address is globally unique and is assigned  by the Internet Service Provider (ISP) to a device connected to the internet.

- It allows devices to communicate with other devices across the internet.

- It can either be dynamic or static. Dynamic IPs change periodically, often each time a device reconnects to the internet, while static IPs remain constant. Static IPs are typically used for servers, remote access, or services that requires consistent connectivity.

**Private IP address:**  Think of this like an internal extension number in a big office building. It's used for communication within a specific network, like your home Wi-Fi network or an office network. Devices within same network can talk to each other using their private IP address, but these addresses aren't visible to the outside world.

- Private IP addresses are typically assigned by a router or a DHCP (Dynamic Host Configuration Protocol) server within the network.

- Devices within the same private network communicate with each other using their private IP addresses.

- These addresses are not routable over the internet. They are used for internal netwrok communication only and are hidden from the outside world.

- It is not globally unique and can be reused within different private networks without conflict.

IPv4 address:

- IPv4 (Internet Protocol version 4) addresses are the most common type  of IP addresses used today.

- They are 32-bit numeric addresses written in decimal format, separated by periods (192.168.0.1).

- They are divided into five classes: A, B, C, D, and E, with classes A, B, and C being used for addressing hosts on networks.

- Each octet in an IPv4 address can have a value between 0 and 255. This is because each octet is made up of eight bits, and the maximum value that can be represented with eight bits is 255 (which is 11111111 in binary).

IPv6 address:

- IPv6 (Internet Protocol version 6) addresses are designed to replace IPv4 due to the exhaustion of available IPv4 addresses.

- They are 128-bit hexadecimal addresses, represented in eight groups of four hexadecimal digits seperated by colons (e.g, 2001:0db8:85a3:0000:0000:8a2e:0370:7334).

- They provide a much larger address space compared to IPv4, allowing for a virtually unlimited number of unique addresses.

### What is CIDR?

CIDR, or Classless Inter-Domain Routing, makes it easier to talk about group of IP addresses on the internet. Instead of naming each address one by one, CIDR uses a simple shortcut. It's like saying "All houses on Main Street" instead of listing each house separately.

For example, let's say you have the IP address 192.168.1.0. With CIDR notation, you might write it like this: 192.168.1.0/24. The "/24" part tells us that we're talking about all houses on that street from 192.168.1.0 to 192.168.1.255.

- CIDR helps us manage and organize IP addresses on the internet in a way that's easy to understand and work with. It's like having a shorthand for talking about big groups of addresses.

### Determining the number of available IP addresses in a CIDR block 

To determine the number of available IP addresses in a CIDR block, you calculate it using the formula below;

2^(32 - CIDR notation) - 2

The "-2" is excluding the network address and broadcast address.

**Example -**

Let's say we have a CIDR block of "192.168.1.0/24".

Using the formula, we calculate;

2^(32 - 24) - 2

=2^8 - 2

=256−2

=254

### What is Gateway?

Gateways are like doorways between different networks. They help data travel between your local network ans other networks, like the internet. Just like a gate lets you go from your backyard to your neighbourhood park, a gateway lets your data go from your computer to the internet and back again. It's like traffic cop of the internet, directing your data where it needs to go.

### What is Route table?

A route table is like a map that helps data find its way around the network. Just like the map shows you the best routes to get from one place to another, a route table tells devices on a network how to send data packets to their destinations. In simple terms, a route table lists different destinations and the paths (or "routes") to reach them. When a device receives data that it needs to send somewhere, it consults the route table to figure out where to send it.

For example, if your computer wants send data to a website, it looks at its route table to find out which gateway to use to reach the internet. Think of a route table as the navigation system for data on a network, helping if find the fastest and most efficient paths to where it needs to go.

### Connection between Gateway and Route table

Gateways:

- Gateways are devices (like routers or firewalls) that serve as entry and exit points between different networks.

- They connect networks with different IP address ranges, such as your local network and the internet.

- Gateways receive incoming data packets and determine where to send them next based on routing information.

Routing Tables:

- Route tables are table s maintained by networking devices (like routers or switches) that contain information about how to route data packets to their destinations.

- Each entry in a route table specifies a destination network and the next hop (gateway) to reach that network.

- Devices consult the route table to determine the best path for forwading data packets based on their destination IP addresses.

Connection:

- When a device (like a computer or server) wants to send data to a destination outside of its local network, it checks its route table.

- The route table provides the information needed to determine the next hop (gateway) for reaching the destination network.

- The device then forwards the data packet to the specified gateway, which continues the process until the packet reaches its final destination.

In summary, gateways and route tables work together to facilitate the routing of network traffic between different networks. Gateways serve as the entry and exit points between networks, while route tables provide the necessary routing information to determine how data packets should be forwarded to their destinations.

### Task

### Setting up a virtual private cloud (VPC)

1. Navigate to the search bar.

- Enter "VPC". Upon locating the relevant result, proceed to click on it, directing you to the virtual private cloud (VPC) page.

![Search-bar](./img/search-bar.JPG)

2. Please navigate to the "Create VPC" option and click on it.

![VPC-page](./img/vpc-page.JPG)

3. Please select the "VPC only" option, specify the IPv4 CIDR block, and proceed by clicking on the "Create VPC" button.

![Setting-vpc](./img/vpc-setting.JPG)

![Setting-vpc](./img/settting-vpc.JPG)

![Create-vpc](./img/create-vpc.JPG)

![created-vpc](./img/created-vpc.JPG)

This is the VPC we created.

![VPC-created](./img/vpc-created.JPG)


### Configuring subnets within the VPC

1. Navigate to the "Subnets" option located on the left sidebar.

- Upon clicking, you'll be directed to the subnets page.

- From there, proceed to click on the "Create subnet" button.

![Create-subnet](./img/subnet.JPG)

2. Please select the ID of the VPC that you created in the previous step.

![Select-subnet](./img/select-subnet.JPG)

3. Now, enter the subnet name, and specify the IPv4 CIDR for the subnet.

- Choose the availability zone.

- And specify the IPv4 CIDR for the subnet.

- To create another subnet, click on the "Add subnet" button.

![Set-up-subnet](./img/set-up-subnet.JPG)

![Set-up-subnet](./img/subnet-set-up.JPG)

- Repeat the same steps for the second subnet.

- Ensuring to specify the subnet name, choose the availibility zone. and provide the IPv4 CIDR.

- Once completed, click on "Create subnet" button to create the subnet.

To maintain consistency with our intention of creating both a public and private subnet, ensure that the naming convention reflects this distinction appropriately.

![private-subnet](./img/private-subnet.JPG)

![Create-subnet](./img/create-subnet.JPG)

Here you'll see your subnets is being created.

![Created-subnet](./img/created-subnet.JPG)

With the creation of subnets, the second part of the task is now completed. Let's proceed to the next part, which involves creating an Internet Gateway and attaching it to VPC.

### Creating Internet Gateway and attaching it to VPC

1. Navigate to the "Internet gateway" option on the left sidebar.

- Upon clicking, you will be directed to the Internet gateway page.

- From there, proceed to click on the "Create Internet gateway" button.

![Internet-gateway](./img/internet-gateway.JPG)

2. Specify the name of the internet Gateway.

- Proceed by clicking on the "Create Internet Gateway" button.

![Create-internet-gw](./img/create-IG.JPG)

![Created-internet-gw](./img/created-ig.JPG)

Now, you'll notice that it is currently detached, indicating that it is not associated with any VPC. To enable internet connectivity, you must attach the internet gateway to VPC you have previously created.

![Attach-internet-gw-to-vpc](./img/attach-ig.JPG)

![attach-ig-vpc](./img/ig-vpc.JPG)

![attached-ig](./img/attached-ig.JPG)

Now, let's come to the next part which is Enabling Internet connectivity with the Internet Gateway by setting routing tables.

### Enabling Internet Connectivity with the Internet Gateway by setting up Routing tables

1. Proceed to "Route tables" option located on the left sidebar.

- Once there, click on the "Create route table" button.

![Route-table](./img/route-table.JPG)

2. Enter the name of the route table and select the VPC you previously created.

- Finally, click on the "Create route table" button to proceed.

![RT](./img/route-table.JPG)

![Set-up](./img/set-up-route-table.JPG)

![Create-RT](./img/create-rt.JPG)

![created-rt](./img/created-rt.JPG)

- Next, click on "Subnet associations", followed by "Edit subnet associations" to associate the subnet with this route table, we'll associate the public subnet with this route table.

![created-sa](./img/subnet-asso.JPG)

3. Select the public subnet and click on save association.

![Public-subnet-association](./img/public-asso.JPG)

4. Navigate to "Routes" and then click on "edit routes".

![Route](./img/routes.JPG)

5. Click on "add routes".

![add-routes](./img/add-route.JPG)

6. Select "destination" as "0.0.0.0/0", indicating that every IPv4 address can access this subnet.

7. In the "Target" field, choose "Internet Gateway", and then select the internet gateway you created. Finally save the changes.

![Added-RT](./img/added-route.JPG)


The route table has now been configured to route traffic to the internet gateway, allowing connectivity to the internet. Since only the subnet named "my-public-subnet" is associated with the route table, only resources within that subnet can access the internet.

![Created-route](./img/created-route.JPG)

Now, let's come to the next part which is enabling outbound internet access through NAT gateway, (by attaching NAT gateway to the subnet and attaching the route table).

### Enabling Outbound Internet Access through NAT gateway

1. Navigate to "NAT Gateways" section, then click on "Create NAT Gateway".

![NAT-gateway](./img/nat-gateway.JPG)

2. Then mention the name of the NAT gateway.

![name-nat-gateway](./img/name-nat-gw.JPG)

3. Now choose the private subnet.

- And select the connectivity type as Private.

![Set-private-nat-gw](./img/private-nat-gw.JPG)

4. Then click on Create NAT gateway.

![Create-NAT-gateway](./img/create-nat-gw.JPG)

You have succefully created the NAT Gateway.

![created-NAT-gw](./img/created-nat-gw.JPG)

5. select the NAT gateway.

6. Then navigate to the "Details" tab.

7. From there, locate the subnet ID and click on it.

![Private-subnet-nat-gw](./img/private-subnet-nat-gw.JPG)

8. In the subnet page, navigate to the "Route Table" section.

9. Then click on the "route table ID" - in our case "rtb-051c17b8041725b6c"

![Route-table-ID](./img/RT-ID.JPG)

10. Proceed to the "Routes" section, then click on "Edit routes".

![rtb](./img/rtb.JPG)

11. Then click on "Add routes".

![new-added-route](./img/new-added-route.JPG)

- Select "Destination" as "0.0.0.0/0".

- In the "Target" field, choose "NAT Gateway".

- Then select the NAT Gateway you created.

- Finally, save the changes.

12. On the subnet association section, click on edit subnet association.

![nat-gw-subnet-association](./img/nat-asso.JPG)

- Choose the private subnet and click on "save associations".

![Private-subnet-association](./img/private-subnet-asso.JPG)

Now the subnet has been succefully attached to the route table.

![Associated-private-subnet](./img/private-subnet-asso-successful.JPG)

### Difference between Internet Gateway and NAT Gateway

**Internet Gateway:**

When you attach an  internet gateway to a subnet, it allows the resources in that subnet (like EC2 instance) to reach out to the internet and also allows internet traffic to reach the resources. 

**NAT Gateway:**

When you attach a NAT gateway to a subnet, it lets the resources in that subnet (like EC2 instances) acces the internet, but doesn't allow incoming traffic from the internet to reach those resources. The resources can go out to the internet, nut the traffic can't directly come in.

### What is VPC peering?

VPC peering is like connecting two virtual offices in the cloud so they can talk to each other directly.

- By default, EC2 instances in different VPCs cannot communicate with each other.

- To enable communication between EC2 instances in different VPCs, you can set up VPC peering, VPN connections, or AWS direct connect.

- VPC peering establishes a direct network connection between the VPCs, allowing EC2 instances in one communicate EC2 instances in the other VPC.

## Why do we need VPC peering?

We need VPC peering when we want different parts of our cloud networks (VPCs) to work together smoothly. Maybe you have one VPC for your development team and another for your marketing team, and you want them to share data securely. That's where VPC peering comes in handy, it lets these VPCs communicate directly, making things easier fore everyone.

Additionally, there are some key points that you should be aware of.

- Two VPCs cannot to each other, you need to set up the VPC peering or use a VPN or Direct Connect to establish connectivity between VPcs.

- Subnets within same VPC can communicate with each other by default. AWS sets up route tables to allow communication within the same VPC.

- EC2 instances in the same subnet can communicate with each other by default, assuming they have proper security group rules allowing the desired traffic.

- EC2 instances in different subnets within the same VPCs can also communicate with each other by default, as long as their associated route tables are configured to allow traffic between subnets.

### Establishing VPC Peering Connections

1. Let's begin by creating two VPcs in the same region. Alternativelty, you may choose a different region if needed.

![Create-VPC](./img/new-vpc.JPG)

![first-vpc](./img/first-vpc.JPG)

![create-vpc-o1](./img/create-vpc-01.JPG)

![created-vpc-01](./img/created-vpc-01.JPG)

![Create-vpc-02](./img/vpc-02.JPG)

![Create-vpc-02](./img/create-vpc-02.JPG)

![Created-vpc-02](./img/created-vp-02.JPG)

2. Navigate to the "Peering Connections" option on the left sidebar.

- Upon clicking, you'll be directed to the VPC peeering page.

- From there, proceed to click on the "Create Peering Connection" button.

![peering-connection](./img/peering-connection.JPG)

3. Provide a name for the VPC peering connection.

- Select the my-vpc-02.

- Choose the account "My account" since the VPCs are in our own AWS account.

- Ensure to use the same region, "This Region (eu-north-1)", as the VPCs were created in the same region.

- Next, select my-vpc-02.

- Proceed by clicking on the "Creating Peering Connection" button.

![First-peering](./img/first-peering.JPG)

![Accepter](./img/accepter-vpc.JPG)

![create-peering](./img/create-peering.JPG)

Then you will see this.

![created](./img/created-peering.JPG)

4. In the peering connection page, locate "Actions" option on the right side.

- Click on it, then select "Accept Request".

![Accept-request](./img/accept-request.JPG)

![Click-Accept](./img/click-accept.JPG)

![Created-peering](./img/created-peering-btn-vpcs.JPG)

5. Click on Main route table ID of the accepter VPC.

![select](./img/select-accepter.JPG)

6. Choose the route table.

- Then navigate to "Routes" section.

- Click on "Edit route".

![Edit-route](./img/edit-vpc-route.JPG)

- Click on add route.

![Click-on-add-route](./img/click-add-route.JPG)

7. Go to the VPC page.

- Select the requester VPC.

- In details tab, you'll find the IPv4 CIDR. (in this case - 192.168.0.0/16)

- Copy this CIDR and paste it in the "Destination" field when adding a route.

![IPv4-CIDR](./img/ipv4-cidr.JPG)

![Main-rt](./img/accepter-main-rt.JPG)


![VPC-peering](./img/vpc-peering.JPG)


- In the target, choose VPC peering and then choose the peering connection you have created. Click on save changes.


![VPC-peered](./img/vpc-peered.JPG)


8. Copy the IPv4 CIDR of the accepter VPC. (In this case - 172.16.0.0/16)

![IPv4-CIDR-vpc-2](./img/cidr-vpc-2.JPG)

9. Click on Main route table ID of the requester VPC.

![Requester](./img/select-requester.JPG)

![Main-RT](./img/requester-main-rt.JPG)

10. Choose the route table, then navigate to the "Routes" section. Click on "Edit route".

![Edit-route](./img/edit-route.JPG)

11. Click on add route.

- Paste the CIDR in the "Destination" field.

- In the target, choose VPC peering.

- Then choose the peering connection you have created.

![route-edit](./img/route-edit.JPG)

![VPC-peering](./img/vpc-peering-1.JPG)

![peered-vpc](./img/peered-vpc.JPG)

The connection has been successfully established. Now, resources in the accepter vpc can connect to resources in the requester vpc, and vice versa.

VPC peering allows direct communication between two VPCs using private IP addresses. It can be set up between VPCs in the same AWS region or different regions and the same AWS account or different AWS accounts.