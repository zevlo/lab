# AWS Resources

## Knowledge

### Foundations

- [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
  AWS guidance for secure, reliable, efficient, cost-effective operations. Use for: evaluating every architecture in this course.
- [What is Amazon VPC?](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
  The primary VPC overview. Use for: network boundaries, subnets, routing, and gateways.
- [Plan your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-getting-started.html)
  AWS planning guidance for IP ranges, Availability Zones, and internet access. Use for: hands-on VPC designs.
- [Enable internet access using an internet gateway](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html)
  AWS's exact public-subnet and public-address requirements. Use for: reasoning about direct internet access.

### Core services

- [What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
  The primary EC2 overview. Use for: instances, instance types, networking, and scaling.
- [EC2 instance configuration parameters](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-launch-parameters.html)
  AWS's launch-setting reference. Use for: images, instance types, networks, security groups, and user data.
- [Run commands at launch with user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
  AWS guidance for automated instance setup. Use for: bootstrapping repeatable servers.
- [Security group rules for common use cases](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-rules-reference.html)
  AWS examples for web, SSH, and database traffic. Use for: choosing protocol, port, and source.
- [EC2 instance status checks](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-system-instance-status-check.html)
  AWS guidance on system and instance health signals. Use for: separating machine health from application health.
- [What is Amazon S3?](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)
  The primary S3 overview. Use for: buckets, objects, access, and storage use cases.
- [What is IAM?](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)
  The primary IAM overview. Use for: identities, roles, policies, authentication, and authorization.
- [What is Amazon RDS?](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)
  The primary RDS overview. Use for: managed relational databases, backups, availability, and monitoring.
- [What is Amazon Route 53?](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)
  The primary Route 53 overview. Use for: DNS routing, domains, and health checks.
- [What is Amazon CloudWatch?](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)
  The primary CloudWatch overview. Use for: metrics, logs, alarms, and operational visibility.
- [What is Amazon ECS?](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html)
  The primary ECS overview. Use for: AWS-native container orchestration.
- [What is Amazon EKS?](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
  The primary EKS overview. Use for: managed Kubernetes concepts and operations.
- [Choosing an AWS container service](https://docs.aws.amazon.com/decision-guides/latest/containers-on-aws-how-to-choose/choosing-aws-container-service.html)
  An AWS decision guide comparing container options. Use for: choosing between ECS and EKS.

### Writing standard

- [Google developer documentation style guide](https://developers.google.com/style)
  Guidance for clear technical writing. Use for: active voice, direct language, and consistent terms.
- [Short sentences](https://developers.google.com/tech-writing/one/short-sentences)
  Google guidance on one idea per sentence. Use for: keeping lessons concise.

## Wisdom (Communities)

- [AWS re:Post](https://repost.aws/about)
  An AWS-managed forum with community experts and official AWS content. Use for: testing troubleshooting ideas and learning from real incidents. Never post secrets or private workload details.
