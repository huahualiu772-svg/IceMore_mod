Add-Type -AssemblyName System.Drawing

$out = "D:\minecraftMod\IceMore_mod\textures_redesign"

# Palette (same as before)
$pal = @{
    '0' = [System.Drawing.Color]::FromArgb(30,58,95)
    '1' = [System.Drawing.Color]::FromArgb(46,90,138)
    '2' = [System.Drawing.Color]::FromArgb(61,122,176)
    '3' = [System.Drawing.Color]::FromArgb(74,144,200)
    '4' = [System.Drawing.Color]::FromArgb(106,176,216)
    '5' = [System.Drawing.Color]::FromArgb(140,200,232)
    '6' = [System.Drawing.Color]::FromArgb(176,224,245)
    '7' = [System.Drawing.Color]::FromArgb(64,200,240)
    '8' = [System.Drawing.Color]::FromArgb(128,224,248)
    'k' = [System.Drawing.Color]::FromArgb(200,220,235)  # skin tone (pale/cold)
    'm' = [System.Drawing.Color]::FromArgb(180,200,215)  # skin shadow
    'p' = [System.Drawing.Color]::FromArgb(60,100,150)   # hair/robe dark
    'q' = [System.Drawing.Color]::FromArgb(80,130,180)   # robe mid
    't' = [System.Drawing.Color]::FromArgb(100,150,200)  # robe light
}

function Fill-Rect($bmp,$x,$y,$w,$h,$color) {
    for ($yy=0;$yy -lt $h;$yy++){for($xx=0;$xx -lt $w;$xx++){
        $bmp.SetPixel($x+$xx,$y+$yy,$color)
    }}
}
function Draw-Outline($bmp,$x,$y,$w,$h,$color) {
    for ($xx=0;$xx -lt $w;$xx++){$bmp.SetPixel($x+$xx,$y,$color);$bmp.SetPixel($x+$xx,$y+$h-1,$color)}
    for ($yy=0;$yy -lt $h;$yy++){$bmp.SetPixel($x,$y+$yy,$color);$bmp.SetPixel($x+$w-1,$y+$yy,$color)}
}

# ============================================================
# LAYER 1: Helmet + Chestplate + Boots (64x32)
# ============================================================
Write-Host "Generating ice_layer_1.png..."
$bmp = New-Object System.Drawing.Bitmap(64,32)
# Fill all with transparent first (default is transparent for PNG)

# --- HELMET (top-left 32x16 area) ---
# Helmet top (8,0) 8x8 - highlight
Fill-Rect $bmp 8 0 8 8 $pal['5']
$bmp.SetPixel(8,0,$pal['6']);$bmp.SetPixel(9,0,$pal['6']);$bmp.SetPixel(10,0,$pal['6'])
# Helmet bottom (16,0) 8x8 - shadow
Fill-Rect $bmp 16 0 8 8 $pal['2']
# Helmet front (8,8) 8x8 - face plate with eye slit
Fill-Rect $bmp 8 8 8 8 $pal['3']
Fill-Rect $bmp 8 8 8 1 $pal['4']  # top highlight
Fill-Rect $bmp 8 15 8 1 $pal['1'] # bottom shadow
$bmp.SetPixel(9,11,$pal['0']);$bmp.SetPixel(10,11,$pal['0'])  # left eye
$bmp.SetPixel(13,11,$pal['0']);$bmp.SetPixel(14,11,$pal['0'])  # right eye
$bmp.SetPixel(9,12,$pal['7']);$bmp.SetPixel(14,12,$pal['7'])  # glow under eyes
# Helmet back (24,8) 8x8
Fill-Rect $bmp 24 8 8 8 $pal['2']
Fill-Rect $bmp 24 8 8 1 $pal['3']
# Helmet left (0,8) 8x8
Fill-Rect $bmp 0 8 8 8 $pal['4']
Fill-Rect $bmp 0 8 1 8 $pal['5']
# Helmet right (16,8) 8x8
Fill-Rect $bmp 16 8 8 8 $pal['1']

# --- CHESTPLATE (top-right area: x=16..64, y=16..32 but uses upper part) ---
# Actually chestplate is at x=16 y=16 region in standard format
# Chest front (20,20) 8x12
Fill-Rect $bmp 20 20 8 12 $pal['3']
Fill-Rect $bmp 20 20 8 1 $pal['5']   # top highlight
Fill-Rect $bmp 20 31 8 1 $pal['1']   # bottom shadow
Fill-Rect $bmp 20 20 1 12 $pal['4']  # left highlight
Fill-Rect $bmp 27 20 1 12 $pal['2']  # right shadow
$bmp.SetPixel(23,24,$pal['7']);$bmp.SetPixel(24,24,$pal['7'])  # chest glow
$bmp.SetPixel(23,25,$pal['8']);$bmp.SetPixel(24,25,$pal['8'])
# Chest back (36,20) 8x12
Fill-Rect $bmp 36 20 8 12 $pal['2']
Fill-Rect $bmp 36 20 8 1 $pal['3']
# Chest left (16,20) 4x12
Fill-Rect $bmp 16 20 4 12 $pal['4']
Fill-Rect $bmp 16 20 1 12 $pal['5']
# Chest right (28,20) 4x12
Fill-Rect $bmp 28 20 4 12 $pal['1']
# Shoulders (20,16) 4x4 and (28,16) 4x4
Fill-Rect $bmp 20 16 4 4 $pal['4']
Fill-Rect $bmp 20 16 4 1 $pal['5']
Fill-Rect $bmp 28 16 4 4 $pal['2']
Fill-Rect $bmp 28 16 4 1 $pal['3']

# --- BOOTS (bottom-left area: x=0..16, y=16..32) ---
# Left boot front (4,20) 4x12
Fill-Rect $bmp 4 20 4 12 $pal['3']
Fill-Rect $bmp 4 20 4 1 $pal['5']
Fill-Rect $bmp 4 31 4 1 $pal['1']
Fill-Rect $bmp 4 20 1 12 $pal['4']
Fill-Rect $bmp 7 20 1 12 $pal['2']
# Left boot back (12,20) 4x12
Fill-Rect $bmp 12 20 4 12 $pal['2']
# Left boot outer (0,20) 4x12
Fill-Rect $bmp 0 20 4 12 $pal['4']
Fill-Rect $bmp 0 20 1 12 $pal['5']
# Left boot inner (8,20) 4x12
Fill-Rect $bmp 8 20 4 12 $pal['1']
# Right boot front (20,20) -- wait, this overlaps chest. Boots use x=0..16 only for left, and there's no right boot in layer1?
# Actually in 64x32 format, both boots are in the 0-16 x range. Right boot is at different position.
# Let me just fill remaining boot area properly.
# Right boot front is actually at... in old 64x32 format right leg shares with left? No.
# Standard: left boot at x=0..16, right boot isn't in layer1 64x32? 
# Actually for 64x32 armor: boots occupy x=0..32 y=16..32, left boot 0..16, right boot 16..32
# But chestplate is also at x=16..48. Let me reconsider.
# I'll put right boot at x=48..64 y=16..32 area to be safe (often unused)
Fill-Rect $bmp 52 20 4 12 $pal['3']
Fill-Rect $bmp 52 20 4 1 $pal['5']
Fill-Rect $bmp 52 31 4 1 $pal['1']
Fill-Rect $bmp 52 20 1 12 $pal['4']
Fill-Rect $bmp 55 20 1 12 $pal['2']
Fill-Rect $bmp 60 20 4 12 $pal['2']
Fill-Rect $bmp 48 20 4 12 $pal['4']
Fill-Rect $bmp 56 20 4 12 $pal['1']

$bmp.Save("$out\models\armor\ice_layer_1.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "  ice_layer_1.png done"

# ============================================================
# LAYER 2: Leggings (64x32)
# ============================================================
Write-Host "Generating ice_layer_2.png..."
$bmp = New-Object System.Drawing.Bitmap(64,32)

# Leggings front (20,20) 8x12
Fill-Rect $bmp 20 20 8 12 $pal['3']
Fill-Rect $bmp 20 20 8 1 $pal['5']
Fill-Rect $bmp 20 31 8 1 $pal['1']
Fill-Rect $bmp 20 20 1 12 $pal['4']
Fill-Rect $bmp 27 20 1 12 $pal['2']
# knee detail
$bmp.SetPixel(22,26,$pal['7']);$bmp.SetPixel(25,26,$pal['7'])

# Leggings back (36,20) 8x12
Fill-Rect $bmp 36 20 8 12 $pal['2']
Fill-Rect $bmp 36 20 8 1 $pal['3']

# Leggings left (16,20) 4x12
Fill-Rect $bmp 16 20 4 12 $pal['4']
Fill-Rect $bmp 16 20 1 12 $pal['5']

# Leggings right (28,20) 4x12
Fill-Rect $bmp 28 20 4 12 $pal['1']

# Waistband area (16,16) 32x4
Fill-Rect $bmp 16 16 32 4 $pal['2']
Fill-Rect $bmp 16 16 32 1 $pal['3']
Fill-Rect $bmp 20 17 8 2 $pal['3']  # front waist highlight

$bmp.Save("$out\models\armor\ice_layer_2.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "  ice_layer_2.png done"

# ============================================================
# ENTITY SKIN: ice_mage (64x64)
# ============================================================
Write-Host "Generating ice_mage_skin.png..."
$bmp = New-Object System.Drawing.Bitmap(64,64)

# --- HEAD (8x8x8 cube, UV in 0-32 x 0-16) ---
# Head top (8,0) 8x8 - icy hair/hood top
Fill-Rect $bmp 8 0 8 8 $pal['p']
$bmp.SetPixel(8,0,$pal['q']);$bmp.SetPixel(9,0,$pal['q'])
# Head bottom (16,0) 8x8
Fill-Rect $bmp 16 0 8 8 $pal['p']
# Head front (8,8) 8x8 - face
Fill-Rect $bmp 8 8 8 8 $pal['k']
Fill-Rect $bmp 8 8 8 1 $pal['p']  # hood edge
$bmp.SetPixel(10,11,$pal['0']);$bmp.SetPixel(13,11,$pal['0'])  # eyes
$bmp.SetPixel(10,12,$pal['7']);$bmp.SetPixel(13,12,$pal['7'])  # glowing eyes
$bmp.SetPixel(11,14,$pal['m']);$bmp.SetPixel(12,14,$pal['m'])  # mouth
# Head back (24,8) 8x8 - hood
Fill-Rect $bmp 24 8 8 8 $pal['p']
Fill-Rect $bmp 24 8 8 2 $pal['q']
# Head right (0,8) 8x8
Fill-Rect $bmp 0 8 8 8 $pal['p']
Fill-Rect $bmp 7 8 1 8 $pal['k']  # face side
# Head left (16,8) 8x8
Fill-Rect $bmp 16 8 8 8 $pal['p']
Fill-Rect $bmp 16 8 1 8 $pal['k']

# Hat layer (overlay) - hood tip
Fill-Rect $bmp 8 32 8 8 $pal['p']
Fill-Rect $bmp 8 32 8 1 $pal['q']
$bmp.SetPixel(11,33,$pal['7']);$bmp.SetPixel(12,33,$pal['7'])  # frost gem on hood

# --- BODY (8x12x4, UV in 16-48 x 16-32) ---
# Body front (20,20) 8x12 - robe
Fill-Rect $bmp 20 20 8 12 $pal['p']
Fill-Rect $bmp 20 20 8 1 $pal['q']
Fill-Rect $bmp 20 20 1 12 $pal['q']
Fill-Rect $bmp 27 20 1 12 $pal['0']
# robe trim
Fill-Rect $bmp 22 22 4 1 $pal['7']
$bmp.SetPixel(23,25,$pal['8']);$bmp.SetPixel(24,25,$pal['8'])  # chest gem
# Body back (32,20) 8x12 (actually 32,20 in 64x64)
Fill-Rect $bmp 32 20 8 12 $pal['p']
Fill-Rect $bmp 32 20 8 1 $pal['q']
# Body right (16,20) 4x12
Fill-Rect $bmp 16 20 4 12 $pal['q']
# Body left (28,20) 4x12
Fill-Rect $bmp 28 20 4 12 $pal['0']

# --- RIGHT ARM (4x12x4, UV in 40-56 x 16-32) ---
# Right arm front (44,20) 4x12 - sleeve + hand
Fill-Rect $bmp 44 20 4 10 $pal['p']
Fill-Rect $bmp 44 20 4 1 $pal['q']
Fill-Rect $bmp 44 30 4 2 $pal['k']  # hand
# Right arm back (52,20) 4x12
Fill-Rect $bmp 52 20 4 10 $pal['p']
Fill-Rect $bmp 52 30 4 2 $pal['m']
# Right arm right (40,20) 4x12
Fill-Rect $bmp 40 20 4 10 $pal['q']
Fill-Rect $bmp 40 30 4 2 $pal['k']
# Right arm left (48,20) 4x12
Fill-Rect $bmp 48 20 4 10 $pal['0']
Fill-Rect $bmp 48 30 4 2 $pal['m']

# --- LEFT ARM (4x12x4, UV in 32-48 x 48-64 for 1.8+ slim? Actually standard 64x64) ---
# Left arm front (36,52) 4x12
Fill-Rect $bmp 36 52 4 10 $pal['p']
Fill-Rect $bmp 36 52 4 1 $pal['q']
Fill-Rect $bmp 36 62 4 2 $pal['k']
# Left arm back (44,52) 4x12
Fill-Rect $bmp 44 52 4 10 $pal['p']
Fill-Rect $bmp 44 62 4 2 $pal['m']
# Left arm right (32,52) 4x12
Fill-Rect $bmp 32 52 4 10 $pal['0']
Fill-Rect $bmp 32 62 4 2 $pal['m']
# Left arm left (40,52) 4x12
Fill-Rect $bmp 40 52 4 10 $pal['q']
Fill-Rect $bmp 40 62 4 2 $pal['k']

# --- RIGHT LEG (4x12x4, UV in 0-16 x 16-32) ---
# Right leg front (4,20) 4x12 - robe bottom + boot
Fill-Rect $bmp 4 20 4 8 $pal['p']
Fill-Rect $bmp 4 20 4 1 $pal['q']
Fill-Rect $bmp 4 28 4 4 $pal['3']  # ice boot
Fill-Rect $bmp 4 28 4 1 $pal['5']
# Right leg back (12,20) 4x12
Fill-Rect $bmp 12 20 4 8 $pal['p']
Fill-Rect $bmp 12 28 4 4 $pal['2']
# Right leg right (0,20) 4x12
Fill-Rect $bmp 0 20 4 8 $pal['q']
Fill-Rect $bmp 0 28 4 4 $pal['4']
# Right leg left (8,20) 4x12
Fill-Rect $bmp 8 20 4 8 $pal['0']
Fill-Rect $bmp 8 28 4 4 $pal['1']

# --- LEFT LEG (4x12x4, UV in 16-32 x 48-64) ---
# Left leg front (20,52) 4x12
Fill-Rect $bmp 20 52 4 8 $pal['p']
Fill-Rect $bmp 20 52 4 1 $pal['q']
Fill-Rect $bmp 20 60 4 4 $pal['3']
Fill-Rect $bmp 20 60 4 1 $pal['5']
# Left leg back (28,52) 4x12
Fill-Rect $bmp 28 52 4 8 $pal['p']
Fill-Rect $bmp 28 60 4 4 $pal['2']
# Left leg right (16,52) 4x12
Fill-Rect $bmp 16 52 4 8 $pal['0']
Fill-Rect $bmp 16 60 4 4 $pal['1']
# Left leg left (24,52) 4x12
Fill-Rect $bmp 24 52 4 8 $pal['q']
Fill-Rect $bmp 24 60 4 4 $pal['4']

$bmp.Save("$out\entity\ice_mage_skin.png",[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "  ice_mage_skin.png done"

Write-Host "`nAll textures generated!"
Get-ChildItem -Path $out -Recurse -Filter *.png | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    Write-Host "  $($img.Width)x$($img.Height)  $($_.FullName.Replace($out,''))"
    $img.Dispose()
}