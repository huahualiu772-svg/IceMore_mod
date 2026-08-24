package com.icecubemod.ModItem;

import net.minecraft.tags.BlockTags;
import net.minecraft.world.item.Tier;
import net.minecraft.world.item.crafting.Ingredient;
import net.neoforged.neoforge.common.SimpleTier;

public class IceToolTier {

    public static final Tier ICE = new SimpleTier(
            BlockTags.INCORRECT_FOR_DIAMOND_TOOL,
            800,
            8.0F,
            3.5F,
            22,
            () -> Ingredient.of(ModItem.ICE_ETHER_INGOT.get())
    );
}
