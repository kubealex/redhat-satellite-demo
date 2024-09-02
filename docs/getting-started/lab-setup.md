# Lab setup

The setup is performed using KVM, Ansible and Terraform to provide an isolated and easily maintainable environment with Satellite on it with a minimal set of configurations.

Self-containing setup for Ansible is granted using an [execution-environment]({{ config.repo_url }}{{ config.edit_uri }}/lab-setup/execution-environment/) preconfigured with required collections and roles to provision the infrastructure (KVM network/Instance + Satellite setup)

The lab will take care of:

- Provisioning KVM netwok and storage pool
- Provisioning KVM instance for Satellite
- Provisioning KVM instances for 1xRHEL8 and 1xRHEL9 clients
- Configure and install Satellite following documentation best practices

## Requirements

### Red Hat Account and Satellite subscription

A Red Hat Account and valid subscriptions for Red Hat Satellite are required.

### Red Hat Enterprise Linux QCOW2 images

To provision the KVM instances, a RHEL8 and RHEL9 QCOW2 image are needed.

To create the images, the [Red Hat Insights Image Builder](https://console.redhat.com/insights/image-builder) can be used, and instructions to create them are available through the [documentation](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html-single/creating_customized_images_by_using_insights_image_builder/index#assembly_creating-a-customized-rhel-guest-image-using-red-hat-image-builder).

The only relevant setting to flag is *Virtualization - Guest image (.qcow2)* in the **Image Output** settings of the wizard.

No customization is needed, all required configurations will be performed using Ansible.

### Execution Environment

To build the execution environment, we will use [ansible-builder](https://ansible.readthedocs.io/projects/builder/en/latest/) and to run the automation [ansible-navigator](https://ansible.readthedocs.io/projects/navigator/) is needed.

To install them you can run:

```bash
pip3 install ansible-builder ansible-navigator
```

Clone the repository:

```bash
git clone https://github.com/kubealex/redhat-satellite-demo
```

To build the execution environment:

```bash
cd lab-setup/execution-environment
ansible-builder build -t satellite-demo-ee
```

It will create a container image with all necessary tools to run the automation.

### Inventory

The inventory comes with no predefined hosts:

<details>
  <summary>Example inventory</summary>
  ```dockerfile
  --8<-- "lab-setup/inventory"
  ```
</details>

The host group **vm_host** represents the machine where KVM is running. A user with sudo privilege is required for DNS configuration. Assuming an IP like 1.2.3.4 and a user called **ansible** with password **redhat** the inventory will look like:

```bash
[vm_host]
1.2.3.4 ansible_user=ansible ansible_password=redhat
```

No additional entry is required, but it can be tailored to your needs based on the host configuration (if using SSH keys or other settings).

### Variables

The provisioner comes with almost all predefined values, but a dedicated file called [lab_vars.yml](./lab_vars.yml) is provided to set the following variables:

| Variable                       | Description                                                              | Default Value            |
|--------------------------------|--------------------------------------------------------------------------|--------------------------|
| lab_domain | Dedicated domain for libvirt network, needed for DNS resolution| demo.labs   |
| lab_network | Network CIDR for libvirt network | 192.168.254.0/24|
| rhel8_image_path | Path to the QCOW2 image for RHEL8| |
| rhel9_image_path | Path to the QCOW2 image for RHEL9| |
| rhsm_user | RHSM Username for instance registration | | 
| rhsm_password | RHSM Password for instance registration | | 

Variables with no default must be filled.

### Running the setup

To run the setup, after filling the required variables, if your desired user doesn't require a password to use sudo you can run:

```bash
ansible-navigator run --eei satellite-demo-ee --pp never -i inventory -m stdout create-lab.yml
```

If your user requires a password to run sudo:

```bash
ansible-navigator run --eei satellite-demo-ee --pp never -i inventory -m stdout create-lab.yml -K 
```

You can grab a cup of coffee while it runs, after the setup you will have a working Satellite instance:

| | | 
| - | - | 
| Host | [https://satellite.demo.labs](https://satellite.demo.labs) |
| Username | admin | 
| Password | redhat | 

### Destroying the lab

To remove the setup, if your desired user doesn't require a password to use sudo you can run:

```bash
ansible-navigator run --eei satellite-demo-ee --pp never -i inventory -m stdout destroy-lab.yml
```

If your user requires a password to run sudo:

```bash
ansible-navigator run --eei satellite-demo-ee --pp never -i inventory -m stdout destroy-lab.yml -K 
```
