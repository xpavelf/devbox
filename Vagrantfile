require 'fileutils'
DOCKER_COMPOSE_PKG = File.join(File.dirname(__FILE__), 'artifacts', 'docker-compose-Linux-x86_64')


Vagrant.configure('2') do |config|
  # bento/ubuntu-20.04 (virtualbox, 202004.27.0)
  config.vm.box = 'bento/ubuntu-21.04'
  config.vm.hostname = 'devbox'
  config.vm.network :private_network, ip: '192.168.0.100'
  config.vm.synced_folder '~/git', '/git'
  config.vm.synced_folder '~/Downloads', '/vagrant/home/Downlaods'
  config.vm.synced_folder '~/Desktop', '/vagrant/home/Desktop'
  config.vm.synced_folder '~/.m2', '/vagrant/home/.m2'
  config.disksize.size = '100GB'

  config.vm.provider :virtualbox do |vb|
    vb.name = 'devbox'
    vb.gui = true

    vb.customize [
      'modifyvm', :id,
      '--monitorcount', '1',
      '--graphicscontroller', 'vboxvga',
      '--accelerate3d', 'off',
      '--accelerate2dvideo', 'off',
      '--vram', '256',
      '--memory', '10240',
      '--cpus', '4',
      '--clipboard', 'bidirectional',
      ]

  end
 
# sudo keytool -import -trustcacerts -keystore /usr/lib/jvm/default-java/lib/security/cacerts -storepass changeit -noprompt -alias gitlab -file /git/devbox/ca-443.crt

  config.vm.provision 'file', source: '~/.gitconfig', destination: '.gitconfig'
  config.vm.provision 'file', source: 'git-prompt.sh', destination: '~/.git-prompt.sh'

  # Docker repository certificate
  config.vm.provision 'file', source: 'ca-5001.crt', destination: 'ca-5001.crt'
  config.vm.provision 'shell', inline: 'mkdir -p /etc/docker/certs.d/gitlab.invasys.org:5001/ && mv ca-5001.crt /etc/docker/certs.d/gitlab.invasys.org:5001/'

  config.vm.provision 'file', source: '~/.ssh', destination: '.ssh'
  config.vm.provision 'file', source: 'bin', destination: '~/bin'

  config.vm.provision :shell, :inline => "sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Prague /etc/localtime", run: "always"
  config.vm.provision 'shell', privileged: false, path: 'provision/deb.sh', name: 'deb.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/base.sh', name: 'base.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/xfce4.sh', name: 'xfce4.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/docker.sh', name: 'docker.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/docker-compose.sh', name: 'docker-compose.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/chrome.sh', name: 'chrome.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/vscode.sh', name: 'vscode.sh'

  config.vm.provision 'shell', privileged: false, path: 'provision/git.sh', name: 'git.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/java.sh', name: 'java.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/idea.sh', name: 'idea.sh'

  # Gitlab certificate
  config.vm.provision 'file', source: 'ca-443.crt', destination: 'ca-443.crt'
  config.vm.provision 'shell', inline: 'keytool -import -trustcacerts -keystore /usr/lib/jvm/default-java/lib/security/cacerts -storepass changeit -noprompt -alias gitlab -file ca-443.crt'

end
