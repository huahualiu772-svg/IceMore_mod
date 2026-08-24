# IceMore Mod 纹理提示词工程指南 v2.0

> 冰主题 Minecraft 模组的 AI 纹理生成提示词库
> 基于 Minecraft 1.21.1 原版纹理逐像素分析
> 适用于 Midjourney / DALL-E 3 / Stable Diffusion (含 ControlNet) / Flux
> 设计目标：纹理必须看起来像原版 Minecraft 的铁质工具/护甲，仅将灰色替换为冰蓝色

---

## 0. 版本更新说明

| 版本 | 变更 |
|------|------|
| v2.0 | 基于原版 1.21.1 纹理逐像素分析重写；精确还原原版轮廓/描边/打光；移除不存在的发光/魔法效果；新增 ControlNet img2img 工作流；新增灰度→冰蓝映射表 |
| v1.0 | 通用像素艺术提示词，含魔法发光概念，风格偏概念艺术 |

---

## 1. 原版纹理分析结果

### 1.1 原版铁质工具灰度阶梯（实测值）

| 角色 | Hex | RGB | 用途 |
|------|-----|-----|------|
| 最深描边 | `#181818` | (24,24,24) | 工具外轮廓 |
| 深描边 | `#191919` | (25,25,25) | 护甲外轮廓 |
| 描边(锭/桶) | `#353535` | (53,53,53) | 锭/桶外轮廓 |
| 深色 | `#444444` | (68,68,68) | 工具暗部 |
| 深中色 | `#585858` | (88,88,88) | 过渡暗部 |
| 中暗色 | `#5E5E5E` | (94,94,94) | 锭暗部 |
| 中色 | `#6B6B6B` | (107,107,107) | 护甲中调 |
| 中亮色 | `#727272` | (114,114,114) | 锭/桶中调 |
| 中亮色2 | `#787878` | (120,120,120) | 桶过渡 |
| 亮中色 | `#828282` | (130,130,130) | 锭过渡 |
| 亮中色2 | `#969696` | (150,150,150) | 护甲亮调 |
| 亮色 | `#A8A8A8` | (168,168,168) | 锭/桶亮调 |
| 亮色2 | `#BEBEBE` | (190,190,190) | 工具亮调 |
| 亮色3 | `#C1C1C1` | (193,193,193) | 工具高光 |
| 亮色4 | `#C6C6C6` | (198,198,198) | 护甲高光 |
| 高光 | `#D8D8D8` | (216,216,216) | 通用高光 |
| 最亮 | `#FFFFFF` | (255,255,255) | 最亮镜面点 |

### 1.2 原版木柄色板（实测值）

| 角色 | Hex | RGB |
|------|-----|-----|
| 最深木 | `#281E0B` | (40,30,11) |
| 深木 | `#493615` | (73,54,21) |
| 中木 | `#684E1E` | (104,78,30) |
| 亮木 | `#896727` | (137,103,39) |

### 1.3 原版冰方块色板（实测值）

| 角色 | Hex | RGB |
|------|-----|-----|
| 暗 | `#86AEFD` | (134,174,253) |
| 中暗 | `#8CB3FE` | (140,179,254) |
| 中 | `#92B9FE` | (146,185,254) |
| 亮中 | `#A1C3FF` | (161,195,255) |
| 亮 | `#BCD4FF` | (188,212,255) |
| 最亮 | `#C8DCFF` | (200,220,255) |

### 1.4 原版设计 6 大铁律

1. **极深描边**：所有物品有 1px 描边，颜色接近纯黑（#181818 ~ #353535）
2. **左上打光**：亮色在左上/上方，暗色在右下/下方，严格从左上到右下渐变
3. **有限色板**：每件物品仅用 4-13 种颜色，绝不使用平滑渐变
4. **大量透明**：40-60% 像素为透明（不填满 16x16 画布）
5. **无发光/魔法效果**：原版工具/护甲/锭/桶均无任何自发光，纯粹材质着色
6. **双材质分区**：工具刀身为灰/冰色，手柄为棕色木质，两区界限分明

---

## 2. 灰度 → 冰蓝 色板映射表

这是整个提示词工程的核心：将原版灰度阶梯 1:1 映射为冰蓝色阶。

| 原版灰度 | Hex | → 冰蓝 | Hex | 在提示词中的描述 |
|----------|-----|--------|-----|-----------------|
| `#181818` | 描边 | → `#193052` | 深邃蓝描边 | "near-black blue outline #193052" |
| `#353535` | 描边2 | → `#193052` | 同上 | (同上) |
| `#444444` | 深色 | → `#1E3A5F` | 深海蓝 | "deep ocean blue shadow #1E3A5F" |
| `#585858` | 深中 | → `#2A5280` | 暗钢蓝 | "dark steel blue #2A5280" |
| `#5E5E5E` | 中暗 | → `#2E5A8A` | 深天蓝 | "dark sky blue #2E5A8A" |
| `#6B6B6B` | 中 | → `#3A6EA8` | 中钴蓝 | "medium cobalt blue #3A6EA8" |
| `#727272` | 中亮 | → `#4A8CCD` | 钴蓝 | "cobalt blue #4A8CCD" |
| `#828282` | 亮中 | → `#5A9CE0` | 天蓝 | "sky blue #5A9CE0" |
| `#969696` | 亮 | → `#6AB0D8` | 浅天蓝 | "light sky blue #6AB0D8" |
| `#A8A8A8` | 亮2 | → `#8CC8E8` | 冰蓝 | "ice blue #8CC8E8" |
| `#C1C1C1` | 高光 | → `#B0E0F5` | 镜面冰白 | "specular ice white #B0E0F5" |
| `#D8D8D8` | 高光2 | → `#B4E1FA` | 亮冰白 | "bright ice white #B4E1FA" |
| `#FFFFFF` | 最亮 | → `#E0F4FF` | 极亮冰晶 | "crystal ice white #E0F4FF" |

木柄色板**保持原版不变**：
- `#281E0B` / `#493615` / `#684E1E` / `#896727`

---

## 3. 主风格前缀（v2.0 原版还原版）

### Prefix V · 原版铁器换色风（推荐所有工具/护甲/锭/桶使用）

```
16x16 pixel art sprite, Minecraft 1.21 vanilla item texture style,
exact same pixel layout as vanilla iron tools, no artistic interpretation,
identical silhouette to vanilla iron sword/pickaxe/axe/etc,
dark near-black outline #193052, 7-step color ramp from deep blue to ice white,
upper-left lighting direction, flat shading with hard color steps,
brown wooden handle section using vanilla stick colors #281E0B to #896727,
NO glow, NO magical effects, NO runes, NO particles, NO frost,
transparent background, centered, isolated game asset icon
```

### Prefix B · 冰方块风（仅方块使用）

```
16x16 pixel art tile texture, Minecraft 1.21 vanilla block texture style,
same noise dithering pattern as vanilla ice block,
blue-white color palette #86AEFD to #C8DCFF range,
subtle cyan glow veins #40C8F0 in a plus pattern at center,
flat tile, no 3D, no perspective, seamless tiling edge
```

### Prefix C · 概念艺术风（仅用于设计参考，非最终纹理）

```
high resolution concept art reference for a Minecraft mod texture,
fantasy ice weapon matching vanilla iron tool silhouette,
centered on transparent background, upper-left studio lighting,
crystalline ice blue material, no glow, no magical effects,
game asset design sheet, 8K, for downscaling to 16x16 pixel art
```

---

## 4. 14 个物品的原版还原提示词

> 每个提示词都明确引用原版对应物品的像素轮廓
> 格式：`[Prefix V] + [原版轮廓描述] + [冰蓝换色指令] + [负向提示词]`

---

### 4.1 冰以太方块 Ice Ether Block
**原版参考**：vanilla `ice.png` / `packed_ice.png`

```
[Prefix B]
A 16x16 block tile texture matching vanilla Minecraft packed_ice layout,
blue-white dithered noise pattern using colors #86AEFD #8CB3FE #92B9FE #A1C3FF,
with a subtle plus-sign shaped cyan glow vein #40C8F0 at center,
the glow vein is 1px wide, runs in a cross pattern,
rest of surface uses noise dithering identical to vanilla ice block,
seamless tileable edges, no border, no outline
```
**负向**：`3d render, perspective, gradient, smooth, glow halo, magical aura, particles`

---

### 4.2 冰以太锭 Ice Ether Ingot
**原版参考**：vanilla `iron_ingot.png` — 椭圆形，135 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_ingot,
oval ingot shape with rounded top and flat bottom, centered,
dark outline #193052, 7-step blue ramp replacing vanilla grayscale:
deep blue #1E3A5F at edges, cobalt blue #4A8CCD in mid,
ice blue #8CC8E8 on upper-left, specular ice white #B0E0F5 highlight,
bright crystal white #E0F4FF for single brightest pixel,
NO glow, NO magical effects, purely material shaded,
identical silhouette to vanilla iron ingot, 135 opaque pixels
```
**负向**：`glow, magical, rune, particle, glow, aura, 3d, realistic, different shape`

---

### 4.3 冰棍 Ice Stick
**原版参考**：vanilla `stick.png` — 斜对角细条，37 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla stick,
thin diagonal rod from upper-right to lower-left, 2-3px wide,
using vanilla wood colors UNCHANGED: #281E0B #493615 #684E1E #896727,
darkest at lower-left tip, lightest at upper-right,
NO ice colors, NO glow, identical silhouette to vanilla stick, 37 opaque pixels
```
**负向**：`ice, blue, glow, different shape, wider, crystal`

---

### 4.4 冰剑 Ice Sword
**原版参考**：vanilla `iron_sword.png` — 84 个不透明像素，刀身+十字护手+木柄

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_sword,
diagonal blade from upper area going lower-right at 45 degrees,
blade is 2px wide with pointed tip, crossguard in middle,
wooden handle in lower portion,
BLADE section uses blue ramp replacing gray:
  outline #193052, dark #1E3A5F, mid #4A8CCD, light #8CC8E8, highlight #B0E0F5,
HANDLE section uses vanilla wood colors unchanged:
  #281E0B #493615 #684E1E,
NO glow, NO runes, NO frost particles, NO magical effects,
purely material shaded like vanilla iron sword but blue,
identical silhouette, 84 opaque pixels
```
**负向**：`glow, magical, rune, frost, particle, aura, crystal effect, different blade shape`

---

### 4.5 冰镐 Ice Pickaxe
**原版参考**：vanilla `iron_pickaxe.png` — T 形双头镐

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_pickaxe,
T-shaped silhouette with two pointed pick heads extending horizontally,
handle going diagonally from center to lower-left,
PICK HEADS use blue ramp: outline #193052, #1E3A5F, #4A8CCD, #8CC8E8, #B0E0F5,
HANDLE uses vanilla wood: #281E0B #493615 #684E1E,
upper-left lighting on pick heads, dark on lower-right,
NO glow, NO magical effects, identical silhouette to vanilla iron pickaxe
```
**负向**：`glow, magical, rune, frost, different head shape, wider`

---

### 4.6 冰斧 Ice Axe
**原版参考**：vanilla `iron_axe.png` — 单刃斧，60 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_axe,
asymmetric single-bladed axe, blade on upper-right side,
curved cutting edge, handle going diagonally lower-left,
BLADE uses blue ramp: outline #193052, #1E3A5F, #4A8CCD, #8CC8E8, #C1C1C1→#B0E0F5,
HANDLE uses vanilla wood: #281E0B #493615 #684E1E,
lighting from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla iron axe, 60 opaque pixels
```
**负向**：`glow, magical, double blade, different shape, frost`

---

### 4.7 冰铲 Ice Shovel
**原版参考**：vanilla `iron_shovel.png` — 方头铲，53 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_shovel,
rectangular spade blade at top, handle going straight down,
SPADE uses blue ramp: outline #193052, #1E3A5F, #4A8CCD, #8CC8E8,
HANDLE uses vanilla wood: #281E0B #493615,
light from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla iron shovel, 53 opaque pixels
```
**负向**：`glow, magical, different blade shape, frost, particles`

---

### 4.8 冰锄 Ice Hoe
**原版参考**：vanilla `iron_hoe.png` — 横头锄，51 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_hoe,
horizontal rectangular blade at top, handle going diagonally lower-left,
BLADE uses blue ramp: outline #193052, #1E3A5F, #4A8CCD, #8CC8E8, #B0E0F5,
HANDLE uses vanilla wood: #281E0B #493615 #684E1E,
light from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla iron hoe, 51 opaque pixels
```
**负向**：`glow, magical, different shape, frost, particles`

---

### 4.9 冰头盔 Ice Helmet
**原版参考**：vanilla `iron_helmet.png` — 78 个不透明像素，7 色灰度

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_helmet,
front view of a rounded helmet dome with visor slit,
two dark eye holes at center, symmetrical design,
dark outline #193052, blue ramp replacing vanilla gray:
  #1E3A5F dark, #3A6EA8 mid-dark, #6AB0D8 mid, #8CC8E8 light, #B0E0F5 highlight,
  #191919→#193052 for darkest outline,
light from upper-left, NO glow, NO magical effects, NO frost,
identical silhouette to vanilla iron helmet, 78 opaque pixels
```
**负向**：`glow, magical, visor glow, frost, different shape, 3d`

---

### 4.10 冰胸甲 Ice Chestplate
**原版参考**：vanilla `iron_chestplate.png` — 138 个不透明像素，最大护甲件

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_chestplate,
symmetrical torso armor with shoulder pauldrons,
narrow waist at bottom, two shoulder pieces at top,
dark outline #193052, blue ramp replacing vanilla gray:
  #1E3A5F dark, #3A6EA8 mid-dark, #6AB0D8 mid, #8CC8E8 light,
  #C6C6C6→#8CC8E8 for mid-highlight, #D8D8D8→#B0E0F5 for highlight,
light from upper-left, NO glow, NO magical gem, NO cyan core,
identical silhouette to vanilla iron chestplate, 138 opaque pixels
```
**负向**：`glow, magical, gem, cyan core, rune, different shape, 3d`

---

### 4.11 冰护腿 Ice Leggings
**原版参考**：vanilla `iron_leggings.png` — 104 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_leggings,
symmetrical two-leg armor with belt at top, split in middle,
dark outline #193052, blue ramp replacing vanilla gray:
  #1E3A5F dark, #3A6EA8 mid-dark, #6AB0D8 mid, #8CC8E8 light, #B0E0F5 highlight,
light from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla iron leggings, 104 opaque pixels
```
**负向**：`glow, magical, different shape, 3d, knee glow`

---

### 4.12 冰靴 Ice Boots
**原版参考**：vanilla `iron_boots.png` — 88 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla iron_boots,
pair of ankle-height boots side by side, pointed toes,
dark outline #193052, blue ramp replacing vanilla gray:
  #1E3A5F dark, #3A6EA8 mid-dark, #6AB0D8 mid, #8CC8E8 light,
  #C6C6C6→#8CC8E8 for mid-highlight, #D8D8D8→#B0E0F5 for highlight,
light from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla iron boots, 88 opaque pixels
```
**负向**：`glow, magical, toe glow, rune, different shape, 3d`

---

### 4.13 冰桶 Ice Bucket（空）
**原版参考**：vanilla `bucket.png` — 146 个不透明像素

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla bucket,
tapered bucket shape wider at top, narrowing to bottom,
handle arc on top,
dark outline #193052, blue ramp replacing vanilla gray:
  #1E3A5F dark, #2E5A8A mid-dark, #4A8CCD mid, #6AB0D8 mid-light,
  #8CC8E8 light, #B0E0F5 highlight,
light from upper-left, NO glow, NO magical effects,
identical silhouette to vanilla bucket, 146 opaque pixels
```
**负向**：`glow, magical, liquid, water, different shape, 3d`

---

### 4.14 冰桶 Ice Bucket Filled（装满）
**原版参考**：vanilla `water_bucket.png` — 顶部有蓝色液体

```
[Prefix V]
A 16x16 item icon, exact same shape and pixel layout as vanilla water_bucket,
tapered bucket shape with liquid visible at top,
LIQUID section uses cyan-blue replacing vanilla water blue:
  #32C3F0 dark, #4DD5F5 mid, #78E1FA light,
BUCKET section uses blue ramp: outline #193052, #1E3A5F, #4A8CCD, #8CC8E8,
light from upper-left, NO glow, NO magical aura,
identical silhouette to vanilla water bucket
```
**负向**：`glow, magical aura, different shape, 3d, swirling`

---

### 4.15 硬纸板 Cardboard
**原版参考**：无直接原版对应，参考 vanilla `paper.png` 风格

```
[Prefix V]
A 16x16 item icon, flat square piece of cardboard,
warm brown corrugated paper texture,
colors: #8B6F47 base, #6B5234 dark, #A08560 light, #C4A878 highlight,
visible corrugated edge with wavy flute pattern,
matte surface, NO glow, NO magical effects,
centered, transparent background
```
**负向**：`glow, ice, blue, magical, 3d, realistic`

---

## 5. ControlNet 工作流（推荐：最高还原度）

**核心思路**：用原版铁质纹理作为 ControlNet 参考图，AI 只负责换色。

### 5.1 准备工作

原版纹理已提取至 `mc_vanilla_extract/` 目录：
```
mc_vanilla_extract/
├── iron_ingot.png      ← 用作 ControlNet 参考
├── iron_sword.png
├── iron_pickaxe.png
├── iron_axe.png
├── iron_shovel.png
├── iron_hoe.png
├── iron_helmet.png
├── iron_chestplate.png
├── iron_leggings.png
├── iron_boots.png
├── bucket.png
├── water_bucket.png
├── stick.png
├── ice.png
├── packed_ice.png
└── blue_ice.png
```

### 5.2 Stable Diffusion + ControlNet 设置

```
模型: SD 1.5 或 SDXL
ControlNet 模型: control_v11p_sd15_canny 或 control_v11f1p_sd15_tile
ControlNet 权重: 1.0 (完全锁定轮廓)
ControlNet 预处理: Canny Edge Detection (低阈值=50, 高阈值=100)
  或 Tile 模式 (保留更多细节)

输入图: mc_vanilla_extract/iron_sword.png (作为 ControlNet 输入)

提示词: [Prefix V] + [4.4 冰剑提示词]
负向提示词: [第 6 节通用负向]

参数:
  Steps: 30
  CFG: 8
  Sampler: DPM++ 2M Karras
  Resolution: 512x512 (后期降采样)
  Denoising: 0.5-0.7 (保留轮廓，只换颜色)
```

### 5.3 各物品 ControlNet 配置

| 物品 | ControlNet 输入图 | 预处理 | 权重 |
|------|-------------------|--------|------|
| 冰锭 | iron_ingot.png | Canny | 1.0 |
| 冰棍 | stick.png | Canny | 1.0 |
| 冰剑 | iron_sword.png | Canny | 1.0 |
| 冰镐 | iron_pickaxe.png | Canny | 1.0 |
| 冰斧 | iron_axe.png | Canny | 1.0 |
| 冰铲 | iron_shovel.png | Canny | 1.0 |
| 冰锄 | iron_hoe.png | Canny | 1.0 |
| 冰头盔 | iron_helmet.png | Canny | 1.0 |
| 冰胸甲 | iron_chestplate.png | Canny | 1.0 |
| 冰护腿 | iron_leggings.png | Canny | 1.0 |
| 冰靴 | iron_boots.png | Canny | 1.0 |
| 冰桶 | bucket.png | Canny | 1.0 |
| 冰桶(满) | water_bucket.png | Canny | 1.0 |
| 冰方块 | packed_ice.png | Tile | 0.8 |

---

## 6. 通用负向提示词 v2.0

```
ugly, deformed, blurry, smooth gradient, anti-aliased, 3d render,
realistic photo, photorealistic, high detail texture, complex detail,
glow, glowing, magical, magical aura, magical effect, rune, runes,
frost particles, floating particles, sparkles, neon, cyan glow,
aura, light emission, emissive, bloom, hdr, oversaturated,
multiple objects, background scenery, multiple items,
watermark, text, signature, frame, border,
different silhouette, different shape, artistic interpretation,
not matching vanilla, non-vanilla style
```

---

## 7. 后处理工作流 v2.0（AI → 16x16 原版风格）

```
AI 输出 (512x512)
        ↓
[步骤 1] 缩放到 16x16
   方法 A: Nearest Neighbor (Photoshop/GIMP)
   方法 B: 用 Python PIL:
     img.resize((16,16), Image.NEAREST)
        ↓
[步骤 2] 颜色量化到冰蓝色板
   将所有像素映射到最近的冰蓝色板颜色
   Python 脚本见第 8 节
        ↓
[步骤 3] 对比原版轮廓
   叠加原版 iron_xxx.png 检查轮廓是否匹配
   手动修正错位像素
        ↓
[步骤 4] 透明度处理
   将背景色设为完全透明 (alpha=0)
   确保只有物品像素不透明
        ↓
[步骤 5] 保存为 PNG
   覆盖到 textures_redesign/item/xxx.png
```

---

## 8. 颜色量化 Python 脚本

```python
from PIL import Image
import os

# 冰蓝色板 (灰度→冰蓝映射)
ICE_PALETTE = [
    (25, 48, 82),     # #193052 描边
    (30, 58, 95),     # #1E3A5F 深
    (42, 82, 128),    # #2A5280 深中
    (46, 90, 138),    # #2E5A8A 中暗
    (58, 110, 168),   # #3A6EA8 中
    (74, 140, 205),   # #4A8CCD 中亮
    (90, 156, 224),   # #5A9CE0 亮中
    (106, 176, 216),  # #6AB0D8 亮
    (140, 200, 232),  # #8CC8E8 亮2
    (176, 224, 245),  # #B0E0F5 高光
    (180, 225, 250),  # #B4E1FA 高光2
    (224, 244, 255),  # #E0F4FF 最亮
    # 木柄色 (保持原版)
    (40, 30, 11),     # #281E0B
    (73, 54, 21),     # #493615
    (104, 78, 30),    # #684E1E
    (137, 103, 39),   # #896727
    # 冰方块色
    (134, 174, 253),  # #86AEFD
    (140, 179, 254),  # #8CB3FE
    (146, 185, 254),  # #92B9FE
    (161, 195, 255),  # #A1C3FF
    (188, 212, 255),  # #BCD4FF
    (200, 220, 255),  # #C8DCFF
    # 辉光 (仅方块和装满桶)
    (50, 195, 240),   # #32C3F0
    (120, 225, 250),  # #78E1FA
    # 透明
    (0, 0, 0, 0),
]

def nearest_color(pixel, palette):
    r, g, b = pixel[0], pixel[1], pixel[2]
    a = pixel[3] if len(pixel) > 3 else 255
    if a < 128:
        return (0, 0, 0, 0)
    min_dist = float('inf')
    best = palette[0]
    for color in palette:
        if len(color) == 4:
            continue
        dr, dg, db = r-color[0], g-color[1], b-color[2]
        dist = dr*dr + dg*dg + db*db
        if dist < min_dist:
            min_dist = dist
            best = color
    return best + (255,)

def quantize(input_path, output_path):
    img = Image.open(input_path).convert('RGBA')
    pixels = img.load()
    w, h = img.size
    for y in range(h):
        for x in range(w):
            pixels[x, y] = nearest_color(pixels[x, y], ICE_PALETTE)
    img.save(output_path)
    print(f"Saved: {output_path}")

# 批量处理
input_dir = "textures_ai_output"  # AI 生成的图
output_dir = "textures_redesign/item"
for f in os.listdir(input_dir):
    if f.endswith('.png'):
        quantize(os.path.join(input_dir, f),
                 os.path.join(output_dir, f))
```

---

## 9. 原版风格自检清单 v2.0

每次生成后对照检查：
- [ ] 描边颜色是 #193052（接近黑色的深蓝），不是亮蓝
- [ ] 暗部是 #1E3A5F（深海蓝），不是灰色
- [ ] 中调是 #4A8CCD（钴蓝），不是青色
- [ ] 高光是 #B0E0F5（冰白），不是纯白
- [ ] 最亮点是 #E0F4FF（冰晶白），仅 1-3 像素
- [ ] 工具手柄是原版棕色 #281E0B ~ #896727
- [ ] 打光方向是左上→右下
- [ ] **无任何发光/魔法/符文/粒子效果**
- [ ] 轮廓与原版 iron_xxx.png 完全一致
- [ ] 不透明像素数量与原版接近（±5px）
- [ ] 透明区域不小于 40%
- [ ] 颜色总数不超过 13 种
- [ ] 无 3D 渲染感
- [ ] 无照片级真实感

---

## 10. Midjourney 快速启动

```
/imagine [Prefix V]

exact same pixel layout as vanilla iron_sword from Minecraft 1.21,
16x16 pixel art item icon, diagonal blade with crossguard and wooden handle,
blade colored with blue ramp #193052 to #B0E0F5 replacing vanilla gray,
handle keeps vanilla brown #281E0B to #896727,
upper-left lighting, flat shading, hard color steps, no gradients,
no glow no magical effects no runes no particles,
transparent background centered isolated game asset

--ar 1:1 --v 6.1 --style raw --s 50
--no glow magical rune frost particle aura 3d realistic gradient blur
--seed 20240824
```

> **关键参数说明**：
> - `--style raw`：减少 MJ 风格化，更忠于 prompt
> - `--s 50`：低风格化值，避免 MJ 添加多余装饰
> - `--seed 20240824`：固定种子，确保 14 件物品系列感统一
> - `--no`：排除所有非原版效果

---

## 11. 原版像素轮廓参考

以下为原版铁质工具的精确像素网格（从 `gen_vanilla_based.ps1` 提取），
可作为 AI 生成的对照参考或 ControlNet 输入：

### iron_sword 轮廓
```
................
......00........
.....0110.......
.....01210......
....012210......
....012210......
....012210......
....012210......
...0122210......
..001222100.....
.00..0110..00...
0....0110....0..
.....0110.......
.....0hj0.......
....0hjjh0......
....00000.......
```
（0=描边, 1=暗, 2=中, 3=亮, h=深木, j=中木）

### iron_pickaxe 轮廓
```
................
.00..........00.
0110........0110
012210......0121
.012210000012210
..0122222222210.
...01222222210..
.....012210.....
....0122210.....
...0122210......
..0122210.......
.0122210........
0122210.........
122210..........
12210...........
000.............
```

### iron_ingot 轮廓
```
................
................
................
....00000000....
...0111111110...
..012222222110..
.01223333332110.
.01233333333210.
.01233337733310.   ← 7 = 辉光(可选)
.01233333333210.
.01223333332110.
..011222222100..
...001111110....
....00000000....
................
................
```

---

> **版本**：2.0
> **数据来源**：Minecraft 1.21.1 client-extra.jar 原版纹理逐像素分析
> **色板映射**：基于 `gen_vanilla_based.ps1` 灰度→冰蓝映射方案
> **适用项目**：IceMore_mod (Minecraft 1.21.1, NeoForge 21.1.233)
