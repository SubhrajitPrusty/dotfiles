#! /usr/bin/python3

import os


wifi = os.popen("iwgetid -r").read().strip()
print(wifi)

if "ITER" in wifi:
    c = os.popen("curl www.google.com --head -s").read()
    if "200 OK" in c:
        print("Up")
    else:
        try:
            os.popen("rm /tmp/CyberClient.1641017332")
        except Exception as e:
            print(e)
        os.popen("crclient -l 1641017332 -i wlo1")
        login = os.popen("crclient -u 1641017332 -i wlo1").read()
        print(login)

