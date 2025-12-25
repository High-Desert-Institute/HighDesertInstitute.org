IMPORTANT!

Do not do anything to change the structure or create or remove any files except as instructed by a playbook specific to that task as located in the /agents/playbooks directory. Start there to find out what you are allowed to do and how to do it. If you are unsure about anything, do not change the codebase.

If a new playbook is needed, ask the user for permission to create one. All playbooks must be approved by the user before they can be added to the codebase.

All playbooks must be written in a way that is safe to run multiple times without causing duplication or errors. If a playbook is not idempotent, do not add it to the codebase.

All playbooks should solve a task in the simplest possible way that will work. 
All playbooks must require the least amount of external dependencies possible.