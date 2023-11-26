---
- hosts: kubnodes
  become: yes  # Use "become" to escalate privileges, equivalent to sudo

  tasks:
    - name: Disable Swap
      command: swapoff -a
      become: yes  # Execute this task with elevated privileges

    - name: Run apt-get update and upgrade
      become: true
      apt:
        upgrade: yes
        update_cache: yes

    - name: Upgrading
      command: apt-get upgrade
      become: yes

    - name: Enable UFW Firewall
      apt:
        name: ufw
        state: present  # Ensure ufw is installed
      become: yes

    - name: Allow Required Ports in UFW
      ufw:
        rule: allow
        port: "{{ item }}"
      become: yes
      loop:
        - 6443
        - 2379
        - 2380
        - 10250
        - 10259
        - 10257
        - 22

    - name: Add cri-o GPG keys
      apt_key:
        url: "{{ item.url }}"
        state: present
      become: yes
      loop:
        - { url: 'https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:1.28/xUbuntu_22.04/Release.key' }
        - { url: 'https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_22.04/Release.key' }
        
    - name: Add cri-o repository
      apt_repository:
        repo: "{{ item.repo }}"
        state: present
        update_cache: yes
      become: yes
      loop:
        - { repo: 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_22.04/ /' }
        - { repo: 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/1.28/xUbuntu_22.04/ /' }

    - name: Install cri-o and cri-o-runc
      apt:
        name: "{{ item }}"
        state: present
        update_cache: yes
      become: yes
      loop:
        - cri-o
        - cri-o-runc
        - cri-tools

    - name: Enable and Start cri-o
      service:
        name: crio
        state: started
        enabled: yes
      become: yes

    - name: Install Additional Dependencies
      apt:
        name: "{{ item }}"
        state: present
        update_cache: yes
      become: yes
      loop:
        - libbtrfs-dev
        - containers-common
        - git
        - libassuan-dev
        - libdevmapper-dev
        - libglib2.0-dev
        - libc6-dev
        - libgpgme-dev
        - libgpg-error-dev
        - libseccomp-dev
        - libsystemd-dev
        - libselinux1-dev
        - pkg-config
        - go-md2man
        - cri-o-runc
        - libudev-dev
        - software-properties-common
        - gcc
        - make
