require 'fileutils'

DOCKER_COMPOSE_PKG = File.join(File.dirname(__FILE__), 'artifacts', 'docker-compose-Linux-x86_64')


Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-20.04'
  config.vm.hostname = 'devbox'
  config.vm.network :private_network, ip: '192.168.0.100'
  config.vm.synced_folder '~/git', '/git'

  config.vm.provider :virtualbox do |vb|
    vb.name = 'devbox'
    vb.gui = true

    vb.customize [
      'modifyvm', :id,
      '--monitorcount', '2',
      '--graphicscontroller', 'vboxvga',
      '--accelerate3d', 'off',
      '--accelerate2dvideo', 'off',
      '--vram', '256',
      '--memory', '10240',
      '--cpus', '4',
      '--clipboard', 'bidirectional',
      ]

  end

  config.vm.provision 'file', source: '~/.gitconfig', destination: '.gitconfig'
  config.vm.provision 'file', source: 'git-prompt.sh', destination: '~/.git-prompt.sh'
  config.vm.provision 'file', source: 'ca.crt', destination: 'ca.crt'
  config.vm.provision 'shell', inline: 'mkdir -p /etc/docker/certs.d/gitlab.invasys.org:5001/ && mv ca.crt /etc/docker/certs.d/gitlab.invasys.org:5001/'

  config.vm.provision 'file', source: '~/.ssh', destination: '.ssh'

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

end
