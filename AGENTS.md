IMPORTANT!

Do not do anything to change the structure or create or remove any files except as instructed by a playbook specific to that task as located in the /agents/playbooks directory. Start there to find out what you are allowed to do and how to do it. If you are unsure about anything, do not change the codebase.

If a new playbook is needed, ask the user for permission to create one. All playbooks must be approved by the user before they can be added to the codebase.

All playbooks must be written in a way that is safe to run multiple times without causing duplication or errors. If a playbook is not idempotent, do not add it to the codebase.

All playbooks should solve a task in the simplest possible way that will work. 
All playbooks must require the least amount of external dependencies possible.

All details related to all projects of the high desert institute are contained in the git repository available at [https://github.com/High-Desert-Institute/HighDesertInstitute.org](https://github.com/High-Desert-Institute/HighDesertInstitute.org) which renders to the website at [https://highdesertinstitute.org/](https://highdesertinstitute.org/). All the projects and guilds have all their notes and work and details hosted either in this repository or in submodules of this repository, organized into their project directories. Therefore, by recursively pulling this entire repository, you can have 100% of everything we are working on or doing. This provides valuable and complete context to users or agents working to understand any part of what we're doing.
