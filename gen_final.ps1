Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"
New-Item -ItemType Directory -Force -Path "$out\block" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item\material" | Out-Null

# ===== LOCKED 13-color palette from TEXTURE_PROMPTS.md =====
$pal = @{
    '.' = $null
    '0' = [System.Drawing.Color]::FromArgb(30,58,95)     # Deepest #1E3A5F
    '1' = [System.Drawing.Color]::FromArgb(46,90,138)    # Shadow #2E5A8A
    '2' = [System.Drawing.Color]::FromArgb(61,122,176)   # Base-Dk #3D7AB0
    '3' = [System.Drawing.Color]::FromArgb(74,144,200)   # Base #4A90C8
    '4' = [System.Drawing.Color]::FromArgb(106,176,216)  # Base-Lt #6AB0D8
    '5' = [System.Drawing.Color]::FromArgb(140,200,232)  # Hi-Lt #8CC8E8
    '6' = [System.Drawing.Color]::FromArgb(176,224,245)  # Specular #B0E0F5
    '7' = [System.Drawing.Color]::FromArgb(64,200,240)   # Glow-Dk #40C8F0
    '8' = [System.Drawing.Color]::FromArgb(128,224,248)  # Glow-Brt #80E0F8
    '9' = [System.Drawing.Color]::FromArgb(92,64,48)     # Wood-Dk #5C4030
    'a' = [System.Drawing.Color]::FromArgb(120,85,60)    # Wood-Md #78553C
    'b' = [System.Drawing.Color]::FromArgb(150,110,75)   # Wood-Lt #966E4B
    'c' = [System.Drawing.Color]::FromArgb(176,136,104)  # cardboard #B08868
    'd' = [System.Drawing.Color]::FromArgb(140,108,80)   # cardboard dark
    'e' = [System.Drawing.Color]::FromArgb(210,180,150)  # cardboard light
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

Write-Host "=== Block (cross glow + frost edges) ==="
Draw-Pixels "$out\block\ice_ether_block.png" @(
    "5555555555555554",
    "5644444444444443",
    "5433333733333332",
    "5433333733333332",
    "5433377777333332",
    "5433333733333332",
    "5433333733333332",
    "5477777877777332",
    "5433333733333332",
    "5433333733333332",
    "5433377777333332",
    "5433333733333332",
    "5433333733333332",
    "5433333333333332",
    "5322222222222221",
    "4321111111111110"
)

Write-Host "=== Materials ==="
# ice_ether_ingot - rounded coin shape, center glow
Draw-Pixels "$out\item\ice_ether_ingot.png" @(
    "................",
    "................",
    "................",
    "....00000000....",
    "...0155555510...",
    "..015666666510..",
    ".01566777766510.",
    ".05667888876651.",
    ".05667888876651.",
    ".01566777766510.",
    "..015666666510..",
    "...0155555510...",
    "....00000000....",
    "................",
    "................",
    "................"
)

# ice_stick - 3px wide diagonal top-right to bottom-left, faceted
Draw-Pixels "$out\item\ice_stick.png" @(
    "................",
    "..............0.",
    ".............05.",
    "............054.",
    "...........0543.",
    "..........0543..",
    ".........0543...",
    "........0543....",
    ".......0543.....",
    "......0543......",
    ".....0543.......",
    "....0543........",
    "...0543.........",
    "..0543..........",
    ".0543...........",
    "0543............"
)

Write-Host "=== Tools (wood handles + ice glow) ==="
# ice_sword - 45deg blade, wooden crossguard+grip, cyan pommel, runes on blade
Draw-Pixels "$out\item\ice_sword.png" @(
    "................",
    "......00........",
    ".....0660.......",
    ".....05750......",
    "....0573750.....",
    "....0537350.....",
    "....0573750.....",
    "....0537350.....",
    "...055737550....",
    "..00999799900...",
    ".09..09990..90..",
    "0....09990....0.",
    ".....09990......",
    ".....09a90......",
    "....09aba90.....",
    "....00700......."
)

# ice_pickaxe - T-shape, wooden diagonal handle, glow at tips
Draw-Pixels "$out\item\ice_pickaxe.png" @(
    "................",
    ".00..........00.",
    "0760........0670",
    "06540......04560",
    ".05430000003450.",
    "..054333333450..",
    "...0554444550...",
    ".....0990.......",
    "....099990......",
    "...0999990......",
    "..0999990.......",
    ".0999990........",
    "0999990.........",
    "999990..........",
    "99990...........",
    "000............."
)

# ice_axe - curved blade upper-right, glow core, wooden handle
Draw-Pixels "$out\item\ice_axe.png" @(
    "................",
    "....0000........",
    "...066660.......",
    "..06555560......",
    ".06544774560....",
    "06544777744560..",
    "06544777744560..",
    ".06544774560....",
    "..06555560......",
    "...009900.......",
    ".....099........",
    "....0999........",
    "...09999........",
    "..099999........",
    ".0999990........",
    "0999990........."
)

# ice_shovel - spade top, glow center, wooden handle down
Draw-Pixels "$out\item\ice_shovel.png" @(
    "................",
    "................",
    ".....0000.......",
    "....066660......",
    "...06555560.....",
    "..0654774560....",
    "..06547874560...",
    "..0654774560....",
    "...06544560.....",
    "....065560......",
    ".....0660.......",
    "......09........",
    "......09........",
    "......09........",
    "......09........",
    "......00........"
)

# ice_hoe - horizontal blade top, glow center, wooden handle diagonal
Draw-Pixels "$out\item\ice_hoe.png" @(
    "................",
    "................",
    "....0000000.....",
    "...066666660....",
    "..065547745560..",
    "..065478874560..",
    "...0655555560...",
    "....00..00......",
    "........0.......",
    ".......09.......",
    "......099.......",
    ".....0999.......",
    "....09999.......",
    "...099999.......",
    "..099999........",
    ".099999........."
)

Write-Host "=== Armor (cyan glow accents) ==="
# ice_helmet - rounded dome, visor, frost ridge, glow on sides
Draw-Pixels "$out\item\ice_helmet.png" @(
    "................",
    "................",
    "...0000000000...",
    "..056666666650..",
    ".05644444444650.",
    ".05643333334650.",
    ".05643000034650.",
    ".07643000034670.",
    ".05643333334650.",
    ".05643333334650.",
    ".05644444444650.",
    "..055555555550..",
    "...0000000000...",
    "................",
    "................",
    "................"
)

# ice_chestplate - shoulder pads, center cyan gem, waist straps
Draw-Pixels "$out\item\ice_chestplate.png" @(
    "................",
    "..00........00..",
    ".0560......0650.",
    "065460....064560",
    "065460000064560.",
    "065446666644560.",
    "065447777744560.",
    "065447887744560.",
    "065447777744560.",
    "065446666644560.",
    ".06544000044560.",
    "..06540..04560..",
    "...0650..0560...",
    "....060..060....",
    "....000..000....",
    "................"
)

# ice_leggings - knee guards with cyan glow, dark belt
Draw-Pixels "$out\item\ice_leggings.png" @(
    "................",
    "...0000000000...",
    "..056666666650..",
    ".05644444444650.",
    ".05643333334650.",
    ".05643333334650.",
    ".05643000034650.",
    "..06540..04560..",
    "...0650..0560...",
    "...0650..0560...",
    "...0750..0570...",
    "...0650..0560...",
    "...0540..0450...",
    "...0430..0340...",
    "...0000..0000...",
    "................"
)

# ice_boots - pointed toes, cyan toe glow, frosted cuff
Draw-Pixels "$out\item\ice_boots.png" @(
    "................",
    "................",
    "..0000....0000..",
    ".05660....06650.",
    ".065460..064560.",
    ".06544600644560.",
    ".06544466444560.",
    ".06544466444560.",
    ".05644466444650.",
    ".05564466446550.",
    "000700....007000",
    "................",
    "................",
    "................",
    "................",
    "................"
)

Write-Host "=== Buckets ==="
# ice_bucket (empty) - tapered cylinder, frost rim, wooden handle
Draw-Pixels "$out\item\ice_bucket.png" @(
    "................",
    "................",
    "...0000000000...",
    "..056666666650..",
    ".05644444444650.",
    ".05643333334650.",
    "..056433334650..",
    "...0564334650...",
    "....05643650....",
    ".....0564650....",
    "......056650....",
    ".......0550.....",
    "........00......",
    "................",
    "................",
    "................"
)

# ice_bucket_filled - glowing cyan liquid aurora
Draw-Pixels "$out\item\ice_bucket_filled.png" @(
    "................",
    "................",
    "...0000000000...",
    "..078888888870..",
    ".07888777888870.",
    ".05644444444650.",
    ".05643333334650.",
    "..056433334650..",
    "...0564334650...",
    "....05643650....",
    ".....0564650....",
    "......056650....",
    ".......0550.....",
    "........00......",
    "................",
    "................"
)

Write-Host "=== Cardboard ==="
Draw-Pixels "$out\item\material\cardboard.png" @(
    "................",
    "................",
    "....00000000....",
    "...0cccccccc0...",
    "..0ceeeeeeeec0..",
    ".0ceccccccccec0.",
    ".0cecddddddcec0.",
    ".0cecdedededec0.",
    ".0cecddddddcec0.",
    ".0ceccccccccec0.",
    ".0ceeeeeeeeec0..",
    "..0ccccccccc0...",
    "...000000000....",
    "................",
    "................",
    "................"
)

Write-Host "`nAll textures generated with locked palette!"

# Previews
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