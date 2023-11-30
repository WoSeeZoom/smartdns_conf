#!/bin/sh

download_files() {
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt"  >> /tmp/smartdns/domain-set/cn.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/apple-cn.txt"    >> /tmp/smartdns/domain-set/cn.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/google-cn.txt"   >> /tmp/smartdns/domain-set/cn.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt"  >> /tmp/smartdns/domain-set/proxy.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt"        >> /tmp/smartdns/domain-set/proxy.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/greatfire.txt"  >> /tmp/smartdns/domain-set/proxy.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/reject-list.txt"  >> /tmp/smartdns/domain-set/block.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/win-spy.txt"  >> /tmp/smartdns/domain-set/block.conf
    curl  "https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/win-extra.txt"  >> /tmp/smartdns/domain-set/block.conf
}

delete_tmp_file(){
    if [ -f /tmp/smartdns/domain-set/ ]; then
        rm -rf /tmp/smartdns/domain-set/
        echo "/tmp/smartdns/domain-set/文件夹删除成功"
    fi
}

sed "s/^full://g;s/^regexp:.*$//g;s/^/nameserver \//g;s/$/\/china/g" -i /etc/smartdns/domain-set/cn.conf
sed "s/^full://g;s/^regexp:.*$//g;s/^/nameserver \//g;s/$/\/oversea/g" -i /etc/smartdns/domain-set/proxy.conf
sed "s/^full://g;s/^regexp:.*$//g;s/^/address \//g;s/$/\/#/g" -i /etc/smartdns/domain-set/block.conf
