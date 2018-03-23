VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
   config.vm.define "ft" do |ft|
    ft.vm.box = "ubuntu/xenial64"
	ft.vm.network "forwarded_port", guest: 21, host: 21
	ft.vm.network "forwarded_port", guest: 21, host: 2121
	for i in 30000..30100
          ft.vm.network :forwarded_port, guest: i, host: i
end
	ft.vm.network "private_network", ip: "192.168.10.20"
	ft.vm.provider "virtualbox" do |vb|
	  vb.name = "ft-server"
	  vb.memory = "512"
	  vb.cpus = 2
	end
	ft.vm.hostname = "ft"
	ft.vm.provision "shell", inline: <<-SHELL
	sudo apt-get update
	apt-get -y install python-software-properties
	sudo add-apt-repository -y ppa:thefrontiergroup/vsftpd
	sudo apt-get -y install vsftpd
	sudo chmod -R 777 /home/vagrant
	sudo cp /vagrant/vsftpd.conf /etc/
	sudo ufw allow 20/tcp
	sudo ufw allow 21/tcp
	sudo ufw allow 30000:30100/tcp
	sudo touch testfile.txt
	SHELL
	
  end

     config.vm.define "cl" do |cl|
	cl.vm.box = "ubuntu/xenial64"
    cl.vm.hostname = "client"
	cl.vm.network "private_network", ip: "192.168.10.25"
	cl.vm.provider "virtualbox" do |vb|
	  vb.name= "client"
	  vb.memory = "512"  
	end   
	cl.vm.provision "shell", inline: <<-SHELL
	sudo apt-get update
	sudo ufw allow 20/tcp
	sudo ufw allow 21/tcp
	sudo ufw allow 30000:30100/tcp
	apt-get -y install dos2unix
	cd /home/vagrant/
	touch testcl.txt
	sudo chmod -R 777 /home/vagrant
	dos2unix /vagrant/ftp.sh
	sudo chmod +x /vagrant/ftp.sh
	cd /home/vagrant
	sudo sh /vagrant/ftp.sh
	SHELL
  end
 end