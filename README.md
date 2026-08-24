# IceMore_mod

冰主题 Minecraft 模组，基于 NeoForge 开发，适用于 Minecraft 1.21.1。

## 内容

### 方块
- **Ice Ether Block（冰以太方块）** — 硬度 3.0，需要镐子采集，骨块音效

### 物品
- **Ice Ether Ingot（冰以太锭）** — 核心材料，由冰以太方块烧制获得
- **Ice Stick（冰棍）** — 工具手柄材料，2 个冰以太锭合成 4 根
- **Ice Bucket（冰桶）** — 空桶可舀水，装满后右键放置冰方块
- **冰工具套装** — 剑、镐、斧、铲、锄，钻石级采集等级，耐久 800，附魔能力 22
- **冰护甲套装** — 头盔、胸甲、护腿、靴子，总防御 20，韧性 2.5
- **Card Board（硬纸板）** — 基础材料

### 特殊效果
- **冰剑**：击中敌人附加缓慢 II 效果（3 秒）

## 合成

所有工具和护甲均以冰以太锭为核心材料，工具使用冰棍作为手柄。冰以太锭可通过将冰以太方块（由冰或蓝冰合成）烧制获得。

## 开发环境

### 构建
```bash
./gradlew build
```

### 运行客户端
```bash
./gradlew runClient
```

### 刷新依赖
```bash
./gradlew --refresh-dependencies
```

## 技术栈
- Minecraft 1.21.1
- NeoForge 21.1.233
- Gradle 9.2.1
- Parchment mappings 2024.11.17

## 许可证
MIT
