import os

while True:
    command = input("$ ")
    
    if command == "ls":
        os.system("ls")
    elif command == "ls -a":
        os.system("ls -a")
    elif command == "ls -l":
        os.system("ls -l")
    elif command.startswith("mkdir"):
        os.system(command)
    elif command.startswith("cat"):
        os.system(command)
    elif command.startswith("grep"):
        os.system(command)
    elif command.startswith("cd"):
        os.chdir(command[3:])
    elif command == "clear":
        os.system("clear")
    elif command.startswith("rm -r"):
        os.system(command)
    elif command.startswith("rm"):
        os.system(command)
    elif command == "whoami":
        os.system("whoami")
    elif command.startswith("nano"):
        os.system(command)
    elif command == "exit":
        break
    else:
        print("Comando no válido")

