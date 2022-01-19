# l2tp-vpn-server

Основан на https://github.com/hwdsl2/setup-ipsec-vpn переделан под свои нужны


# Развертка сервиса:
```
git clone https://github.com/mrchupatek/l2tp-vpn-server.git
cd l2tp-vpn-server
docker-compose up -d
```

# Добавление пользователей
```
docker exec vpn-server  add_users.sh 'username_to_add' 'password'
```
# Удаление пользователей
```
docker exec vpn-server del_users.sh 'username_to_delete'
```
