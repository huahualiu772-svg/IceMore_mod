package com.icecubemod.ModItem;

import com.icecubemod.IceCubemod;
import net.minecraft.world.item.*;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.neoforge.registries.DeferredItem;
import net.neoforged.neoforge.registries.DeferredRegister;

public class ModItem {

    public static final DeferredRegister.Items ITEMS =
            DeferredRegister.createItems(IceCubemod.MODID);

    public static DeferredItem<Item> ICE_ETHER_INGOT =
            ITEMS.registerSimpleItem("ice_ether_ingot", new Item.Properties());

    public static DeferredItem<Item> ICE_STICK =
            ITEMS.registerSimpleItem("ice_stick", new Item.Properties());

    public static DeferredItem<IceBucketItem> ICE_BUCKET =
            ITEMS.registerItem("ice_bucket",
                    (props) -> new IceBucketItem(false, props),
                    new Item.Properties().stacksTo(1));

    public static DeferredItem<IceBucketItem> ICE_BUCKET_FILLED =
            ITEMS.registerItem("ice_bucket_filled",
                    (props) -> new IceBucketItem(true, props),
                    new Item.Properties().stacksTo(1));

    public static DeferredItem<IceSwordItem> ICE_SWORD =
            ITEMS.registerItem("ice_sword",
                    (props) -> new IceSwordItem(IceToolTier.ICE,
                            new Item.Properties().attributes(
                                    SwordItem.createAttributes(IceToolTier.ICE, 3, -2.4F))));

    public static DeferredItem<PickaxeItem> ICE_PICKAXE =
            ITEMS.registerItem("ice_pickaxe",
                    (props) -> new PickaxeItem(IceToolTier.ICE,
                            new Item.Properties().attributes(
                                    PickaxeItem.createAttributes(IceToolTier.ICE, 1.0F, -2.8F))));

    public static DeferredItem<AxeItem> ICE_AXE =
            ITEMS.registerItem("ice_axe",
                    (props) -> new AxeItem(IceToolTier.ICE,
                            new Item.Properties().attributes(
                                    AxeItem.createAttributes(IceToolTier.ICE, 6.0F, -3.1F))));

    public static DeferredItem<ShovelItem> ICE_SHOVEL =
            ITEMS.registerItem("ice_shovel",
                    (props) -> new ShovelItem(IceToolTier.ICE,
                            new Item.Properties().attributes(
                                    ShovelItem.createAttributes(IceToolTier.ICE, 1.5F, -3.0F))));

    public static DeferredItem<HoeItem> ICE_HOE =
            ITEMS.registerItem("ice_hoe",
                    (props) -> new HoeItem(IceToolTier.ICE,
                            new Item.Properties().attributes(
                                    HoeItem.createAttributes(IceToolTier.ICE, -2.0F, -1.0F))));

    public static DeferredItem<ArmorItem> ICE_HELMET =
            ITEMS.registerItem("ice_helmet",
                    (props) -> new ArmorItem(IceArmorMaterial.ICE, ArmorItem.Type.HELMET,
                            new Item.Properties().durability(ArmorItem.Type.HELMET.getDurability(37))));

    public static DeferredItem<ArmorItem> ICE_CHESTPLATE =
            ITEMS.registerItem("ice_chestplate",
                    (props) -> new ArmorItem(IceArmorMaterial.ICE, ArmorItem.Type.CHESTPLATE,
                            new Item.Properties().durability(ArmorItem.Type.CHESTPLATE.getDurability(37))));

    public static DeferredItem<ArmorItem> ICE_LEGGINGS =
            ITEMS.registerItem("ice_leggings",
                    (props) -> new ArmorItem(IceArmorMaterial.ICE, ArmorItem.Type.LEGGINGS,
                            new Item.Properties().durability(ArmorItem.Type.LEGGINGS.getDurability(37))));

    public static DeferredItem<ArmorItem> ICE_BOOTS =
            ITEMS.registerItem("ice_boots",
                    (props) -> new ArmorItem(IceArmorMaterial.ICE, ArmorItem.Type.BOOTS,
                            new Item.Properties().durability(ArmorItem.Type.BOOTS.getDurability(37))));

    public static void register(IEventBus eventBus) {
        ITEMS.register(eventBus);
    }
}
