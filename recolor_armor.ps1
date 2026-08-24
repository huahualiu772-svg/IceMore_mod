Add-Type -AssemblyName System.Drawing

$src = "D:\minecraftMod\IceMore_mod\mc_vanilla_extract"
$dst = "D:\minecraftMod\IceMore_mod\src\main\resources\assets\icecubemod\textures\item"

# v2.0 ice blue ramp, indexed by brightness bucket 0..11
$ramp = @(
    [System.Drawing.Color]::FromArgb(25,48,82),    # 0: #193052 outline
    [System.Drawing.Color]::FromArgb(30,58,95),    # 1: #1E3A5F
    [System.Drawing.Color]::FromArgb(42,82,128),   # 2: #2A5280
    [System.Drawing.Color]::FromArgb(46,90,138),   # 3: #2E5A8A
    [System.Drawing.Color]::FromArgb(58,110,168),  # 4: #3A6EA8
    [System.Drawing.Color]::FromArgb(74,140,205),  # 5: #4A8CCD
    [System.Drawing.Color]::FromArgb(90,156,224),  # 6: #5A9CE0
    [System.Drawing.Color]::FromArgb(106,176,216), # 7: #6AB0D8
    [System.Drawing.Color]::FromArgb(140,200,232), # 8: #8CC8E8
    [System.Drawing.Color]::FromArgb(176,224,245), # 9: #B0E0F5
    [System.Drawing.Color]::FromArgb(180,225,250), # 10: #B4E1FA
    [System.Drawing.Color]::FromArgb(224,244,255)  # 11: #E0F4FF
)

function Convert-Armor($vanillaFile, $outFile) {
    $orig = [System.Drawing.Image]::FromFile($vanillaFile)
    $bmp = New-Object System.Drawing.Bitmap($orig.Width, $orig.Height)
    $changed = 0
    for ($y=0; $y -lt $orig.Height; $y++) {
        for ($x=0; $x -lt $orig.Width; $x++) {
            $p = $orig.GetPixel($x,$y)
            if ($p.A -eq 0) { continue }
            # luminance
            $lum = [int](0.299*$p.R + 0.587*$p.G + 0.114*$p.B)
            # map 0..255 -> 0..11
            $idx = [Math]::Min(11, [Math]::Max(0, [int]($lum / 22)))
            $bmp.SetPixel($x,$y,$ramp[$idx])
            $changed++
        }
    }
    $bmp.Save($outFile, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose(); $orig.Dispose()
    Write-Host "  $(Split-Path $outFile -Leaf)  ($changed pixels recolored)"
}

Write-Host "Recoloring vanilla iron armor -> ice blue (exact same shape):"
Convert-Armor "$src\iron_helmet.png"     "$dst\ice_helmet.png"
Convert-Armor "$src\iron_chestplate.png" "$dst\ice_chestplate.png"
Convert-Armor "$src\iron_leggings.png"   "$dst\ice_leggings.png"
Convert-Armor "$src\iron_boots.png"      "$dst\ice_boots.png"

# Also copy to work dir for preview
$work = "D:\minecraftMod\IceMore_mod\textures_redesign\item"
Copy-Item "$dst\ice_helmet.png" "$work\" -Force
Copy-Item "$dst\ice_chestplate.png" "$work\" -Force
Copy-Item "$dst\ice_leggings.png" "$work\" -Force
Copy-Item "$dst\ice_boots.png" "$work\" -Force

# Generate previews
$prev = "D:\minecraftMod\IceMore_mod\textures_redesign\preview"
@("ice_helmet","ice_chestplate","ice_leggings","ice_boots") | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile("$work\$_.png")
    $bmp = New-Object System.Drawing.Bitmap(128,128)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::NearestNeighbor
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::Half
    $g.DrawImage($img,0,0,128,128)
    $bmp.Save("$prev\item_$_.png",[System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose();$bmp.Dispose();$img.Dispose()
}
Write-Host "Previews updated"