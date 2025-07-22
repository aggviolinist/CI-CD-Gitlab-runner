# CI-CD-Gitlab-runner
Creating our own runner on EC2. Here we are going to upload a docker file and run our own jobs. We are not using the shared runners on Gitlab.
## Tools
### EC2
### VPC
### Gitlab
### IAM

## Create a runner
Use terraform to create an instance which we will use as our runner
## Create our own runner
- Follow the instructions on gitlab
```sh
sudo yum update -y
sudo yum install rpm
rpm --eval '%_arch'
nano script-runner.sh
chmod u+x script-runner.sh
sudo ./script-runner.sh
sudo gitlab-runner status
```
> ![Alt text](images/runner.png?raw=true "The runner is on!")
