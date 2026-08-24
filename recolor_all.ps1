Add-Type -AssemblyName System.Drawing

$van = "D:\minecraftMod\IceMore_mod\mc_vanilla_extract"
$dst = "D:\minecraftMod\IceMore_mod\src\main\resources\assets\icecubemod\textures\item"
$work = "D:\minecraftMod\IceMore_mod\textures_redesign\item"

# v2.0 ice blue ramp
$ramp = @(
    [System.Drawing.Color]::FromArgb(25,48,82),
    [System.Drawing.Color]::FromArgb(30,58,95),
    [System.Drawing.Color]::FromArgb(42,82,128),
    [System.Drawing.Color]::FromArgb(46,90,138),
    [System.Drawing.Color]::FromArgb(58,110,168),
    [System.Drawing.Color]::FromArgb(74,140,205),
    [System.Drawing.Color]::FromArgb(90,156,224),
    [System.Drawing.Color]::FromArgb(106,176,216),
    [System.Drawing.Color]::FromArgb(140,200,232),
    [System.Drawing.Color]::FromArgb(176,224,245),
    [System.Drawing.Color]::FromArgb(180,225,250),
    [System.Drawing.Color]::FromArgb(224,244,255)
)

# cyan liquid ramp for filled bucket
$liquid = @(
    [System.Drawing.Color]::FromArgb(50,195,240),
    [System.Drawing.Color]::FromArgb(77,213,245),
    [System.Drawing.Color]::FromArgb(120,225,250)
)

function Get-Lum($p) { [int](0.299*$p.R + 0.587*$p.G + 0.114*$p.B) }

function Is-Wood($p) {
    # brown: R significantly > B, and R > G
    return ($p.R -gt $p.B + 15) -and ($p.R -ge $p.G - 5) -and ($p.R -gt 40)
}

function Is-Water($p) {
    # blue water: B > R by decent margin, not gray
    return ($p.B -gt $p.R + 20) -and ($p.B -gt 60)
}

function Convert-Tool($vanillaFile, $outFile) {
    $orig = [System.Drawing.Image]::FromFile($vanillaFile)
    $bmp = New-Object System.Drawing.Bitmap(16,16)
    $metal = 0; $wood = 0
    for ($y=0; $y -lt 16; $y++) {
        for ($x=0; $x -lt 16; $x++) {
            $p = $orig.GetPixel($x,$y)
            if ($p.A -eq 0) { continue }
            if (Is-Wood $p) {
                $bmp.SetPixel($x,$y,$p)  # keep original wood handle
                $wood++
            } else {
                $lum = Get-Lum $p
                $idx = [Math]::Min(11, [int]($lum / 22))
                $bmp.SetPixel($x,$y,$ramp[$idx])
                $metal++
            }
        }
    }
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose(); $orig.Dispose()
    Write-Host "  $(Split-Path $outFile -Leaf): metal=$metal wood=$wood"
}

function Convert-GrayOnly($vanillaFile, $outFile) {
    $orig = [System.Drawing.Image]::FromFile($vanillaFile)
    $bmp = New-Object System.Drawing.Bitmap(16,16)
    $cnt = 0
    for ($y=0; $y -lt 16; $y++) {
        for ($x=0; $x -lt 16; $x++) {
            $p = $orig.GetPixel($x,$y)
            if ($p.A -eq 0) { continue }
            $lum = Get-Lum $p
            $idx = [Math]::Min(11, [int]($lum / 22))
            $bmp.SetPixel($x,$y,$ramp[$idx])
            $cnt++
        }
    }
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose(); $orig.Dispose()
    Write-Host "  $(Split-Path $outFile -Leaf): $cnt pixels"
}

function Convert-FilledBucket($vanillaFile, $outFile) {
    $orig = [System.Drawing.Image]::FromFile($vanillaFile)
    $bmp = New-Object System.Drawing.Bitmap(16,16)
    $metal = 0; $water = 0
    for ($y=0; $y -lt 16; $y++) {
        for ($x=0; $x -lt 16; $x++) {
            $p = $orig.GetPixel($x,$y)
            if ($p.A -eq 0) { continue }
            if (Is-Water $p) {
                $lum = Get-Lum $p
                $idx = [Math]::Min(2, [int]($lum / 85))
                $bmp.SetPixel($x,$y,$liquid[$idx])
                $water++
            } else {
                $lum = Get-Lum $p
                $idx = [Math]::Min(11, [int]($lum / 22))
                $bmp.SetPixel($x,$y,$ramp[$idx])
                $metal++
            }
        }
    }
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose(); $orig.Dispose()
    Write-Host "  $(Split-Path $outFile -Leaf): metal=$metal liquid=$water"
}

Write-Host "=== Tools (metal->ice blue, wood handle preserved) ==="
Convert-Tool "$van\iron_sword.png"   "$dst\ice_sword.png"
Convert-Tool "$van\iron_pickaxe.png" "$dst\ice_pickaxe.png"
Convert-Tool "$van\iron_axe.png"     "$dst\ice_axe.png"
Convert-Tool "$van\iron_shovel.png"  "$dst\ice_shovel.png"
Convert-Tool "$van\iron_hoe.png"     "$dst\ice_hoe.png"

Write-Host "=== Ingot (all gray -> ice blue) ==="
Convert-GrayOnly "$van\iron_ingot.png" "$dst\ice_ether_ingot.png"

Write-Host "=== Bucket (all gray -> ice blue) ==="
Convert-GrayOnly "$van\bucket.png" "$dst\ice_bucket.png"

Write-Host "=== Filled bucket (metal->ice blue, water->cyan) ==="
Convert-FilledBucket "$van\water_bucket.png" "$dst\ice_bucket_filled.png"

Write-Host "=== Stick (keep vanilla wood, no recolor) ==="
Copy-Item "$van\stick.png" "$dst\ice_stick.png" -Force
Write-Host "  ice_stick.png: copied as-is (vanilla wood)"

# Sync to work dir + previews
$prev = "D:\minecraftMod\IceMore_mod\textures_redesign\preview"
@("ice_sword","ice_pickaxe","ice_axe","ice_shovel","ice_hoe","ice_ether_ingot","ice_bucket","ice_bucket_filled","ice_stick") | ForEach-Object {
    Copy-Item "$dst\$_.png" "$work\" -Force
    $img = [System.Drawing.Image]::FromFile("$work\$_.png")
    $bmp = New-Object System.Drawing.Bitmap(128,128)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $g.DrawImage($img,0,0,128,128)
    $bmp.Save("$prev\item_$_.png",[System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose();$bmp.Dispose();$img.Dispose()
}
Write-Host "`nAll items recolored from vanilla, previews updated"