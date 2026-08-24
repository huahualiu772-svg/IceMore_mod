Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"
New-Item -ItemType Directory -Force -Path "$out\block" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\item" | Out-Null

# Ice palette mapped from vanilla iron grayscale: dark->deep blue, light->bright cyan
$pal = @{
    '.' = $null
    '0' = [System.Drawing.Color]::FromArgb(25,48,82)     # outline (vanilla #333)
    '1' = [System.Drawing.Color]::FromArgb(42,82,128)    # dark (vanilla #555)
    '2' = [System.Drawing.Color]::FromArgb(58,110,168)   # mid-dark (vanilla #777)
    '3' = [System.Drawing.Color]::FromArgb(74,140,205)   # mid (vanilla #999)
    '4' = [System.Drawing.Color]::FromArgb(100,170,225)  # mid-light (vanilla #BBB)
    '5' = [System.Drawing.Color]::FromArgb(140,200,240)  # light (vanilla #DDD)
    '6' = [System.Drawing.Color]::FromArgb(180,225,250)  # highlight (vanilla #FFF)
    '7' = [System.Drawing.Color]::FromArgb(50,195,240)   # ice glow
    '8' = [System.Drawing.Color]::FromArgb(120,225,250)  # ice glow bright
    'h' = [System.Drawing.Color]::FromArgb(80,55,35)     # handle dark
    'j' = [System.Drawing.Color]::FromArgb(130,90,55)    # handle light
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
# ice_ether_block - vanilla ice block style with a glow vein
Draw-Pixels "$out\block\ice_ether_block.png" @(
    "5555555555555554",
    "5444444444444443",
    "5433333333333332",
    "5433333733333332",
    "5433337773333332",
    "5433333733333332",
    "5433333733333332",
    "5477777877777332",
    "5433333733333332",
    "5433333733333332",
    "5433337773333332",
    "5433333733333332",
    "5433333333333332",
    "5433333333333332",
    "5322222222222221",
    "4321111111111110"
)

Write-Host "=== Materials ==="
# ice_ether_ingot - vanilla iron_ingot shape, ice colors
Draw-Pixels "$out\item\ice_ether_ingot.png" @(
    "................",
    "................",
    "................",
    "....00000000....",
    "...0111111110...",
    "..012222222110..",
    ".01223333332110.",
    ".01233333333210.",
    ".01233337733310.",
    ".01233333333210.",
    ".01223333332110.",
    "..011222222100..",
    "...001111110....",
    "....00000000....",
    "................",
    "................"
)

# ice_stick - vanilla stick shape, ice colors
Draw-Pixels "$out\item\ice_stick.png" @(
    "................",
    "..............0.",
    ".............01.",
    "............012.",
    "...........0123.",
    "..........0123..",
    ".........0123...",
    "........0123....",
    ".......0123.....",
    "......0123......",
    ".....0123.......",
    "....0123........",
    "...0123.........",
    "..0123..........",
    ".0123...........",
    "0123............"
)

Write-Host "=== Tools (vanilla shapes) ==="
# ice_sword - vanilla iron_sword shape
Draw-Pixels "$out\item\ice_sword.png" @(
    "................",
    "......00........",
    ".....0110.......",
    ".....01210......",
    "....012210......",
    "....012210......",
    "....012210......",
    "....012210......",
    "...0122210......",
    "..001222100.....",
    ".00..0110..00...",
    "0....0110....0..",
    ".....0110.......",
    ".....0hj0.......",
    "....0hjjh0......",
    "....00000......."
)

# ice_pickaxe - vanilla iron_pickaxe shape
Draw-Pixels "$out\item\ice_pickaxe.png" @(
    "................",
    ".00..........00.",
    "0110........0110",
    "012210......0121",
    ".012210000012210",
    "..0122222222210.",
    "...01222222210..",
    ".....012210.....",
    "....0122210.....",
    "...0122210......",
    "..0122210.......",
    ".0122210........",
    "0122210.........",
    "122210..........",
    "12210...........",
    "000............."
)

# ice_axe - vanilla iron_axe shape
Draw-Pixels "$out\item\ice_axe.png" @(
    "................",
    "....0000........",
    "...011110.......",
    "..01222210......",
    ".0122333210.....",
    "0122333333210...",
    "0122333333210...",
    ".01223333210....",
    "..012233210.....",
    "...0011200......",
    ".....012........",
    "....0122........",
    "...01222........",
    "..012222........",
    ".0122221........",
    "0122221........."
)

# ice_shovel - vanilla iron_shovel shape
Draw-Pixels "$out\item\ice_shovel.png" @(
    "................",
    "................",
    ".....0000.......",
    "....011110......",
    "...01222210.....",
    "..0123333210....",
    "..0123333210....",
    "..0123333210....",
    "...01233210.....",
    "....012210......",
    ".....0110.......",
    "......01........",
    "......01........",
    "......01........",
    "......01........",
    "......00........"
)

# ice_hoe - vanilla iron_hoe shape
Draw-Pixels "$out\item\ice_hoe.png" @(
    "................",
    "................",
    "....0000000.....",
    "...011111110....",
    "..01222222210...",
    "..01233333210...",
    "...011111110....",
    "....00..00......",
    "........0.......",
    ".......01.......",
    "......012.......",
    ".....0122.......",
    "....01222.......",
    "...012221.......",
    "..012221........",
    ".012221........."
)

Write-Host "=== Armor (vanilla shapes) ==="
# ice_helmet - vanilla iron_helmet shape
Draw-Pixels "$out\item\ice_helmet.png" @(
    "................",
    "................",
    "...0000000000...",
    "..011111111110..",
    ".01222222222110.",
    ".01233333333210.",
    ".01233000033210.",
    ".01233000033210.",
    ".01233333333210.",
    ".01233333333210.",
    ".01222222222110.",
    "..011111111110..",
    "...0000000000...",
    "................",
    "................",
    "................"
)

# ice_chestplate - vanilla iron_chestplate shape
Draw-Pixels "$out\item\ice_chestplate.png" @(
    "................",
    "..00........00..",
    ".0110......0110.",
    "012120....021210",
    "012120000021210.",
    "012211111112210.",
    "012227777722210.",
    "012227777722210.",
    "012222222222210.",
    "012222222222210.",
    ".01221000012210.",
    "..01210..01210..",
    "...0120..0210...",
    "....010..010....",
    "....000..000....",
    "................"
)

# ice_leggings - vanilla iron_leggings shape
Draw-Pixels "$out\item\ice_leggings.png" @(
    "................",
    "...0000000000...",
    "..011111111110..",
    ".01222222222110.",
    ".01233333333210.",
    ".01233333333210.",
    ".01233000033210.",
    "..01210..01210..",
    "...0120..0210...",
    "...0120..0210...",
    "...0120..0210...",
    "...0120..0210...",
    "...0110..0110...",
    "...0100..0010...",
    "...0000..0000...",
    "................"
)

# ice_boots - vanilla iron_boots shape
Draw-Pixels "$out\item\ice_boots.png" @(
    "................",
    "................",
    "..0000....0000..",
    ".01110....01110.",
    ".012110..011210.",
    ".01221100112210.",
    ".01222111122210.",
    ".01222111122210.",
    ".01122111122110.",
    ".01112112211110.",
    "000000....000000",
    "................",
    "................",
    "................",
    "................",
    "................"
)

Write-Host "=== Buckets (vanilla shapes) ==="
# ice_bucket - vanilla bucket shape
Draw-Pixels "$out\item\ice_bucket.png" @(
    "................",
    "................",
    "...0000000000...",
    "..011111111110..",
    ".01222222222110.",
    ".01233333333210.",
    "..0123333333210.",
    "...01233333210..",
    "....012333210...",
    ".....0123210....",
    "......01210.....",
    ".......010......",
    "........0.......",
    "................",
    "................",
    "................"
)

# ice_bucket_filled - vanilla water_bucket shape, top filled with glowing ice
Draw-Pixels "$out\item\ice_bucket_filled.png" @(
    "................",
    "................",
    "...0000000000...",
    "..077777777770..",
    ".07888888888870.",
    ".01222222222110.",
    ".01233333333210.",
    "..0123333333210.",
    "...01233333210..",
    "....012333210...",
    ".....0123210....",
    "......01210.....",
    ".......010......",
    "........0.......",
    "................",
    "................"
)

Write-Host "`nAll vanilla-based 16x16 textures generated!"

# Make previews
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
Write-Host "Previews generated"