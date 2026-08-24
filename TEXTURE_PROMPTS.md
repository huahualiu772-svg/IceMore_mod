# IceMore Mod 纹理提示词工程指南

> 冰主题 Minecraft 模组的 AI 纹理生成提示词库
> 适用于 Midjourney / DALL-E 3 / Stable Diffusion (含 Pixel Art LoRA) / Flux
> 设计目标：保持与现有纹理（`textures_redesign/`）视觉语言一致

---

## 1. 视觉风格基线 Style Foundation

### 1.1 调色板锁定（必须严格遵守）
```
Hex 代码与现有 gen_textures.ps1 完全一致

Deepest (0)  : #1E3A5F  ███  深邃阴影 / 描边
Shadow   (1)  : #2E5A8A  ███  阴影
Base-Dk  (2)  : #3D7AB0  ███  深色基础
Base     (3)  : #4A90C8  ███  主体色（深蓝）
Base-Lt  (4)  : #6AB0D8  ███  浅色基础
Hi-Lt    (5)  : #8CC8E8  ███  高光
Specular (6)  : #B0E0F5  ███  镜面高光
Glow-Dk  (7)  : #40C8F0  ███  青色辉光
Glow-Brt (8)  : #80E0F8  ███  亮青辉光
Wood-Dk  (9)  : #5C4030  ███  深木手柄
Wood-Md  (a)  : #78553C  ███  中木手柄
Wood-Lt  (b)  : #966E4B  ███  浅木手柄
```

### 1.2 视觉语言 5 大铁律
1. **像素艺术优先**：硬边、1px 描边、不使用渐变（在像素艺术语境下）
2. **冷光自发光**：所有冰类物品都应带有微妙的青色辉光（Ether）
3. **斜 45° 高光**：模拟经典 Minecraft 工具左上 → 右下打光
4. **木手柄与冰刀身对比**：棕橙 vs 冰蓝
5. **统一视角**：方块正视图，工具/武器 3/4 角斜向上

---

## 2. 主风格前缀 Master Style Prefix（所有提示词通用）

以下三段前缀任选其一拼接在你每个物品的描述之前，确保风格统一：

### Prefix A · 标准像素风（推荐）
```
16x16 pixel art, Minecraft item texture, game asset,
isometric 3/4 view, centered on pure black background,
sharp pixel edges no anti-aliasing, no gradients,
icy blue and cyan color palette with brown wooden handle accents,
magical cyan glow emanates from ice details,
flat shading with single-step highlight and shadow,
inspired by Minecraft vanilla texture style
```

### Prefix B · 概念艺术风（用于先做高分辨率概念图再降采样）
```
high resolution game asset concept art, fantasy ice weapon,
centered composition, isolated on pure black background,
soft studio lighting from upper-left, ice crystalline material
with internal cyan magical glow, frosted translucent ice texture,
sharp focus, octane render, unreal engine 5 quality,
8K detail, design turnaround reference
```

### Prefix C · 像素艺术扩散模型专用（Stable Diffusion Pixel Art LoRA）
```
masterpiece, best quality, pixel art, 16x16,
sprite sheet style, retro game asset, minecraft texture,
clean pixel grid, no blur, no anti-aliasing,
limited color palette, ice blue cyan tones,
magical glowing runes
```

---

## 3. 14 个物品的专属提示词

> 格式：`[主风格前缀] + [主体描述] + [细节] + [技术参数] + [负向提示词]`

### 3.1 方块 - Ice Ether Block 冰以太方块
```
[Prefix A]
A single cubic ice ether block, front-facing view,
cracked translucent ice surface with glowing cyan cross pattern
in the center, four cardinal direction light veins forming a plus sign,
deep blue base color, jagged frost crystals at edges,
internal magical cyan glow #40C8F0 emanating from cracks,
frost particles on surface, --ar 1:1 --v 6.1 --style raw
```
**负向**：`blurry, smooth, gradient, photograph, 3d render, multiple blocks, surrounding, text, watermark`

---

### 3.2 基础物品 - Ice Ether Ingot 冰以太锭
```
[Prefix A]
A small oval ice ingot, viewed from slight 3/4 angle,
rounded coin-like shape, polished ice surface,
deep blue base with brighter cyan highlight in the center,
frosted edges, subtle magical glow #80E0F8 in the middle,
single-pixel dark outline, --ar 1:1 --v 6.1 --style raw
```

---

### 3.3 基础物品 - Ice Stick 冰棍
```
[Prefix A]
A single 3-pixel wide diagonal ice rod, running from
top-right to bottom-left, deep blue core with brighter
highlight on upper edge and darker shadow on lower edge,
faceted crystalline ice surface, frosted tips,
clean pixel art icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.4 工具 - Ice Sword 冰剑
```
[Prefix A]
A medieval ice sword, blade pointing upper-left to lower-right
at 45 degree angle, crystalline translucent blue blade with
sharp pointed tip, glowing cyan runes etched along the blade,
brown wooden crossguard and grip handle,
crossguard has small ice gem in center,
magical frost particles floating around blade,
centered composition, --ar 1:1 --v 6.1 --style raw
```
**细节加强**：`broad blade 4 pixels wide, brown handle 3 pixels wide, cyan pommel`

---

### 3.5 工具 - Ice Pickaxe 冰镐
```
[Prefix A]
A double-headed ice pickaxe, T-shaped silhouette,
two pointed crystalline pick heads extending horizontally,
deep blue ice material with cyan glow at the tips,
brown wooden handle going diagonally lower-left to upper-right,
frost crystals clustered at the striking edges,
tool design, --ar 1:1 --v 6.1 --style raw
```

---

### 3.6 工具 - Ice Axe 冰斧
```
[Prefix A]
A single-bladed ice axe, asymmetric design,
broad curved crystalline ice blade on the upper-right,
sharp frosted cutting edge, glowing cyan core in the blade,
brown wooden handle with diagonal orientation,
frost particles dripping from blade,
centered icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.7 工具 - Ice Shovel 冰铲
```
[Prefix A]
An ice shovel, rectangular spade-shaped blade on top,
crystalline flat translucent ice surface with frosted edges,
glowing cyan magical core in center of the spade,
brown wooden handle pointing straight down,
45 degree overall rotation, clean pixel art,
--ar 1:1 --v 6.1 --style raw
```

---

### 3.8 工具 - Ice Hoe 冰锄
```
[Prefix A]
An ice farming hoe, horizontal rectangular blade on top,
flat crystalline ice surface with glowing cyan center,
sharp 90 degree angle between blade and handle,
brown wooden handle pointing diagonally down,
frost crystals on the blade edge,
centered tool icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.9 护甲 - Ice Helmet 冰头盔
```
[Prefix A]
Front view of a fantasy ice helmet, symmetrical design,
rounded ice dome with visor opening showing dark interior,
crystalline ice material with cyan magical glow,
frost crystals along the top ridge and side edges,
deep blue base with lighter blue highlight on top,
centered armor piece, --ar 1:1 --v 6.1 --style raw
```

---

### 3.10 护甲 - Ice Chestplate 冰胸甲
```
[Prefix A]
Front view of an ice chestplate armor,
symmetrical torso armor with shoulder pads,
crystalline ice plating with deep blue base,
glowing cyan gem embedded in the chest center,
ice pauldrons on both shoulders with frost crystals,
dark straps at the waist, --ar 1:1 --v 6.1 --style raw
```

---

### 3.11 护甲 - Ice Leggings 冰护腿
```
[Prefix A]
Front view of ice armor leggings, symmetrical design,
two leg plates with ice knee guards,
crystalline deep blue ice material,
cyan glow accent at each knee,
dark belt at top, matching ice boots implied,
centered armor piece, --ar 1:1 --v 6.1 --style raw
```

---

### 3.12 护甲 - Ice Boots 冰靴
```
[Prefix A]
Front view of ice boots, pair side by side,
ankle-height crystalline ice boots with pointed toes,
deep blue ice material with cyan glow at the toe,
frosted cuff at the top opening,
magical rune patterns on the side,
centered footwear icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.13 工具 - Ice Bucket 冰桶（空）
```
[Prefix A]
A small ice bucket, cylindrical tapered shape,
deeper at bottom than top, hollow interior visible from above,
crystalline translucent ice material with deep blue tint,
frost crystals around the rim,
brown frozen wooden handle on the side,
centered utility icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.14 工具 - Ice Bucket Filled 冰桶（装满）
```
[Prefix A]
A small ice bucket filled with glowing cyan liquid,
cylindrical tapered shape, bright cyan #80E0F8 liquid visible
from above, magical aurora swirling inside the bucket,
ice walls with frost crystals around rim,
subtle magical light glowing upward from liquid,
centered icon, --ar 1:1 --v 6.1 --style raw
```

---

### 3.15 材料 - Cardboard 硬纸板
```
[Prefix A]
A flat square piece of cardboard, viewed from slight angle,
warm brown #B08868 corrugated paper texture,
visible wavy fluting pattern in cross-section,
slightly worn edges with light beige interior showing,
matte non-reflective surface, --ar 1:1 --v 6.1 --style raw
```

---

## 4. 平台特化适配

### 4.1 Midjourney（推荐 v6.1）
- 追加：`--ar 1:1 --v 6.1 --style raw --no realistic, photograph, 3d`
- 使用 `--s 80` 控制风格化（数值越低越靠近 prompt）
- 启用 `--style raw` 减少 Midjourney 自作主张
- 一次性跑 4 张选最佳：`--repeat 4`

### 4.2 DALL-E 3
- 把风格前缀直接写在自然语言里
- 明确说："16x16 pixel art sprite, do not add background scenery"
- 追加："on a single solid black background only"

### 4.3 Stable Diffusion（最佳实践）
1. **基础模型**：`SD 1.5` 或 `SDXL`
2. **必备 LoRA**：
   - `Pixel Art LoRA` (权重 0.7-0.85)
   - `Minecraft Style LoRA` (权重 0.5-0.7)
3. **推荐参数**：
   ```
   Steps: 28, CFG: 7, Sampler: DPM++ 2M Karras
   Resolution: 512x512 (生成后用 pixel art 算法降到 16x16)
   Negative: blurry, smooth, gradient, photograph, realistic, 3d, anti-aliasing
   Clip skip: 2
   ```
4. **ControlNet**：可选，用你现有纹理作为 reference 来锁定风格

### 4.4 Flux
- 自然语言描述，不需要参数语法
- 强调"photorealistic pixel art hybrid"或"concept art for a video game texture"
- Flux 对"glow"和"magical"理解很好

---

## 5. 通用负向提示词模板

粘贴到所有生成的负向提示栏：

```
ugly, deformed, noisi, chaotic, multiple objects, background scenery,
realistic photo, 3d render, smooth gradient, blurry, anti-aliased,
watermark, text, signature, frame, border, multiple items,
complex detail, high resolution detail, photorealistic,
unrealistic, oversaturated, neon colors
```

---

## 6. 后处理工作流（AI → Minecraft 16x16）

```
AI 输出高分辨率 (512×512 或更高)
        ↓
[步骤 1] 在 Photoshop / GIMP 中缩放到 64×64
   插值算法：Nearest Neighbor (保持硬边)
        ↓
[步骤 2] 量化颜色到你的 13 色调色板
   使用 Median Cut 或手动替换
        ↓
[步骤 3] 缩到 16×16（保持 Nearest Neighbor）
        ↓
[步骤 4] 手动微调（关键步骤）
   - 修正像素错位
   - 加强轮廓
   - 调整高光位置
        ↓
[步骤 5] 保存 PNG 覆盖到 textures_redesign/item/
```

**辅助工具**：
- [Lospec Pixel Art Scaler](https://lospec.com/pixel-art-scaler/) - 浏览器端
- Aseprite（专业像素艺术） - 内置色彩量化
- GIMP + `Filters > Web > Slice` 工具

---

## 7. 批量生成脚本示例

如果你使用 Midjourney，可以用以下批量提示词模板：

```
/imagine [Prefix A] [ITEM_NAME] [ITEM_DETAIL_PROMPT] --ar 1:1 --v 6.1 --style raw --no ugly, realistic photo, blur, multiple objects --seed [固定种子确保系列风格一致]
```

把 `ITEM_NAME` 和 `ITEM_DETAIL_PROMPT` 替换成第 3 节的对应内容，**所有物品使用同一个 `--seed` 值**（例如 `20240824`）可以保证视觉系列感。

---

## 8. 风格一致性检查清单

每次生成后对照以下项目自检：
- [ ] 主色是 #1E3A5F 深邃蓝
- [ ] 高光是 #B0E0F5 镜面白
- [ ] 辉光是 #40C8F0 / #80E0F8 青色
- [ ] 工具手柄是棕色（#5C4030 / #78553C / #966E4B）
- [ ] 描边 1 像素，颜色最深（#1E3A5F）
- [ ] 整体居中，纯黑背景
- [ ] 16:9 或 1:1 比例
- [ ] 没有 3D 渲染感
- [ ] 没有照片级真实感
- [ ] 整体冷色调，温度感"冰冷"

---

## 9. 进阶技巧

### 9.1 锁定系列感
使用 `style reference --sref` (Midjourney v6) 上传一张你满意的现有纹理，让后续生成都向其靠拢。

### 9.2 图标参考
- [game-icons.net](https://game-icons.net/) - 大量 CC-BY 风格参考
- 搜索关键词："ice sword pixel art 16x16"

### 9.3 二次精修
对于关键物品（冰剑、方块），可以：
1. AI 出 4 张
2. 选最好的
3. 在 Aseprite 中手工精修为 16x16
4. 用 `gen_textures.ps1` 的色板量化

### 9.4 多角度包
如需为某些物品生成 4 视角（用于 mod 展示），追加：
```
front view, side view, top view, perspective 3/4 view,
shown in a 2x2 grid, --ar 1:1
```

---

> **作者**：由 AI 图像提示词工程师定制
> **版本**：1.0
> **适用项目**：IceMore_mod (Minecraft 1.21.1, NeoForge)
> **色板版本**：与 `gen_textures.ps1` v1.0 同步
