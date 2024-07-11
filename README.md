# redhat-satellite-demo

The intent of this repository is to provide a turnkey environment with some useful use cases to get started with Red Hat Satellite and/or show its capabilities in a quick and efficient way.

It uses a combination of [Ansible](https://www.ansible.com/), [Terraform](https://www.terraform.io/) and [KVM](https://www.linux-kvm.org/) to provision a complete environment with the following instances:

| VM role | vCPU | Memory | Disk | 
| - | - | - | - |
| Satellite Server | 4 | 20GB | 100GB | 
| RHEL8 Client | 1 | 2 GB | 10GB | 
| RHEL9 Client | 1 | 2 GB | 10GB | 

It also takes care of local DNS resolution.


- [Getting started with lab setup](./lab-setup/)
- [Use cases](./use-cases/)
