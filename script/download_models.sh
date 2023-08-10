#!/bin/bash

# Download the models files.

set -Eeuo pipefail

trap catch ERR
trap quit SIGINT


function catch {
  cat download_models_files.log
}

function quit {
  echo '\nCtl-c was pressed.'
}

declare -A FILES

# controlnet - comfyanonymous/ControlNet-v1-1_fp16_safetensors
REPO="https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main"
FOLDER="comfyui/models/controlnet"

#FILES["${REPO}/control_v11e_sd15_ip2p_fp16.safetensors"]="${FOLDER}/control_v11e_sd15_ip2p_fp16.safetensors"
#FILES["${REPO}/control_v11e_sd15_shuffle_fp16.safetensors"]="${FOLDER}/control_v11e_sd15_shuffle_fp16.safetensors"
#FILES["${REPO}/control_v11f1e_sd15_tile_fp16.safetensors"]="${FOLDER}/control_v11f1e_sd15_tile_fp16.safetensors"
FILES["${REPO}/control_v11f1p_sd15_depth_fp16.safetensors"]="${FOLDER}/control_v11f1p_sd15_depth_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_canny_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_canny_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_inpaint_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_inpaint_fp16.safetensors"
FILES["${REPO}/control_v11p_sd15_lineart_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_lineart_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_mlsd_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_mlsd_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_normalbae_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_normalbae_fp16.safetensors"
FILES["${REPO}/control_v11p_sd15_openpose_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_openpose_fp16.safetensors"
FILES["${REPO}/control_v11p_sd15_scribble_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_scribble_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_seg_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_seg_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15_softedge_fp16.safetensors"]="${FOLDER}/control_v11p_sd15_softedge_fp16.safetensors"
#FILES["${REPO}/control_v11p_sd15s2_lineart_anime_fp16.safetensors"]="${FOLDER}/control_v11p_sd15s2_lineart_anime_fp16.safetensors"
#FILES["${REPO}/control_v11u_sd15_tile_fp16.safetensors"]="${FOLDER}/control_v11u_sd15_tile_fp16.safetensors"

# controlnet - kohya-ss/ControlNet-diff-modules
REPO="https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main"
FOLDER="comfyui/models/controlnet"

FILES["${REPO}/diff_control_sd15_canny_fp16.safetensors"]="${FOLDER}/diff_control_sd15_canny_fp16.safetensors"
FILES["${REPO}/diff_control_sd15_depth_fp16.safetensors"]="${FOLDER}/diff_control_sd15_depth_fp16.safetensors"
#FILES["${REPO}/diff_control_sd15_hed_fp16.safetensors"]="${FOLDER}/diff_control_sd15_hed_fp16.safetensors"
#FILES["${REPO}/diff_control_sd15_mlsd_fp16.safetensors"]="${FOLDER}/diff_control_sd15_mlsd_fp16.safetensors"
#FILES["${REPO}/diff_control_sd15_normal_fp16.safetensors"]="${FOLDER}/diff_control_sd15_normal_fp16.safetensors"
FILES["${REPO}/diff_control_sd15_openpose_fp16.safetensors"]="${FOLDER}/diff_control_sd15_openpose_fp16.safetensors"
FILES["${REPO}/diff_control_sd15_scribble_fp16.safetensors"]="${FOLDER}/diff_control_sd15_scribble_fp16.safetensors"
#FILES["${REPO}/diff_control_sd15_seg_fp16.safetensors"]="${FOLDER}/diff_control_sd15_seg_fp16.safetensors"

# controlnet - TencentARC/T2I-Adapter
REPO="https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models"
FOLDER="comfyui/models/controlnet"

#FILES["${REPO}/coadapter-canny-sd15v1.pth"]="${FOLDER}/coadapter-canny-sd15v1.pth"
#FILES["${REPO}/coadapter-color-sd15v1.pth"]="${FOLDER}/coadapter-color-sd15v1.pth"
#FILES["${REPO}/coadapter-depth-sd15v1.pth"]="${FOLDER}/coadapter-depth-sd15v1.pth"
#FILES["${REPO}/coadapter-fuser-sd15v1.pth"]="${FOLDER}/coadapter-fuser-sd15v1.pth"
#FILES["${REPO}/coadapter-sketch-sd15v1.pth"]="${FOLDER}/coadapter-sketch-sd15v1.pth"
#FILES["${REPO}/coadapter-style-sd15v1.pth"]="${FOLDER}/coadapter-style-sd15v1.pth"
#FILES["${REPO}/t2iadapter_canny_sd14v1.pth"]="${FOLDER}/t2iadapter_canny_sd14v1.pth"
FILES["${REPO}/t2iadapter_canny_sd15v2.pth"]="${FOLDER}/t2iadapter_canny_sd15v2.pth"
#FILES["${REPO}/t2iadapter_color_sd14v1.pth"]="${FOLDER}/t2iadapter_color_sd14v1.pth"
#FILES["${REPO}/t2iadapter_depth_sd14v1.pth"]="${FOLDER}/t2iadapter_depth_sd14v1.pth"
FILES["${REPO}/t2iadapter_depth_sd15v2.pth"]="${FOLDER}/t2iadapter_depth_sd15v2.pth"
#FILES["${REPO}/t2iadapter_keypose_sd14v1.pth"]="${FOLDER}/t2iadapter_keypose_sd14v1.pth"
FILES["${REPO}/t2iadapter_openpose_sd14v1.pth"]="${FOLDER}/t2iadapter_openpose_sd14v1.pth"
#FILES["${REPO}/t2iadapter_seg_sd14v1.pth"]="${FOLDER}/t2iadapter_seg_sd14v1.pth"
#FILES["${REPO}/t2iadapter_sketch_sd14v1.pth"]="${FOLDER}/t2iadapter_sketch_sd14v1.pth"
#FILES["${REPO}/t2iadapter_sketch_sd15v2.pth"]="${FOLDER}/t2iadapter_sketch_sd15v2.pth"
#FILES["${REPO}/t2iadapter_style_sd14v1.pth"]="${FOLDER}/t2iadapter_style_sd14v1.pth"
#FILES["${REPO}/t2iadapter_zoedepth_sd15v1.pth"]="${FOLDER}/t2iadapter_zoedepth_sd15v1.pth"

# checkpoints(text2img) - stabilityai
REPO="https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/v2-1_768-ema-pruned.safetensors"]="${FOLDER}/v2-1_768-ema-pruned.safetensors"

# checkpoints(text2img) - runwayml
REPO="https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/v1-5-pruned-emaonly.safetensors"]="${FOLDER}/v1-5-pruned-emaonly.safetensors"

# checkpoints(text2img) - AbyssOrangeMix
REPO="https://huggingface.co/WarriorMama777/OrangeMixs/resolve/main/Models/AbyssOrangeMix3"
FOLDER="comfyui/models/checkpoints"

#FILES["${REPO}/AOM3A1B_orangemixs.safetensors"]="${FOLDER}/AOM3A1B_orangemixs.safetensors"
FILES["${REPO}/AOM3A1_orangemixs.safetensors"]="${FOLDER}/AOM3A1_orangemixs.safetensors"
#FILES["${REPO}/AOM3A2_orangemixs.safetensors"]="${FOLDER}/AOM3A2_orangemixs.safetensors"
#FILES["${REPO}/AOM3A3_orangemixs.safetensors"]="${FOLDER}/AOM3A3_orangemixs.safetensors"
#FILES["${REPO}/AOM3B2_orangemixs.safetensors"]="${FOLDER}/AOM3B2_orangemixs.safetensors"
#FILES["${REPO}/AOM3_orangemixs.safetensors"]="${FOLDER}/AOM3_orangemixs.safetensors"

# checkpoints(text2img) - Linaqruf/anything-v3.0
REPO="https://huggingface.co/Linaqruf/anything-v3.0/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/anything-v3-fp16-pruned.safetensors"]="${FOLDER}/anything-v3-fp16-pruned.safetensors"
#FILES["${REPO}/anything-v3-fp32-pruned.safetensors"]="${FOLDER}/anything-v3-fp32-pruned.safetensors"
#FILES["${REPO}/anything-v3-full.safetensors"]="${FOLDER}/anything-v3-full.safetensors"

# checkpoints - SDXL base
REPO="https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/sd_xl_base_1.0.safetensors"]="${FOLDER}/sd_xl_base_1.0.safetensors"

# checkpoints - SDXL refiner
REPO="https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/sd_xl_refiner_1.0.safetensors"]="${FOLDER}/sd_xl_refiner_1.0.safetensors"

# checkpoints(inpaint) - stabilityai
REPO="https://huggingface.co/stabilityai/stable-diffusion-2-inpainting/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/512-inpainting-ema.safetensors"]="${FOLDER}/512-inpainting-ema.safetensors"

# checkpoints(inpaint) - runwayml
REPO="https://huggingface.co/runwayml/stable-diffusion-inpainting/resolve/main"
FOLDER="comfyui/models/checkpoints"

FILES["${REPO}/sd-v1-5-inpainting.ckpt"]="${FOLDER}/sd-v1-5-inpainting.ckpt"

# vae - stabilityai
REPO="https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main"
FOLDER="comfyui/models/vae"

FILES["${REPO}/vae-ft-mse-840000-ema-pruned.safetensors"]="${FOLDER}/vae-ft-mse-840000-ema-pruned.safetensors"

# vae - hakurei
REPO="https://huggingface.co/hakurei/waifu-diffusion-v1-4/resolve/main/vae"
FOLDER="comfyui/models/vae"

FILES["${REPO}/kl-f8-anime2.ckpt"]="${FOLDER}/kl-f8-anime2.ckpt"

# vae - AbyssOrangeMix
REPO="https://huggingface.co/WarriorMama777/OrangeMixs/resolve/main/VAEs"
FOLDER="comfyui/models/vae"

FILES["${REPO}/orangemix.vae.pt"]="${FOLDER}/orangemix.vae.pt"

# vae - SDXL
REPO="https://huggingface.co/stabilityai/sdxl-vae/resolve/main"
FOLDER="comfyui/models/vae"

FILES["${REPO}/sdxl_vae.safetensors"]="${FOLDER}/sdxl_vae.safetensors"

# loras - adhikjoshi
REPO="https://huggingface.co/adhikjoshi/epi_noiseoffset/resolve/main"
FOLDER="comfyui/models/loras"

FILES["${REPO}/epiNoiseoffset_v2.safetensors"]="${FOLDER}/epiNoiseoffset_v2.safetensors"

# upscale_models - GFPGAN
REPO="https://github.com/TencentARC/GFPGAN/releases/download"
FOLDER="comfyui/models/upscale_models"

FILES["${REPO}/v1.3.4/GFPGANv1.4.pth"]="${FOLDER}/GFPGANv1.4.pth"

# upscale_models - RealESRGAN
REPO="https://github.com/xinntao/Real-ESRGAN/releases/download"
FOLDER="comfyui/models/upscale_models"

FILES["${REPO}/v0.1.0/RealESRGAN_x4plus.pth"]="${FOLDER}/RealESRGAN_x4plus.pth"
FILES["${REPO}/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth"]="${FOLDER}/RealESRGAN_x4plus_anime_6B.pth"

# gligen - comfyanonymous
REPO="https://huggingface.co/comfyanonymous/GLIGEN_pruned_safetensors/resolve/main"
FOLDER="comfyui/models/gligen"

FILES["${REPO}/gligen_sd14_textbox_pruned.safetensors"]="${FOLDER}/gligen_sd14_textbox_pruned.safetensors"
FILES["${REPO}/gligen_sd14_textbox_pruned_fp16.safetensors"]="${FOLDER}/gligen_sd14_textbox_pruned_fp16.safetensors"


for source in "${!FILES[@]}"; do
  dist="${FILES[$source]}"
  current_date=`date "+%H:%M:%S"`
  echo "${current_date}" - wget "${source}"

  if [ ! -e "${dist}" ]; then
    wget -nc "${source}" -O "${dist}" -o download_models_files.log
  fi

done

echo 'Download completed.'
