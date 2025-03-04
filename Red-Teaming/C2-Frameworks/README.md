# Intro to C2 Frameworks


## C2 Framework OP Sec:


Obfuscating Agent Callbacks:

1. Sleep Timers

 Let’s say a firewall observed traffic that looks like so

    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:05.000
    TCP/443 - Session Duration 2s, 33 packets sent, 10:00:10.000
    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:15.000
    TCP/443 - Session Duration 1s, 33 packets sent, 10:00:20.000
    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:25.000

A pattern is starting to form. The agent beacons out every 5 seconds; this means that it has a sleep timer of 5 seconds.

2. Jitter

Jitter takes the sleep timer and adds some variation to it; our C2 beaconing may now exhibit a strange pattern that may show activity that is closer to an average user:

    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:03.580
    TCP/443 - Session Duration 2s, 33 packets sent, 10:00:13.213
    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:14.912
    TCP/443 - Session Duration 1s, 33 packets sent, 10:00:23.444
    TCP/443 - Session Duration 3s, 55 packets sent, 10:00:27.182

Payload Types:

1. Stageless:
- The payload contains all of the necessary tools in one single executable, making it more reliable, attracts more attention, and it is more likely to get flagged by AV and IDS/IPS solutions.

The steps for establishing C2 beaconing with a Stageless payload are as follows:

1. The Victim downloads and executes the Dropper
2. The beaconing to the C2 Server begins



2. Staged Payload:

- Require a callback to the C2 server to download additional parts of the C2 agent, commonly refered as dropper, because it is dropped to victim machine, to download the second stage of out payload.

- This is a prefered method over stageless payloads because only a small amount of code is require to orquestrate the whole operation, and retrieve additional parts of the C2 agent.

Pivoting Modules

One of the last major components of a C2 Framework is its pivoting modules, making it easier to access restricted network segments within the C2 Framework. If you have Administrative Access on a system, you may be able to open up an “SMB Beacon”, which can enable a machine to act as a proxy via the SMB protocol. This may allow machines in a restricted network segment to communicate with your C2 server.

1. The Victims call back to an SMB named pipe on another Victim in a non-restricted network segment.
2. The Victim in the non-restricted network segment calls back to the C2 Server over a standard beacon.
3. The C2 Server then sends commands back to the Victim in the non-restricted network segment.
4. The Victim in the non-restricted network segment then forwards the C2 instructions to the hosts in the restricted segment.

## Facing the world 

Domain Fronting:

Utilizes a well known hosting site (for example) Cloudflare,
Red Teamers can abuse this to make it appear that a workstation or server is communicating with a known, trusted IP Address. Geolocation results will show wherever the nearest Cloudflare server is, and the IP Address will show as ownership to Cloudflare.


C2 Profiles

The next technique goes by several names by several different products, "NGINX Reverse Proxy", "Apache Mod_Proxy/Mod_Rewrite",  "Malleable HTTP C2 Profiles", and many others. However, they are all more or less the same. All of the Proxy features more or less allow a user to control specific elements of the incoming HTTP request.

﻿Accessing and Managing your C2 Infrastructure:

SSH port-forwarding allows us to either host resources on a remote machine by forwarding a local port to the remote server, or allows us to access local resources on the remote machine we are connecting to.  In some circumstances, this may be for circumventing Firewalls.


In our C2 set up from Task 4, our Teamserver is listening on localhost on TCP/55553. In order to access Remote port 55553, we must set up a Local port-forward to forward our local port to the remote Teamserver server. We can do this with the -L flag on our SSH client:

SSH Port Forward

           
root@kali$ ssh -L 55553:127.0.0.1:55553 root@192.168.0.44
root@kali$ echo "Connected" 
Connected


