# rei-binding-linux-x64

A simple docker for compiling [rei-binding](https://github.com/REI-Network/binding)

## Packages versions

- `gcc` 8.5.0
- `nodejs` 18.16.0

## Environment variable

| Name  | Description            |
| :---- | :--------------------- |
| PROXY | `socks5` proxy address |

## Volumes

| Position        | Description                                             |
| :-------------- | :------------------------------------------------------ |
| `/git`          | Used to store project source code and compiled binaries |
| `/root/.hunter` | Used to store hunter cache                              |

## Example

```shell
docker run -d -v ./workspace/git:/git -v ./workspace/hunter:/root/.hunter -e PROXY="socks5://172.17.0.1:1080" --name rei-binding-linux-x64-compiler samlior/rei-binding-linux-x64
```
