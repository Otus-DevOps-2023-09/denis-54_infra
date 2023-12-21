#!/usr/bin/python3

import yandex_cloud_client as yc
import json
from sys import argv

options = ['--list', '--host']

folder_id = 'b1gruh9dp3k0l66ao9fc'

with open('/home/denis/key.json', 'r') as infile:
    credentials = json.load(infile)

client = yc.ComputeClient(service_account_key=credentials)

clients = client.instances_in_folder(folder_id)

db_name = clients[0].name
app_name = clients[1].name

app_ip = clients[0].network_interfaces[0].primary_v4_address.one_to_one_nat.address
db_ip = clients[1].network_interfaces[0].primary_v4_address.one_to_one_nat.address


data = \
{
    "all": {
        "hosts": {
            "appserver": {
                "ansible_host": app_ip
            },
            "dbserver":{
                "ansible_host": db_ip
            }
        }
    },
    "app": {
        "hosts": {
            "appserver": {
                "ansible_host": app_ip
            }
        }
    },
    "db": {
        "hosts": {
            "dbserver": {
                "ansible_host": db_ip
            }
        }
    }
}

a = json.dumps(data)
f= open('inventory.json', 'w')
f.write(json.dumps(data, indent=4))
f.close()
