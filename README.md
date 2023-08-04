# Terraform_Script_Costwise_Task

Given Task : 

	Introduction:
		As a DevOps Intern, you have been tasked with writing a Terraform script that can deploy a WordPress application.
		The script should be written in a clean and maintainable way and should handle all corner cases. Additionally, the script should be able to roll back and delete all resources if anything fails during deployment.
		The chosen cloud provider for this assignment is AWS, but you are free to choose any of the other cloud providers - GCP or Azure.

	Requirements:

		Create an EC2 instance t4g.micro (ARM only) and one RDS instance t4g.micro.
		The RDS instance should not be publicly accessible and should only be exposed to the EC2 instance.
		The script should also perform deployment and take the latest image of WordPress from Docker, use php-fpm.
		The WordPress application should be exposed on port 80.
		Create an Elastic IP and attach it to the EC2 instance.
		If the bonus points are to be achieved, deploy Let's Encrypt and attach a domain to it so that the application can be accessed through the domain name.
		The Terraform script should be uploaded to a public GitHub repository.
		The repository's README file should be updated with all the necessary instructions to run the script, including the requirements, deployment steps, and any other relevant details.


Remember to replace the AMI_ID, Security Group Id, etc. with your respective ones to run it succesfully.
After this execute the following commands:
	
 	$ terraform init
	$ terraform fmt
	$ terraform validate
	$ terraform plan
	$ terraform apply -auto-approve
 
This will complete the task successfully.
