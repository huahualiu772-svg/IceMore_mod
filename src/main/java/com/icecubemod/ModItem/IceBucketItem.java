package com.icecubemod.ModItem;

import net.minecraft.core.BlockPos;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.InteractionResultHolder;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.context.UseOnContext;
import net.minecraft.world.level.ClipContext;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.material.Fluids;
import net.minecraft.world.phys.BlockHitResult;
import net.minecraft.world.phys.HitResult;

public class IceBucketItem extends Item {

    private final boolean filled;

    public IceBucketItem(boolean filled, Properties properties) {
        super(properties);
        this.filled = filled;
    }

    @Override
    public InteractionResultHolder<ItemStack> use(Level level, Player player, InteractionHand hand) {
        ItemStack stack = player.getItemInHand(hand);

        if (!filled) {
            BlockHitResult hit = getPlayerPOVHitResult(level, player, ClipContext.Fluid.SOURCE_ONLY);
            if (hit.getType() == HitResult.Type.BLOCK) {
                BlockPos pos = hit.getBlockPos();
                BlockState state = level.getBlockState(pos);
                if (state.getFluidState().isSourceOfType(Fluids.WATER)) {
                    if (!level.isClientSide) {
                        level.setBlock(pos, Blocks.AIR.defaultBlockState(), 3);
                        level.playSound(null, pos, SoundEvents.BUCKET_FILL,
                                SoundSource.BLOCKS, 1.0F, 1.0F);
                    }
                    return InteractionResultHolder.success(
                            new ItemStack(ModItem.ICE_BUCKET_FILLED.get()));
                }
            }
        }

        return InteractionResultHolder.pass(stack);
    }

    @Override
    public InteractionResult useOn(UseOnContext context) {
        if (filled) {
            Level level = context.getLevel();
            BlockPos pos = context.getClickedPos().relative(context.getClickedFace());
            Player player = context.getPlayer();
            InteractionHand hand = context.getHand();

            if (!level.isClientSide) {
                level.setBlock(pos, Blocks.ICE.defaultBlockState(), 3);
                level.playSound(null, pos, SoundEvents.BUCKET_EMPTY,
                        SoundSource.BLOCKS, 1.0F, 1.0F);
                player.setItemInHand(hand,
                        new ItemStack(ModItem.ICE_BUCKET.get()));
            }
            return InteractionResult.sidedSuccess(level.isClientSide);
        }

        return InteractionResult.PASS;
    }
}
