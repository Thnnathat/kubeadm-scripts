sudo apt update -y
sudo apt upgrade -y

sudo mkidr -p /exports/kubernetes

sudo apt install nfs-kernel-server -y

sudo mv /etc/exports /etc/exports_backup

sudo cat >> /etc/exports<< EOF
/exports/kubernetes 10.0.0.0/255.255.255.0(rw,sync,no_root_squash)
EOF

sudo systemctl restart nfs-kernel-server