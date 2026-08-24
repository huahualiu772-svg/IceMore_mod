package com.icecubemod.ModBlock;

import com.icecubemod.IceCubemod;
import net.minecraft.world.item.BlockItem;
import net.minecraft.world.item.Item;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.SoundType;
import net.minecraft.world.level.block.state.BlockBehaviour;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.neoforge.registries.DeferredBlock;
import net.neoforged.neoforge.registries.DeferredItem;
import net.neoforged.neoforge.registries.DeferredRegister;

public class ModBlock {

    public static final DeferredRegister.Blocks BLOCKS =
            DeferredRegister.createBlocks(IceCubemod.MODID);

    public static final DeferredRegister.Items BLOCK_ITEMS =
            DeferredRegister.createItems(IceCubemod.MODID);

    public static final DeferredBlock<Block> ICE_ETHER_BLOCK = BLOCKS.register("ice_ether_block",
            () -> new Block(BlockBehaviour.Properties.of()
                    .strength(3.0f, 6.0f)
                    .requiresCorrectToolForDrops()
                    .sound(SoundType.BONE_BLOCK)));

    public static final DeferredItem<BlockItem> ICE_ETHER_BLOCK_ITEM = BLOCK_ITEMS.register("ice_ether_block",
            () -> new BlockItem(ICE_ETHER_BLOCK.get(), new Item.Properties()));

    public static void register(IEventBus eventBus) {
        BLOCKS.register(eventBus);
        BLOCK_ITEMS.register(eventBus);
    }
}
