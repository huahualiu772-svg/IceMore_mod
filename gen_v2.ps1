Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"
New-Item -ItemType Directory -Force -Path "$out\block" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item\material" | Out-Null

# v2.0 LOCKED PALETTE
$pal = @{
    '.' = $null
    '0' = [System.Drawing.Color]::FromArgb(25,48,82)
    '1' = [System.Drawing.Color]::FromArgb(30,58,95)
    '2' = [System.Drawing.Color]::FromArgb(42,82,128)
    '3' = [System.Drawing.Color]::FromArgb(46,90,138)
    '4' = [System.Drawing.Color]::FromArgb(58,110,168)
    '5' = [System.Drawing.Color]::FromArgb(74,140,205)
    '6' = [System.Drawing.Color]::FromArgb(90,156,224)
    '7' = [System.Drawing.Color]::FromArgb(106,176,216)
    '8' = [System.Drawing.Color]::FromArgb(140,200,232)
    '9' = [System.Drawing.Color]::FromArgb(176,224,245)
    'o' = [System.Drawing.Color]::FromArgb(180,225,250)
    'q' = [System.Drawing.Color]::FromArgb(224,244,255)
    'w' = [System.Drawing.Color]::FromArgb(40,30,11)
    'x' = [System.Drawing.Color]::FromArgb(73,54,21)
    'y' = [System.Drawing.Color]::FromArgb(104,78,30)
    'z' = [System.Drawing.Color]::FromArgb(137,103,39)
    'c' = [System.Drawing.Color]::FromArgb(134,174,253)
    'd' = [System.Drawing.Color]::FromArgb(140,179,254)
    'e' = [System.Drawing.Color]::FromArgb(146,185,254)
    'f' = [System.Drawing.Color]::FromArgb(161,195,255)
    'h' = [System.Drawing.Color]::FromArgb(188,212,255)
    'i' = [System.Drawing.Color]::FromArgb(200,220,255)
    'g' = [System.Drawing.Color]::FromArgb(64,200,240)
    'l' = [System.Drawing.Color]::FromArgb(50,195,240)
    'm' = [System.Drawing.Color]::FromArgb(77,213,245)
    'n' = [System.Drawing.Color]::FromArgb(120,225,250)
    'p' = [System.Drawing.Color]::FromArgb(107,82,52)
    'r' = [System.Drawing.Color]::FromArgb(139,111,71)
    's' = [System.Drawing.Color]::FromArgb(160,133,96)
    't' = [System.Drawing.Color]::FromArgb(196,168,120)
}

function Draw-Pixels($path, $rows) {
    $bmp = New-Object System.Drawing.Bitmap(16,16)
    for ($y=0; $y -lt 16; $y++) {
        for ($x=0; $x -lt 16; $x++) {
            $ch = $rows[$y][$x].ToString()
            $col = $pal[$ch]
            if ($col) { $bmp.SetPixel($x,$y,$col) }
        }
    }
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "  $(Split-Path $path -Leaf)"
}

Write-Host "=== Block ==="
Draw-Pixels "$out\block\ice_ether_block.png" @(
    "hihihcfcfdfhihihi",
    "ifihfhceceifcfhih",
    "hfhfhfhgfhihihih",
    "cfhihfhgfhefcfhi",
    "ifcefhfghfceifhi",
    "hihihfhgfhihihih",
    "ifihfhfghfcfifhi",
    "hihfggg8gggghihi",
    "ifihfhfghfcfifhi",
    "hihihfhgfhihihih",
    "cfhihfhghefcfhih",
    "hfhfhfhgfhihihih",
    "ifcefhceceifcfhi",
    "hihihcfcfdfhihih",
    "ifihfhceceifcfhi",
    "hihihcfcfdfhihih"
)

Write-Host "=== Materials ==="
Draw-Pixels "$out\item\ice_ether_ingot.png" @(
    "................",
    "................",
    "................",
    "....00000000....",
    "...0111111110...",
    "..012222222110..",
    ".01233333332110.",
    ".01234555543210.",
    ".01234566654310.",
    ".01234555543210.",
    ".01223333332110.",
    "..011222222100..",
    "...001111110....",
    "....00000000....",
    "................",
    "................"
)

Draw-Pixels "$out\item\ice_stick.png" @(
    "................",
    "..............w.",
    ".............wx.",
    "............wxy.",
    "...........wxyz.",
    "..........wxyz..",
    ".........wxyz...",
    "........wxyz....",
    ".......wxyz.....",
    "......wxyz......",
    ".....wxyz.......",
    "....wxyz........",
    "...wxyz.........",
    "..wxyz..........",
    ".wxyz...........",
    "wxyz............"
)

Write-Host "=== Tools ==="
Draw-Pixels "$out\item\ice_sword.png" @(
    "................",
    "......00........",
    ".....0880.......",
    ".....07870......",
    "....076670......",
    "....075560......",
    "....065450......",
    "....054340......",
    "...0543340......",
    "..004322300.....",
    ".00..0322..00...",
    "0....0211....0..",
    ".....0110.......",
    ".....0wxy0......",
    "....0wxyx0......",
    "....00000......."
)

Draw-Pixels "$out\item\ice_pickaxe.png" @(
    "................",
    ".00..........00.",
    "0880........0880",
    "07770......07770",
    ".06660000006660.",
    "..055555555550..",
    "...0444444440...",
    ".....03330......",
    "....033330......",
    "...0wxyyz0......",
    "..0wxyyz0.......",
    ".0wxyyz0........",
    "0wxyyz0.........",
    "wxyyz0..........",
    "xyyz0...........",
    "000............."
)

Draw-Pixels "$out\item\ice_axe.png" @(
    "................",
    "....0000........",
    "...088880.......",
    "..08777780......",
    ".0876666780.....",
    "0876555556780...",
    "08765444456780..",
    ".087655556780...",
    "..0876667880....",
    "...0088800......",
    ".....0wxy.......",
    "....0wxyz.......",
    "...0wxyyz.......",
    "..0wxyyz0.......",
    ".0wxyyz0........",
    "0wxyyz0........."
)

Draw-Pixels "$out\item\ice_shovel.png" @(
    "................",
    "................",
    ".....0000.......",
    "....088880......",
    "...08777780.....",
    "..0876666780....",
    "..0876556780....",
    "..0876556780....",
    "...08766780.....",
    "....087780......",
    ".....0880.......",
    "......0wx.......",
    "......0wxy......",
    "......0wxyz.....",
    "......0wxyy.....",
    "......000......."
)

Draw-Pixels "$out\item\ice_hoe.png" @(
    "................",
    "................",
    "....0000000.....",
    "...088888880....",
    "..08776667780...",
    "..08765556780...",
    "...088888880....",
    "....00..00......",
    "........0.......",
    ".......0wx......",
    "......0wxy......",
    ".....0wxyz......",
    "....0wxyyz......",
    "...0wxyyz0......",
    "..0wxyyz0.......",
    ".0wxyyz0........"
)

Write-Host "=== Armor ==="
Draw-Pixels "$out\item\ice_helmet.png" @(
    "................",
    "................",
    "...0000000000...",
    "..088888888880..",
    ".08777777777880.",
    ".08766666666780.",
    ".08766000066780.",
    ".08766000066780.",
    ".08765555556780.",
    ".08765444456780.",
    ".07654444445670.",
    "..065433334560..",
    "...0000000000...",
    "................",
    "................",
    "................"
)

Draw-Pixels "$out\item\ice_chestplate.png" @(
    "................",
    "..00........00..",
    ".0880......0880.",
    "087780....087780",
    "087670000076780.",
    "087667777766780.",
    "087655555556780.",
    "0876544444456780",
    "0876544444456780",
    "087655555556780.",
    ".08765000056780.",
    "..08760..06780..",
    "...0870..0780...",
    "....080..080....",
    "....000..000....",
    "................"
)

Draw-Pixels "$out\item\ice_leggings.png" @(
    "................",
    "...0000000000...",
    "..088888888880..",
    ".08777777777880.",
    ".08766666666780.",
    ".08765555556780.",
    ".08766000066780.",
    "..08760..06780..",
    "...0870..0780...",
    "...0870..0780...",
    "...0760..0670...",
    "...0760..0670...",
    "...0650..0560...",
    "...0540..0450...",
    "...0000..0000...",
    "................"
)

Draw-Pixels "$out\item\ice_boots.png" @(
    "................",
    "................",
    "..0000....0000..",
    ".08880....08880.",
    ".087780..087780.",
    ".08767800876780.",
    ".08766788766780.",
    ".08766788766780.",
    ".08765678765670.",
    ".08865678765680.",
    "000700....007000",
    "................",
    "................",
    "................",
    "................",
    "................"
)

Write-Host "=== Buckets ==="
Draw-Pixels "$out\item\ice_bucket.png" @(
    "................",
    "................",
    "...0000000000...",
    "..088888888880..",
    ".08777777777880.",
    ".08766666666780.",
    "..087655556780..",
    "...0876556780...",
    "....08766780....",
    ".....0876780....",
    "......088780....",
    ".......0880.....",
    "........00......",
    "................",
    "................",
    "................"
)

Draw-Pixels "$out\item\ice_bucket_filled.png" @(
    "................",
    "................",
    "...0000000000...",
    "..0lnnnnnnnnl0..",
    ".0lmnnnnnnnnml0.",
    ".08777777777880.",
    ".08766666666780.",
    "..087655556780..",
    "...0876556780...",
    "....08766780....",
    ".....0876780....",
    "......088780....",
    ".......0880.....",
    "........00......",
    "................",
    "................"
)

Write-Host "=== Cardboard ==="
Draw-Pixels "$out\item\material\cardboard.png" @(
    "................",
    "................",
    "....00000000....",
    "...0rttttttr0...",
    "..0rtsrrrrrstr0.",
    ".0rtsrqqqqqqrts0",
    ".0rtsrppppprts0.",
    ".0rtsrpqqpqprs0.",
    ".0rtsrppppprts0.",
    ".0rtsrqqqqqqrts0",
    ".0rtsrrrrrrrts0.",
    "..0rtttttttr0...",
    "...000000000....",
    "................",
    "................",
    "................"
)

Write-Host "`nAll v2.0 textures generated!"

$prev = "$out\preview"
New-Item -ItemType Directory -Force -Path $prev | Out-Null
Get-ChildItem -Path $out -Recurse -Filter *.png | Where-Object { $_.DirectoryName -notlike "*preview*" } | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    if ($img.Width -eq 16 -and $img.Height -eq 16) {
        $rel = $_.FullName.Replace($out, "").Replace("\","_").TrimStart("_")
        $bmp = New-Object System.Drawing.Bitmap(128,128)
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
        $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
        $g.DrawImage($img,0,0,128,128)
        $bmp.Save("$prev\$rel",[System.Drawing.Imaging.ImageFormat]::Png)
        $g.Dispose();$bmp.Dispose()
    }
    $img.Dispose()
}
Write-Host "Previews done"