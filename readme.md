# Introduction

This Infrastructure as Code (IaC) will help you deploy Netskope Cloud Exchange in your Azure environment and configure the following;

- Create a Linux VM into an existing virtual network, associate a System Assigned Managed AAD Identity and bootstrap with the required toolchain to run Netskope Cloud Exchange in Azure e.g. Docker. 
- Create a storage account for boot diagnostics.
- Creates network security group with required rules and associate with the VM network interface. The network security rule is configure to allow communication to cloud exchange admin UI and shell access to the supplied trusted IP(s) i.e., ` var.trusted_ip `.
- Provides Netskope Cloud Exchange IP address as template output value.

## Key Points

- Ensure the outbound connectivity is allowed. For more information on the connectivity requirements: [Connectivity Requirements from Cloud Exchange Outbound](https://docs.netskope.com/en/system-requirements.html)


Full documentation can be found here: [Netskope Cloud Exchange](https://docs.netskope.com/en/netskope-cloud-exchange.html)

## Architecture Diagram

This IaC will create the Azure resources as shown below.

![](.//images/ce-azure-e.png)

*Fig 1. Netskope Cloud Exchange deployment in Azure*

## Deployment

To deploy this template in Azure:
- Clone the GitHub repository for this deployment.
- Customize variables in the `terraform.tfvars.example` and `variables.tf` file as needed and rename `terraform.tfvars.example` to `terraform.tfvars`.
- Copy SSL certificates to the certificate folder, if ` var.own_cert ` is set to "Yes". 
- Change to the repository directory and then initialize the providers and modules.

   ```sh
   $ cd <Code Directory>
   $ terraform init
    ```
- Submit the Terraform plan to preview the changes Terraform will make to match your configuration.

   ```sh
   $ terraform plan
   ```
- Apply the plan. The apply will make no changes to your resources, you can either respond to the confirmation prompt with a 'Yes' or cancel the apply if changes are needed.

   ```sh
   $ terraform apply
   ```
- Output will provide Netskope Cloud Exchange ip address to access Netskope's Admin UI.

   ```sh
    Outputs:

    private_ip_address = <Cloud Exchange Private IP>

   ```

## Destruction

- To destroy this deployment, use the command:

   ```sh
   $ terraform destroy
   ```

## Support

Netskope-provided scripts in this and other GitHub projects do not fall under the regular Netskope technical support scope and are not supported by Netskope support services.