package com.icecubemod.ModItem;

import net.minecraft.world.effect.MobEffectInstance;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.SwordItem;
import net.minecraft.world.item.Tier;

public class IceSwordItem extends SwordItem {

    public IceSwordItem(Tier tier, Properties properties) {
        super(tier, properties);
    }

    @Override
    public boolean hurtEnemy(ItemStack stack, LivingEntity target, LivingEntity attacker) {
        target.addEffect(
                new MobEffectInstance(MobEffects.MOVEMENT_SLOWDOWN, 60, 1),
                attacker);
        return super.hurtEnemy(stack, target, attacker);
    }
}
