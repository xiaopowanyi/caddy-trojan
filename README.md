# caddy-trojan #
#### 首次安装 ####
请将结尾的password更换为自己的密码，例如 bash easytrojan.sh 123456，安装成功后会返回trojan的连接参数
```
curl https://raw.githubusercontent.com/xiaopowanyi/caddy-trojan/refs/heads/main/easytrojan.sh -o easytrojan.sh && chmod +x easytrojan.sh && bash easytrojan.sh password
```

#### 放行端口 ####
如果服务器开启了防火墙，应放行TCP80与443端口，如在云厂商的web管理页面有防火墙应同时放行TCP80与443端口
```
# RHEL 7、8、9 (CentOS、RedHat、AlmaLinux、RockyLinux) 放行端口命令
firewall-cmd --permanent --add-port=80/tcp --add-port=443/tcp && firewall-cmd --reload && iptables -F

# Debian 9、10、11、12、Ubuntu 16、18、20、22 放行端口命令
sudo ufw allow proto tcp from any to any port 80,443 && sudo iptables -F
```
> 验证端口是否放行 (示例IP应修改为trojan服务器的IP)
>
> 通过浏览器访问脚本提供的免费域名，例如1.3.5.7.nip.io </br>
> 如果自动跳转至https，页面显示Service Unavailable，说明端口已放行


#### 重新安装 ####
```
systemctl stop caddy.service && curl https://raw.githubusercontent.com/xiaopowanyi/caddy-trojan/refs/heads/main/easytrojan.sh -o easytrojan.sh && chmod +x easytrojan.sh && bash easytrojan.sh password
```

#### 完全卸载 ####
```
systemctl stop caddy.service && systemctl disable caddy.service && rm -rf /etc/caddy /usr/local/bin/caddy /etc/systemd/system/caddy.service
```

---
