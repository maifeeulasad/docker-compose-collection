sudo apt -y install qemu-system-x86 podman
podman info
podman machine init
sudo wget https://github.com/containers/gvisor-tap-vsock/releases/download/v0.8.5/gvproxy-linux-amd64 -O /usr/libexec/podman/gvproxy && sudo chmod +x /usr/libexec/podman/gvproxy
podman machine start
pip3 install podman-compose
