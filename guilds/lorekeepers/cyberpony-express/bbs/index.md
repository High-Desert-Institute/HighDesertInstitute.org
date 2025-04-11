---
layout: default
title: Librarian
---

## [Lorekeepers' Guild](/guilds/lorekeepers/): [Cyberpony Express](guilds/lorekeepers/cyberpony-express/) - [BBS](guilds/lorekeepers/cyberpony-express/bbs/)

The Bulletin Board Service is a key part of the Cyberpony Express. It is a free, open-source, digital postal service for the people. The idea is to create a network of BBS nodes that can send and receive messages with users, solve the backhaul problem of long-distance messaging between distant parts of the network, enable access to MUDs and chatbots like the Librarian, and provide a framework for extending the functionality of the Cyberpony Express in the future.

### Bulletin Board Service (BBS)

The core element is the BBS, a simple, dumb system that works like a phone operator;

---
*User:* Hi  
*BBS:*  Hi!  
[C]heck messages (7)  
View Public [T]hreads (4)  
View [P]rivate Threads (2)  
Talk to the [L]ibrarian  
  
*User:* L  
*BBS:* Hi. I'm the librarian, an intelligent assistant with access to a vast library of knowledge. How can I assist you today?  
*User:* How can I make sure the water is safe to drink during a disaster?  

---

This core service doesn't need a lot of compute or power. It can run on basically anything, and then it can connect to more powerful devices to do the heavy lifting for services like the Librarian, the MUDs, etc.

<img src="/assets/images/librarian.gif" alt="The Librarian" class="photo">

#### Librarian

The librarian is a free, open-source, digital chatbot designed to help you find what you need and answer complex questions based on actively researching in order to find the answer. Basically the idea is to construct a retreival-augmented-generation (RAG) pipeline with a personality and access to the contents of a local internet-in-a-box library.

The librarian can respond with short summaries of topics as well as sending longer multi-part messages with more detailed information.

Also, a key point of this project is that this all works completely off-grid without power or internet. These are completely self-contained systems which continue to function during disasters or in remote areas with no internet service.

<img src="/assets/images/muds.png" alt="MUDs" class="photo">

#### MUDs

Think of a multi-user dungeon (MUD) as a text-based video game. The idea is to create a MUD that can be played over the Cyberpony Express, and that can be used to teach people about the network and how to use it. Also, there are all kinds of ways to integrate useful tools into a MUD, like the Librarian. 

For example, our MUD could be an infinite cyberpunk library where users can meet in various scenarios and situations to chat, or a virtual rerto-future kowloon walled city where semi-feral cybernetic cats wander through the chat room looking for pets and snacks.

To access a certain apartment within walled city, a password could be required. Maybe doing certain quests or solving certain mysteries in the library would give people that knowledge to access those other areas, etc.

Maybe certain areas contain data related to real sensors in the world such as weather data or air quality data, and the MUD could be used to teach people how to interpret that data. NPCs could be dispatched to fetch that data in the form of an IPFS CID hash code and do something interesting or important with it, etc.

Also, some aspects of the MUD could be integrated with the public internet to allow access to the contents of RSS feeds or other data sources, etc.

You can imagine using something like stable diffusion to create a video version of this experience based on the description, etc. For example, here is an image ChatGPT created based on the contents of this page...

The fundamental value created by MUDs is that they give us an obvious way to explain the power of what we've built, and a compelling use case for the kind of thing that really couldn't work anywhere except within this new world we've created. This just wouldn't work on the internet because it wouldn't be real in the same way.

### Existing Meshtastic BBS Projects

There are several existing projects which are similar to the BBS we want to build, or where there is a good foundation and we can build on top.

<img src="/assets/images/tc2-bbs.jpg" alt="TC2 BBS" class="photo">

#### TC2 BBS

The TC2 BBS is a large python project written to run on low power microcontrollers. I think there is good and bad here. A lot of people are putting a lot of effort into making it work, and it's designed to run on edge devices with only small solar panels. Extreme energy conservation is the fundamental design principle. They have even gone so far as to design custom hardware to run their system. 

The downside is that this custom hardware costs 3x as much as a Raspberry Pi Zero W2, and the software is written in python which is not a language that is well suited to running on low power microcontrollers.

The key lessons they have learned that we can apply to our project are:
- UI/UX design lessons, espcially related to menus
- How to run a BBS on low power microcontrollers


[https://www.youtube.com/watch?v=qwwAOZnLLgg](https://www.youtube.com/watch?v=qwwAOZnLLgg)

[https://github.com/TheCommsChannel/TC2-BBS-mesh](https://github.com/TheCommsChannel/TC2-BBS-mesh)

[Example of an amateur radio club that built one of these and uses it](https://m0aws.co.uk/?p=3349)


#### VeggieVampire

This is another Meshtastic BBS which was also built in python. It's much more simple than TC2, and it is designed to run on a Raspberry Pi. It also features existing integrations for simple games and external mail services.


[https://www.tomshardware.com/raspberry-pi/raspberry-pi-powers-this-meshtastic-network-bbs](https://www.tomshardware.com/raspberry-pi/raspberry-pi-powers-this-meshtastic-network-bbs)

[https://github.com/VeggieVampire/MeshBoard](https://github.com/VeggieVampire/MeshBoard)

### My Takeaways

It seems to me that we have a three step pipeline here from the user's perspective;

```
┌────────────────────┐
│ 🌾 Remote Node     │
│  (User's Device)    │
│                    │
│  > "How to clean    │
│     water?"         │
└────────┬───────────┘
         │   Message sent over LoRa mesh
         ▼
┌────────────────────┐
│ 🧠 BBS Operator    │
│  (Running On A New │
│  Cyberpony Express │
│  Meshtastic Node)  │
│                    │
│ - Receives message │
│ - Parses intent    │
│ - Adds to queue    │
└────────┬───────────┘
         │   Queue message to service host
         ▼
┌────────────────────────────┐
│ 🧃 Raspberry Pi (Service)  │
│  The Librarian + MUDs +    │
│  Internet-in-a-Box (IIAB)  │
│                            │
│ - Processes question       │
│ - Generates response       │
│ - Sends it back to queue   │
└────────┬───────────────────┘
         │   Response flows back over LoRa
         ▼
┌────────────────────┐
│ 🌾 Remote Node    │
│                    │
│  < "Boil it for 1m,│
│     avoid surface  │
│     runoff."       │
└────────────────────┘
```

- The remote user needs a meshtastic device to connect to the network.
- The BBS Operator is the extremely simple menu system that takes requests in the form of messages and queues them up for the correct service.
- The services are the smart parts that do the heavy lifting, like the librarian and the MUDs. These need to run on a more powerful device like a Raspberry Pi plugged into the BBS Operator node. The services will pull requests from the queue, and then queue their responses to be sent back to whoever they are for.

*Note:* Since all Users are identified by their device ID, and all messages are end-to-end encrypted; we always know who sent a message, so we can always identify them in the future to send them their response.

### Cyberpony Express BBS Todo List:

- Build an operator that runs as a meshtastic plugin on the meshtastic node, and queues up requests for the services.
- Build A Linux Service Host which handles the queues and hosts the services, informing the operator of what services are available.
- Build a simple librarian that can answer questions and send back responses.
- Build a MUD engine that can be played over the Cyberpony Express.
    - Implement the example MUDs from above.

---

[← Back to Lorekeepers' Guild](/guilds/lorekeepers)  
[← Back to All Guilds](/guilds/)  
[← Back to Home](/)