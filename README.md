# node-app

This project takes a Node app and deploys it as a Docker container on AWS EKS via a Jenkins pipeline. The AWS EKS cluster was built with the eksctl command-line tool, i.e.

eksctl create cluster —name prod --nodegroup-name std-workers --node-type t3.medium --nodes 2 --nodes-min 2 --nodes-max 2 --ssh-access --ssh-public-key ~/.ssh/ec2_id_rsa.pub --managed
