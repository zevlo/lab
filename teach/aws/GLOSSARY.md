# AWS Glossary

Canonical terms the learner has demonstrated in this AWS course.

## Networking

**VPC (Virtual Private Cloud)**:
A logically isolated virtual network that you define within one AWS Region.

**Subnet**:
A range of IP addresses inside a VPC. Each subnet belongs to one Availability Zone.

**Route table**:
A set of routes that pairs network destinations with targets. A subnet uses its associated route table to direct traffic.

**Internet gateway**:
A VPC component that provides a path between a VPC and the internet when routes and resource settings allow it.
_Alias_: IGW

**Public subnet**:
A subnet whose associated route table contains a route to an internet gateway.

**Public IPv4 address**:
An IPv4 address that internet clients can use to address a resource, subject to routes and traffic controls.

**Security group**:
A set of rules that controls allowed inbound and outbound traffic for associated resources, such as EC2 instances.
