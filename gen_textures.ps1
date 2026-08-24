Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"
New-Item -ItemType Directory -Force -Path $out | Out-Null
New-Item -ItemType Directory -Force -Path "$out\block" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\models\armor" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\entity" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\preview" | Out-Null

# ===== Unified ice palette =====
$pal = @{
    '.' = $null  # transparent
    '0' = [System.Drawing.Color]::FromArgb(30,58,95)     # outline / deepest
    '1' = [System.Drawing.Color]::FromArgb(46,90,138)    # shadow
    '2' = [System.Drawing.Color]::FromArgb(61,122,176)   # base dark
    '3' = [System.Drawing.Color]::FromArgb(74,144,200)   # base (deeper blue)
    '4' = [System.Drawing.Color]::FromArgb(106,176,216)  # base light
    '5' = [System.Drawing.Color]::FromArgb(140,200,232)  # highlight
    '6' = [System.Drawing.Color]::FromArgb(176,224,245)  # specular (less white)
    '7' = [System.Drawing.Color]::FromArgb(64,200,240)   # glow (deeper cyan)
    '8' = [System.Drawing.Color]::FromArgb(128,224,248)  # glow bright
    '9' = [System.Drawing.Color]::FromArgb(92,64,48)     # dark wood handle
    'a' = [System.Drawing.Color]::FromArgb(120,85,60)    # wood handle
    'b' = [System.Drawing.Color]::FromArgb(150,110,75)   # wood light
}

function Draw-Pixels($path, $rows) {
    $bmp = New-Object System.Drawing.Bitmap(16,16)
    for ($y=0; $y -lt 16; $y++) {
        $row = $rows[$y]
        for ($x=0; $x -lt 16; $x++) {
            $ch = $row[$x].ToString()
            $col = $pal[$ch]
            if ($col -ne $null) { $bmp.SetPixel($x,$y,$col) }
        }
    }
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "  $path"
}

function Make-Preview($src,$dst) {
    $img = [System.Drawing.Image]::FromFile($src)
    $bmp = New-Object System.Drawing.Bitmap(128,128)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $g.DrawImage($img,0,0,128,128)
    $bmp.Save($dst,[System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose();$bmp.Dispose();$img.Dispose()
}

Write-Host "=== Block ==="
# ice_ether_block - clean cracked ice with glow vein, layered shading
Draw-Pixels "$out\block\ice_ether_block.png" @(
    "5555555555555554",
    "5444444444444443",
    "5433333733333332",
    "5433333733333332",
    "5433377777333332",
    "5433333733333332",
    "5433333733333332",
    "5477777877777332",
    "5433333733333332",
    "5433333733333332",
    "5433333733333332",
    "5433377777333332",
    "5433333733333332",
    "5433333733333332",
    "5322222222222221",
    "4321111111111110"
)

Write-Host "=== Basic items ==="
# ice_ether_ingot
Draw-Pixels "$out\item\ice_ether_ingot.png" @(
    "................",
    "................",
    "................",
    "....00000000....",
    "...0555555550...",
    "..054444444430..",
    ".05433333333320.",
    ".05433377333320.",
    ".05433333333320.",
    ".04322222222210.",
    "..032111111100..",
    "...000000000....",
    "................",
    "................",
    "................",
    "................"
)

# ice_stick - 3px wide diagonal with highlight/core/shadow
Draw-Pixels "$out\item\ice_stick.png" @(
    "................",
    "..............5.",
    ".............53.",
    "............532.",
    "...........532..",
    "..........532...",
    ".........532....",
    "........532.....",
    ".......532......",
    "......532.......",
    ".....532........",
    "....532.........",
    "...532..........",
    "..532...........",
    ".532............",
    "532............."
)

Write-Host "=== Tools ==="
# ice_sword
Draw-Pixels "$out\item\ice_sword.png" @(
    "................",
    "......00........",
    ".....0660.......",
    ".....05350......",
    "....053350......",
    "....053350......",
    "....053350......",
    "....053350......",
    "...0533350......",
    "..005333500.....",
    ".00..0550..00...",
    "0.....0.....0...",
    "......0.........",
    ".....0a0........",
    "....0aaa0.......",
    ".....000........"
)

# ice_pickaxe
Draw-Pixels "$out\item\ice_pickaxe.png" @(
    "................",
    ".00..........00.",
    "0550........0550",
    "05350......05350",
    ".05350000005350.",
    "..053333333350..",
    "...0555555550...",
    ".....033330.....",
    "....0333330.....",
    "...0333330......",
    "..0333330.......",
    ".0333330........",
    "0333330.........",
    "333330..........",
    "33330...........",
    "000............."
)

# ice_axe
Draw-Pixels "$out\item\ice_axe.png" @(
    "................",
    "....0000........",
    "...055550.......",
    "..05444450......",
    ".0543333450.....",
    "054333333450....",
    "0543333333450...",
    ".05433333450....",
    "..054333450.....",
    "...0055500......",
    ".....030........",
    "....0330........",
    "...03330........",
    "..033330........",
    ".0333330........",
    "0333330........."
)

# ice_shovel
Draw-Pixels "$out\item\ice_shovel.png" @(
    "................",
    "................",
    ".....0000.......",
    "....055550......",
    "...05444450.....",
    "..0543333450....",
    "..0543333450....",
    "..0543333450....",
    "...05433450.....",
    "....054450......",
    ".....0550.......",
    "......03........",
    "......03........",
    "......03........",
    "......03........",
    "......00........"
)

# ice_hoe
Draw-Pixels "$out\item\ice_hoe.png" @(
    "................",
    "................",
    "....0000000.....",
    "...055555550....",
    "..05444444450...",
    "..054333333450..",
    "...0555555550...",
    "....00..00......",
    "........0.......",
    ".......03.......",
    "......033.......",
    ".....0333.......",
    "....03333.......",
    "...033333.......",
    "..033333........",
    ".033333........."
)

Write-Host "=== Armor items ==="
# ice_helmet
Draw-Pixels "$out\item\ice_helmet.png" @(
    "................",
    "................",
    "...0000000000...",
    "..055555555550..",
    ".05444444444450.",
    ".054333333333450",
    ".054330000333450",
    ".054330000333450",
    ".054333333333450",
    ".054333333333450",
    ".04322222222210.",
    "..032111111100..",
    "...0000000000...",
    "................",
    "................",
    "................"
)

# ice_chestplate
Draw-Pixels "$out\item\ice_chestplate.png" @(
    "................",
    "..00........00..",
    ".0550......0550.",
    "054450....054450",
    "0543450000543450",
    "0543345555433450",
    "0543334444333450",
    "0543333773333450",
    "0543333773333450",
    "0543334444333450",
    "0543345555433450",
    ".05433000033450.",
    "..05430..03450..",
    "...0540..0450...",
    "....000..000....",
    "................"
)

# ice_leggings
Draw-Pixels "$out\item\ice_leggings.png" @(
    "................",
    "...0000000000...",
    "..055555555550..",
    ".05444444444450.",
    ".054333333333450",
    ".054333333333450",
    ".054330000333450",
    "..05430..03450..",
    "...0540..0450...",
    "...0540..0450...",
    "...0540..0450...",
    "...0540..0450...",
    "...0430..0340...",
    "...0320..0230...",
    "...0000..0000...",
    "................"
)

# ice_boots
Draw-Pixels "$out\item\ice_boots.png" @(
    "................",
    "................",
    "..0000....0000..",
    ".055550..055550.",
    ".0544450.0544450",
    ".0543345005433450",
    ".0543334505433450",
    ".0543334505433450",
    ".04322210.043221",
    ".03211100..03211",
    "0000000....00000",
    "................",
    "................",
    "................",
    "................",
    "................"
)

Write-Host "=== Buckets ==="
# ice_bucket (empty)
Draw-Pixels "$out\item\ice_bucket.png" @(
    "................",
    "................",
    "...0000000000...",
    "..055555555550..",
    ".05444444444450.",
    ".054333333333450",
    "..0543333333450.",
    "...05433333450..",
    "....054333450...",
    ".....0543450....",
    "......05450.....",
    ".......050......",
    "........0.......",
    "................",
    "................",
    "................"
)

# ice_bucket_filled
Draw-Pixels "$out\item\ice_bucket_filled.png" @(
    "................",
    "................",
    "...0000000000...",
    "..077777777770..",
    ".07888888888870.",
    ".05444444444450.",
    ".054333333333450",
    "..0543333333450.",
    "...05433333450..",
    "....054333450...",
    ".....0543450....",
    "......05450.....",
    ".......050......",
    "........0.......",
    "................",
    "................"
)

# Generate previews for all 16x16
Get-ChildItem -Path $out -Recurse -Filter *.png | Where-Object { $_.DirectoryName -notlike "*preview*" } | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    if ($img.Width -eq 16 -and $img.Height -eq 16) {
        $rel = $_.FullName.Replace($out, "").Replace("\","_").TrimStart("_")
        Make-Preview $_.FullName "$out\preview\$rel"
    }
    $img.Dispose()
}

Write-Host "`nAll 16x16 textures done!"
