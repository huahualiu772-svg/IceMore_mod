Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"
New-Item -ItemType Directory -Force -Path "$out\models\armor" | Out-Null
New-Item -ItemType Directory -Force -Path "$out\entity" | Out-Null

# v2.0 palette - ice blue ramp, NO glow colors
$pal = @{
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
    # skin
    'k' = [System.Drawing.Color]::FromArgb(200,220,232)
    'm' = [System.Drawing.Color]::FromArgb(160,184,200)
    # robe (dark blue)
    'p' = [System.Drawing.Color]::FromArgb(30,58,95)
    'q' = [System.Drawing.Color]::FromArgb(42,82,128)
    't' = [System.Drawing.Color]::FromArgb(58,110,168)
}

function Fill-Rect($bmp,$x,$y,$w,$h,$color) {
    for ($yy=0;$yy -lt $h;$yy++){for($xx=0;$xx -lt $w;$xx++){
        $bmp.SetPixel($x+$xx,$y+$yy,$color)
    }}
}

# ===== LAYER 1: Helmet + Chestplate + Arms + Boots (64x32) =====
Write-Host "ice_layer_1.png"
$bmp = New-Object System.Drawing.Bitmap(64,32)

# HELMET (32x16 area, top-left)
Fill-Rect $bmp 8 0 8 8 $pal['7']
$bmp.SetPixel(8,0,$pal['8']);$bmp.SetPixel(9,0,$pal['8']);$bmp.SetPixel(10,0,$pal['8'])
Fill-Rect $bmp 16 0 8 8 $pal['3']
Fill-Rect $bmp 8 8 8 8 $pal['4']
Fill-Rect $bmp 8 8 8 1 $pal['6']
Fill-Rect $bmp 8 15 8 1 $pal['2']
$bmp.SetPixel(9,11,$pal['0']);$bmp.SetPixel(10,11,$pal['0'])
$bmp.SetPixel(13,11,$pal['0']);$bmp.SetPixel(14,11,$pal['0'])
Fill-Rect $bmp 24 8 8 8 $pal['3']
Fill-Rect $bmp 24 8 8 1 $pal['4']
Fill-Rect $bmp 0 8 8 8 $pal['5']
Fill-Rect $bmp 0 8 1 8 $pal['6']
Fill-Rect $bmp 16 8 8 8 $pal['2']

# CHESTPLATE (x=16..48, y=16..32)
Fill-Rect $bmp 20 20 8 12 $pal['4']
Fill-Rect $bmp 20 20 8 1 $pal['6']
Fill-Rect $bmp 20 31 8 1 $pal['2']
Fill-Rect $bmp 20 20 1 12 $pal['5']
Fill-Rect $bmp 27 20 1 12 $pal['3']
Fill-Rect $bmp 36 20 8 12 $pal['3']
Fill-Rect $bmp 36 20 8 1 $pal['4']
Fill-Rect $bmp 16 20 4 12 $pal['5']
Fill-Rect $bmp 16 20 1 12 $pal['6']
Fill-Rect $bmp 28 20 4 12 $pal['2']
Fill-Rect $bmp 20 16 4 4 $pal['5']
Fill-Rect $bmp 20 16 4 1 $pal['6']
Fill-Rect $bmp 28 16 4 4 $pal['3']
Fill-Rect $bmp 28 16 4 1 $pal['4']

# RIGHT ARM (x=40..56, y=16..32)
Fill-Rect $bmp 44 20 4 12 $pal['4']
Fill-Rect $bmp 44 20 4 1 $pal['6']
Fill-Rect $bmp 44 31 4 1 $pal['2']
Fill-Rect $bmp 44 20 1 12 $pal['5']
Fill-Rect $bmp 47 20 1 12 $pal['3']
Fill-Rect $bmp 52 20 4 12 $pal['3']
Fill-Rect $bmp 40 20 4 12 $pal['5']
Fill-Rect $bmp 40 20 1 12 $pal['6']
Fill-Rect $bmp 48 20 4 12 $pal['2']

# LEFT ARM (x=0..16, y=16..32) - mirrors right
Fill-Rect $bmp 4 20 4 12 $pal['4']
Fill-Rect $bmp 4 20 4 1 $pal['6']
Fill-Rect $bmp 4 31 4 1 $pal['2']
Fill-Rect $bmp 4 20 1 12 $pal['5']
Fill-Rect $bmp 7 20 1 12 $pal['3']
Fill-Rect $bmp 12 20 4 12 $pal['3']
Fill-Rect $bmp 0 20 4 12 $pal['5']
Fill-Rect $bmp 0 20 1 12 $pal['6']
Fill-Rect $bmp 8 20 4 12 $pal['2']

# BOOTS - right boot at x=48..64, left boot already overlaps with left arm area? 
# In 64x32 old format, boots share leg area. Put right boots at x=48..64
Fill-Rect $bmp 52 20 4 12 $pal['4']
Fill-Rect $bmp 52 20 4 1 $pal['6']
Fill-Rect $bmp 52 31 4 1 $pal['2']
Fill-Rect $bmp 52 20 1 12 $pal['5']
Fill-Rect $bmp 55 20 1 12 $pal['3']
Fill-Rect $bmp 60 20 4 12 $pal['3']
Fill-Rect $bmp 48 20 4 12 $pal['5']
Fill-Rect $bmp 48 20 1 12 $pal['6']
Fill-Rect $bmp 56 20 4 12 $pal['2']

$bmp.Save("$out\models\armor\ice_layer_1.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

# ===== LAYER 2: Leggings (64x32) =====
Write-Host "ice_layer_2.png"
$bmp = New-Object System.Drawing.Bitmap(64,32)

# Waistband
Fill-Rect $bmp 16 16 32 4 $pal['3']
Fill-Rect $bmp 16 16 32 1 $pal['4']
Fill-Rect $bmp 20 17 8 2 $pal['4']

# Right leg front (x=0..16, y=16..32)
Fill-Rect $bmp 4 20 4 12 $pal['4']
Fill-Rect $bmp 4 20 4 1 $pal['6']
Fill-Rect $bmp 4 31 4 1 $pal['2']
Fill-Rect $bmp 4 20 1 12 $pal['5']
Fill-Rect $bmp 7 20 1 12 $pal['3']
Fill-Rect $bmp 12 20 4 12 $pal['3']
Fill-Rect $bmp 0 20 4 12 $pal['5']
Fill-Rect $bmp 0 20 1 12 $pal['6']
Fill-Rect $bmp 8 20 4 12 $pal['2']

# Left leg front (x=16..32? No - in layer2 left leg is at x=16..32 area but chest is there in layer1)
# Actually in 64x32, layer2 leggings: right leg x=0..16, left leg x=16..32? No that's chest in layer1
# Layer2 uses different UV: right leg x=0..16 y=16..32, left leg x=48..64 y=16..32? 
# Standard: left leg front at x=20? No. Let me put left leg at x=48..64 to be safe
Fill-Rect $bmp 52 20 4 12 $pal['4']
Fill-Rect $bmp 52 20 4 1 $pal['6']
Fill-Rect $bmp 52 31 4 1 $pal['2']
Fill-Rect $bmp 52 20 1 12 $pal['5']
Fill-Rect $bmp 55 20 1 12 $pal['3']
Fill-Rect $bmp 60 20 4 12 $pal['3']
Fill-Rect $bmp 48 20 4 12 $pal['5']
Fill-Rect $bmp 48 20 1 12 $pal['6']
Fill-Rect $bmp 56 20 4 12 $pal['2']

$bmp.Save("$out\models\armor\ice_layer_2.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

# ===== ENTITY SKIN: ice_mage (64x64) =====
Write-Host "ice_mage_skin.png"
$bmp = New-Object System.Drawing.Bitmap(64,64)

# HEAD
Fill-Rect $bmp 8 0 8 8 $pal['p']
$bmp.SetPixel(8,0,$pal['q']);$bmp.SetPixel(9,0,$pal['q'])
Fill-Rect $bmp 16 0 8 8 $pal['p']
Fill-Rect $bmp 8 8 8 8 $pal['k']
Fill-Rect $bmp 8 8 8 1 $pal['p']
$bmp.SetPixel(10,11,$pal['0']);$bmp.SetPixel(13,11,$pal['0'])
$bmp.SetPixel(11,14,$pal['m']);$bmp.SetPixel(12,14,$pal['m'])
Fill-Rect $bmp 24 8 8 8 $pal['p']
Fill-Rect $bmp 24 8 8 2 $pal['q']
Fill-Rect $bmp 0 8 8 8 $pal['p']
Fill-Rect $bmp 7 8 1 8 $pal['k']
Fill-Rect $bmp 16 8 8 8 $pal['p']
Fill-Rect $bmp 16 8 1 8 $pal['k']

# Hat layer (hood overlay)
Fill-Rect $bmp 8 32 8 8 $pal['p']
Fill-Rect $bmp 8 32 8 1 $pal['q']

# BODY
Fill-Rect $bmp 20 20 8 12 $pal['p']
Fill-Rect $bmp 20 20 8 1 $pal['q']
Fill-Rect $bmp 20 20 1 12 $pal['q']
Fill-Rect $bmp 27 20 1 12 $pal['0']
Fill-Rect $bmp 22 22 4 1 $pal['t']
Fill-Rect $bmp 32 20 8 12 $pal['p']
Fill-Rect $bmp 32 20 8 1 $pal['q']
Fill-Rect $bmp 16 20 4 12 $pal['q']
Fill-Rect $bmp 28 20 4 12 $pal['0']

# RIGHT ARM
Fill-Rect $bmp 44 20 4 10 $pal['p']
Fill-Rect $bmp 44 20 4 1 $pal['q']
Fill-Rect $bmp 44 30 4 2 $pal['k']
Fill-Rect $bmp 52 20 4 10 $pal['p']
Fill-Rect $bmp 52 30 4 2 $pal['m']
Fill-Rect $bmp 40 20 4 10 $pal['q']
Fill-Rect $bmp 40 30 4 2 $pal['k']
Fill-Rect $bmp 48 20 4 10 $pal['0']
Fill-Rect $bmp 48 30 4 2 $pal['m']

# LEFT ARM
Fill-Rect $bmp 36 52 4 10 $pal['p']
Fill-Rect $bmp 36 52 4 1 $pal['q']
Fill-Rect $bmp 36 62 4 2 $pal['k']
Fill-Rect $bmp 44 52 4 10 $pal['p']
Fill-Rect $bmp 44 62 4 2 $pal['m']
Fill-Rect $bmp 32 52 4 10 $pal['0']
Fill-Rect $bmp 32 62 4 2 $pal['m']
Fill-Rect $bmp 40 52 4 10 $pal['q']
Fill-Rect $bmp 40 62 4 2 $pal['k']

# RIGHT LEG
Fill-Rect $bmp 4 20 4 8 $pal['p']
Fill-Rect $bmp 4 20 4 1 $pal['q']
Fill-Rect $bmp 4 28 4 4 $pal['4']
Fill-Rect $bmp 4 28 4 1 $pal['6']
Fill-Rect $bmp 12 20 4 8 $pal['p']
Fill-Rect $bmp 12 28 4 4 $pal['3']
Fill-Rect $bmp 0 20 4 8 $pal['q']
Fill-Rect $bmp 0 28 4 4 $pal['5']
Fill-Rect $bmp 8 20 4 8 $pal['0']
Fill-Rect $bmp 8 28 4 4 $pal['2']

# LEFT LEG
Fill-Rect $bmp 20 52 4 8 $pal['p']
Fill-Rect $bmp 20 52 4 1 $pal['q']
Fill-Rect $bmp 20 60 4 4 $pal['4']
Fill-Rect $bmp 20 60 4 1 $pal['6']
Fill-Rect $bmp 28 52 4 8 $pal['p']
Fill-Rect $bmp 28 60 4 4 $pal['3']
Fill-Rect $bmp 16 52 4 8 $pal['0']
Fill-Rect $bmp 16 60 4 4 $pal['2']
Fill-Rect $bmp 24 52 4 8 $pal['q']
Fill-Rect $bmp 24 60 4 4 $pal['5']

$bmp.Save("$out\entity\ice_mage_skin.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

Write-Host "`nArmor layers + skin done (v2.0, no glow)"