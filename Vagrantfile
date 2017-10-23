# -*- mode: ruby -*-
# vi: set ft=ruby :
# This is a Vagrant configuration file. It can be used to set up and manage
# virtual machines on your local system or in the cloud. See http://downloads.vagrantup.com/
# for downloads and installation instructions, and see http://docs.vagrantup.com/v2/
# for more information and configuring and using Vagrant.

Vagrant.configure("2") do |config|
  ##### Added for ec2 ######
  config.ssh.pty = true
  config.vm.box = "dummy"
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  config.vm.provider :aws do |aws, override|
    aws.keypair_name = "andres"
    aws.ami = "ami-8c1be5f6"
    aws.instance_type = "m3.medium"
    aws.security_groups = ["sg-7c3a7c1b"]
    aws.iam_instance_profile_name = "vagrant"
    aws.subnet_id = "subnet-6285e349"
    aws.user_data = File.read("./user-data.sh")
    aws.tags = {
      'Name' => 'ssm-test-vagrant',
      'Owner' => 'andress@amazon.com'
    }
    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = "/Users/andress/.ssh/keys/andres.pem"
  end

  #config.vm.provision "shell", inline: "sudo easy_install pip"
  config.vm.provision "shell", inline: "sudo easy_install --upgrade pip"
  config.vm.provision "shell", inline: "sudo pip install ansible"
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "server.yml"
    ansible.verbose = "v"
  end
end
