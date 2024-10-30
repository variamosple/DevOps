# 502 Bad Gatway

**URL:** [https://app.variamos.com](https://app.variamos.com)

Production

`ssh -i variamos_prd.pem ubuntu@ec2-3-130-187-131.us-east-2.compute.amazonaws.com`

ec2-3-130-187-131.us-east-2.compute.amazonaws.com

Check nginx configuration

`sudo nginx -t`

nginx: [emerg] unknown directive "https" in /etc/nginx/conf.d/hginx-lab.conf:1
nginx: configuration file /etc/nginx/nginx.conf test failed

**Solution**

`sudo rm /etc/nginx/conf.d/nginx-lab.conf`
`sudo rm /etc/nginx/conf.d/hginx-lab.conf`
`sudo rm /etc/nginx/conf.d/ssl.conf`

`reboot`

`sudo docker compose --env-file .env.aws.develop -f docker-compose-aws-develop-nginx.yml up -d`


