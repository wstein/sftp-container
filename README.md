# Sample container for sftp

TODO: add password or authorized_keys

## build

```bash
docker build --tag sftp .
```

## create container ssh key (ed25519 without passphrase)

```bash
ssh-keygen -A -f $PWD
```

## start sftp container on port 8022

```bash
docker run -d -p 8022:22 -v $PWD/ssh/ssh_host_ed25519_key:/etc/ --name sftp sftp
```
