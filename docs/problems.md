# Problems During Development

## Windows

Volume mounts in windows does not work:<br>
[Solution](https://forums.docker.com/t/volume-mounts-in-windows-does-not-work/10693/182):

```
... go into the docker settings -> shared drives -> reset credentials.
Then click the drive and hit apply.
docker run --rm -v c:/Users:/data alpine ls /data
```
