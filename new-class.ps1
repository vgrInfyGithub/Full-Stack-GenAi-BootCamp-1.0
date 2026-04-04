param(
    [string]$ClassName = (Get-Date -Format "dd-MMM-yyyy")
)

# Root folder for Bootcamp projects
$root = "C:\Users\vrgo\OneDrive\GenAIProjects"

# Step 1: Create dated folder
$folder = Join-Path $root $ClassName
New-Item -ItemType Directory -Force -Path $folder | Out-Null
cd $folder

# Step 2: Create environment with pip
uv venv $ClassName --python=cpython-3.11.15-windows-x86_64-none --with-pip

# Step 3: Activate environment
& "$folder\$ClassName\Scripts\Activate.ps1"

# Step 4: Install ipykernel
python -m pip install ipykernel

# Step 5: Register kernel with Jupyter
python -m ipykernel install --user --name=$ClassName --display-name "Python 3.11 ($ClassName)"

# Step 6: Create VSCode settings.json for auto kernel selection
$vscodeDir = Join-Path $folder ".vscode"
New-Item -ItemType Directory -Force -Path $vscodeDir | Out-Null

$settings = @{
    "python.defaultInterpreterPath" = "$folder\$ClassName\Scripts\python.exe"
    "jupyter.kernel.defaultKernel"  = "Python 3.11 ($ClassName)"
} | ConvertTo-Json -Depth 3

$settings | Out-File -Encoding UTF8 "$vscodeDir\settings.json"

# Step 7: Launch VSCode in the new folder
code $folder
