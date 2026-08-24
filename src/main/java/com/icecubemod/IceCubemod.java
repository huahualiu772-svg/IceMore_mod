package com.icecubemod;

import org.slf4j.Logger;

import com.mojang.logging.LogUtils;

import com.icecubemod.ModBlock.ModBlock;
import com.icecubemod.ModItem.IceArmorMaterial;
import com.icecubemod.ModItem.ModCreativeTab;
import com.icecubemod.ModItem.ModItem;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.bus.api.SubscribeEvent;
import net.neoforged.fml.common.EventBusSubscriber;
import net.neoforged.fml.common.Mod;
import net.neoforged.fml.config.ModConfig;
import net.neoforged.fml.ModContainer;
import net.neoforged.fml.event.lifecycle.FMLCommonSetupEvent;
import net.neoforged.neoforge.event.server.ServerStartingEvent;

@Mod(IceCubemod.MODID)
@EventBusSubscriber(modid = IceCubemod.MODID)
public class IceCubemod {

    public static final String MODID = "icecubemod";

    public static final Logger LOGGER = LogUtils.getLogger();

    public IceCubemod(IEventBus modEventBus, ModContainer modContainer) {
        modEventBus.addListener(this::commonSetup);

        ModItem.register(modEventBus);
        ModBlock.register(modEventBus);
        ModCreativeTab.register(modEventBus);
        IceArmorMaterial.ARMOR_MATERIALS.register(modEventBus);

        modContainer.registerConfig(ModConfig.Type.COMMON, Config.SPEC);
    }

    private void commonSetup(FMLCommonSetupEvent event) {
        LOGGER.info("IceMore_mod common setup complete");
    }

    @SubscribeEvent
    public static void onServerStarting(ServerStartingEvent event) {
        LOGGER.info("HELLO from server starting");
    }
}
