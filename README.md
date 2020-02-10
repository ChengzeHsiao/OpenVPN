##### OpenVPN-Server一键式部署 #####
注意！联网安装

###### OpenVPN 安装部署 ######
1、执行 openvpn-install.sh 即可安装

Command：
	
  	chmod +x openvpn-install.sh
  	sh openvpn-install.sh
###### OpenVPN 配置步骤 ######

1、创建checkpsw.sh文件
添加执行权限

Command：
	
	chmod +x /etc/openvpn/checkpsw.sh

2、创建用户和密码认证文件

Command：
	
	vim /etc/openvpn/psw-file
	admin 123456 (前面是用户 后面是密码)

注：这里 psw-file的权限

Command：
	
	chmod 400 /etc/openvpn/psw-file
	chown nobody.nobody /etc/openvpn/psw-file
 
3、修改Server端配置文件，添加以下三行代码。

Command：
	vim /etc/openvpn/server.config
	
		auth-user-pass-verify /etc/openvpn/checkpsw.sh via-env
		username-as-common-name
		script-security 3


###### OpenVPN 用户管理 ######

1、创建openvpn用户
执行 Create_user.sh文件，输入用户名和密码
	
	./Add_user.sh

2、删除openvpn用户
执行 Remove_user.sh文件，输入用户名
	
	./delete_user.sh
	
3、查看所有openVPN用户

	./show_user.sh

###### OpenVPN客户配置 ######

注意！在Linux 系统上安装 OpenVPN Server完成后，会自动创建后缀名为：.ovpn 文件

1、修改客户端配置文件：client.ovpn
	1.登录输入用户名和密码方法：
		再添加这一行，就会提示输入用户名和密码
		auth-user-pass
	2.登录免输入用户名和密码方法：
		在config目录下创建名为：pass.txt文件，将用户名和密码填入到pass.txt文件。
		再添加这一行，就会自动登录、无需输入用户名和密码
		auth-user-pass pass.txt
		
2、客户端默认安装目录：C:\Program Files\OpenVPN\config

	将后缀名为：.ovpn 和 pass.txt 文件拷贝到config目录下



