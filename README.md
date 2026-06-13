\[6/13/2026 2:41 AM] Dief Allah Sherif: # CloudScale Infrastructure as Code Project



\## 1. Project Information



Project Title: Infrastructure as Code with Terraform and Azure

Course: Cloud Computing \& DevOps Engineering

Project Scenario: CloudScale needs to deploy a containerized web application to Azure using Docker, Terraform, and GitHub Actions CI/CD.



\## 2. Team Members



| Name               | Student ID |

| ------------------ | ---------- |

| Dief allah Ateeyah | 4808       |

| Ahmed Ben Ali      | 4772       |

| Ahmed Smew         | 4743       |



\## 3. Repository Link



GitHub Repository:

https://github.com/Diefallah6/Second-Project



\## 4. Project Description



This project deploys a containerized web application to Microsoft Azure using Infrastructure as Code.



The web application was created using a simple HTML page and packaged into a Docker image. The Docker image was pushed to Docker Hub, then Terraform was used to create the Azure infrastructure. A Linux virtual machine was created and configured using a startup script to install Docker, pull the Docker image, and run the container automatically.



GitHub Actions was used to automate Terraform commands. The workflow runs terraform plan on Pull Requests and runs terraform apply after changes are pushed to the main branch, with a manual approval gate for production deployment.



\## 5. Architecture Diagram



flowchart TD

&#x20;   A\[Developer] --> B\[GitHub Repository]

&#x20;   B --> C\[GitHub Actions CI/CD]

&#x20;   C --> D\[Terraform]

&#x20;   D --> E\[Azure Resource Group]

&#x20;   E --> F\[Virtual Network]

&#x20;   F --> G\[Subnet]

&#x20;   G --> H\[Network Interface]

&#x20;   H --> I\[Linux Virtual Machine]

&#x20;   E --> J\[Public IP Address]

&#x20;   E --> K\[Network Security Group]

&#x20;   K --> I

&#x20;   J --> I

&#x20;   L\[Docker Hub Image] --> I

&#x20;   I --> M\[Docker Container]

&#x20;   M --> N\[CloudScale Web Application]





\## 6. Technologies Used



\* Docker

\* Docker Hub

\* Terraform

\* Microsoft Azure

\* GitHub Actions

\* Linux Virtual Machine

\* Nginx

\* HTML/CSS



\## 7. Docker Image Information



Docker Hub account used:



diefallah6





Docker image name:



diefallah6/cloudscale-webapp:v1





The container exposes port 80.



\## 8. Docker Build and Push Instructions



\### 8.1 Build the Docker Image



docker build -t diefallah6/cloudscale-webapp:v1 .





This command builds a Docker image from the Dockerfile in the project folder.



\### 8.2 Login to Docker Hub



docker login





This command logs in to Docker Hub.



\### 8.3 Push the Docker Image



docker push diefallah6/cloudscale-webapp:v1





This command uploads the Docker image to Docker Hub.



\## 9. Terraform Infrastructure



Terraform was used to create the following Azure resources:



| Azure Resource         | Description                                 |

| ---------------------- | ------------------------------------------- |

| Resource Group         | Contains all project resources              |

| Virtual Network        | Network address space 10.0.0.0/16         |

| Subnet                 | Subnet address prefix 10.0.1.0/24         |

| Public IP              | Static public IP address                    |

| Network Security Group | Allows SSH port 22 and HTTP port 80         |

| Network Interface      | Connects the VM to the subnet and public IP |

| Linux Virtual Machine  | Runs Ubuntu and Docker                      |

| OS Disk                | Disk attached to the VM                     |



\## 10. Important Terraform Notes



The required VM size in the project handout was:



Standard\_B1s





However, Azure showed a capacity restriction in the selected region. Because of this, the VM size was changed to:



Standard\_D2s\_v3





The selected Azure region was:



switzerlandnorth





The Terraform provider was configured with:



resource\_provider\_registrations = "none"





This was used to avoid automatic registration errors for Azure resource providers during Terraform execution.



\## 11. Terraform Setup Instructions



\### 11.1 Go to the Terraform Folder



cd terraform





\### 11.2 Initialize Terraform



terraform init





This command initializes Terraform and downloads the required Azure provider.



\### 11.3 Validate Terraform Files



terraform validate





This comman

\[6/13/2026 2:41 AM] Dief Allah Sherif: d checks that the Terraform configuration is valid.



\### 11.4 Run Terraform Plan



terraform plan -input=false -var="admin\_password=CloudScale@2026Pass"





This command shows the resources Terraform will create before applying changes.



\### 11.5 Run Terraform Apply



terraform apply -auto-approve -input=false -var="admin\_password=CloudScale@2026Pass"





This command creates the Azure resources.



\## 12. VM Docker Startup Script



The Azure VM uses a custom startup script in Terraform.



The script performs the following tasks:



1\. Updates the Ubuntu package list.

2\. Installs Docker.

3\. Enables Docker to start automatically.

4\. Pulls the Docker image from Docker Hub.

5\. Runs the container on port 80.

6\. Uses --restart always so the container starts again if the VM reboots.



Docker run command used inside the VM:



docker run -d --name cloudscale-webapp --restart always -p 80:80 diefallah6/cloudscale-webapp:v1





\## 13. GitHub Actions Workflow Explanation



The GitHub Actions workflow is located at:



.github/workflows/terraform.yml





The workflow has two main jobs:



\### 13.1 Terraform Plan



This job runs on every Pull Request to the main branch.



It performs:



terraform init

terraform validate

terraform plan





\### 13.2 Terraform Apply



This job runs after changes are pushed to the main branch.



It performs:



terraform init

terraform apply





The apply job uses the GitHub environment:



production





This environment requires manual approval before deployment.



\## 14. GitHub Secrets



The workflow uses GitHub Secrets for sensitive information.



| Secret Name       | Purpose                               |

| ----------------- | ------------------------------------- |

| AZURE\_CREDENTIALS | Azure authentication credentials      |

| TF\_ADMIN\_PASSWORD | Admin password for the Azure Linux VM |



The secrets are stored in:



GitHub Repository → Settings → Secrets and variables → Actions





\## 15. Manual Approval Gate



A GitHub Environment named production was created.



The Terraform Apply job uses:



environment:

&#x20; name: production





This means the apply job waits for manual approval before it deploys to Azure.



\## 16. Step-by-Step Detailed Solution



\### Step 1: Clone the Repository



git clone https://github.com/Diefallah6/Second-Project.git

cd Second-Project





\### Step 2: Create the Web Application



A simple HTML web application was created inside:



app/index.html





The page displays the project title and the team members.



\### Step 3: Create Dockerfile



A Dockerfile was created to run the application using Nginx.



FROM nginx:alpine



COPY app/index.html /usr/share/nginx/html/index.html



EXPOSE 80





\### Step 4: Build Docker Image



docker build -t diefallah6/cloudscale-webapp:v1 .





\### Step 5: Push Docker Image to Docker Hub



docker push diefallah6/cloudscale-webapp:v1





\### Step 6: Create Terraform Files



The following Terraform files were created:



terraform/providers.tf

terraform/variables.tf

terraform/main.tf

terraform/outputs.tf





\### Step 7: Create Azure Backend for Terraform State



The Terraform remote backend was created using Azure Storage.



az group create --name tfstate-rg-diefallah --location switzerlandnorth





az storage account create --name tfstate4808diefallah --resource-group tfstate-rg-diefallah --location switzerlandnorth --sku Standard\_LRS





az storage container create --name tfstate --account-name tfstate4808diefallah --auth-mode login





\### Step 8: Run Terraform Plan



cd terraform

terraform init

terraform validate

terraform plan -input=false -var="admin\_password=CloudScale@2026Pass"





\### Step 9: Run Terraform Apply



terraform apply -auto-approve -input=false -var="admin\_password=CloudScale@2026Pass"





\### Step 10: Open the Web Application



After Terraform finished, the public IP was used to open the web application in the browser:



http://20.199.179.236





\### Step 11: Configure GitHub Secrets



The following secrets were added to GitHub:



AZURE\_CREDENTIALS

TF\_ADMIN\_PASSWORD





\### Step 12: Configure GitHub Manual Approval



A GitHub Environment named production was created, and required reviewers were enabled for manual approval

\[6/13/2026 2:41 AM] Dief Allah Sherif: .



\### Step 13: Run GitHub Actions on Pull Request



A Pull Request was created. GitHub Actions ran Terraform Plan successfully.



\### Step 14: Run GitHub Actions Apply



After merging to the main branch, the workflow waited for manual approval and then ran Terraform Apply.



\## 17. Screenshots



\### Screenshot 1: Docker image build successful



!\[Docker image build successful](screenshots/01-docker-build.png)



\### Screenshot 2: Docker image pushed to Docker Hub



!\[Docker image pushed to Docker Hub](screenshots/02-docker-push.png)



\### Screenshot 3: Terraform plan output



!\[Terraform plan output](screenshots/03-terraform-plan.png)



\### Screenshot 4: Terraform apply output



!\[Terraform apply output](screenshots/04-terraform-apply.png)



\### Screenshot 5: GitHub Actions workflow showing successful plan on PR



!\[GitHub Actions plan on PR](screenshots/05-github-actions-plan-pr.png)



\### Screenshot 6: GitHub Actions workflow showing approved apply



!\[GitHub Actions approved apply](screenshots/06-github-actions-approved-apply.png)



\### Screenshot 7: Browser showing containerized web app



!\[Browser showing web app](screenshots/07-web-app-browser.png)



\### Screenshot 8: Azure Portal showing resource group and resources



!\[Azure Portal resources](screenshots/08-azure-resources.png)



\## 18. Git Commit Contribution Summary



| Commit Message                                 | Team Member        |

| ---------------------------------------------- | ------------------ |

| add dockerized web application                 | Dief allah Ateeyah |

| update web page with team information          | Dief allah Ateeyah |

| add terraform azure infrastructure files       | Ahmed Ben Ali      |

| add vm docker startup configuration            | Ahmed Ben Ali      |

| add github actions terraform workflow          | Ahmed Smew         |

| add final terraform updates for github actions | Ahmed Smew         |



\## 19. Final Result



The final result is a containerized web application deployed on an Azure Linux VM using Terraform. The application is accessible through the public IP address, and the deployment process is automated using GitHub Actions with a manual approval gate for production.

