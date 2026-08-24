package com.icecubemod.ModItem;

import com.icecubemod.IceCubemod;
import com.icecubemod.ModBlock.ModBlock;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.ItemStack;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.neoforge.registries.DeferredRegister;

import java.util.function.Supplier;

public class ModCreativeTab {

    public static final DeferredRegister<CreativeModeTab> CREATIVE_TABS =
            DeferredRegister.create(Registries.CREATIVE_MODE_TAB, IceCubemod.MODID);

    public static final Supplier<CreativeModeTab> LUU_TAB = CREATIVE_TABS.register("ice_tab",
            () -> CreativeModeTab.builder()
                    .title(Component.translatable("itemGroup.icecubemod.ice_tab"))
                    .icon(() -> new ItemStack(ModBlock.ICE_ETHER_BLOCK_ITEM.get()))
                    .displayItems((params, output) -> {
                        output.accept(ModBlock.ICE_ETHER_BLOCK_ITEM.get());
                        output.accept(ModItem.ICE_ETHER_INGOT.get());
                        output.accept(ModItem.ICE_BUCKET.get());
                        output.accept(ModItem.ICE_BUCKET_FILLED.get());
                        output.accept(ModItem.ICE_STICK.get());
                        output.accept(ModItem.ICE_SWORD.get());
                        output.accept(ModItem.ICE_PICKAXE.get());
                        output.accept(ModItem.ICE_AXE.get());
                        output.accept(ModItem.ICE_SHOVEL.get());
                        output.accept(ModItem.ICE_HOE.get());
                        output.accept(ModItem.ICE_HELMET.get());
                        output.accept(ModItem.ICE_CHESTPLATE.get());
                        output.accept(ModItem.ICE_LEGGINGS.get());
                        output.accept(ModItem.ICE_BOOTS.get());
                    })
                    .build());

    public static void register(IEventBus eventBus) {
        CREATIVE_TABS.register(eventBus);
    }
}
