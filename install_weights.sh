model_path="./ComfyUI/models"

#####################################
# vae
#####################################
echo "⏳ Downloading -> vae"

wget -c https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors -P ${model_path}/vae/

#####################################
# checkpoints
#####################################
echo "⏳ Downloading -> checkpoints"

wget -c https://huggingface.co/erohinem/SDXL/resolve/bb3b7fa6598742f81f3eae359fe39165ba29e6dd/juggernautXL_v9Rdphoto2Lightning.safetensors -O ${model_path}/checkpoints/juggernautXL_v9Rdphoto2Lightning.safetensors
wget -c https://civitai.com/api/download/models/354657 -O ${model_path}/checkpoints/dreamshaperXL_lightningDPMSDE.safetensors

#####################################
# clip_vision
#####################################
echo "⏳ Downloading -> clip_vision"

wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors -O ${model_path}/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors -O ${model_path}/clip_vision/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors
wget -c https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/image_encoder/pytorch_model.bin -O ${model_path}/clip_vision/clip-vit-large-patch14-336.bin

#####################################
# ipadapter
#####################################
echo "⏳ Downloading -> ipadapter"

wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors -P ${model_path}/ipadapter/
wget -c https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors -P ${model_path}/ipadapter/

#####################################
# instantid
#####################################
echo "⏳ Downloading -> instantid"

wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ip-adapter.bin -P ${model_path}/instantid/

#####################################
# controlnet
#####################################
echo "⏳ Downloading -> controlnet"

wget -c https://huggingface.co/InstantX/InstantID/resolve/main/ControlNetModel/diffusion_pytorch_model.safetensors -P ${model_path}/controlnet/

#####################################
# insightface
#####################################
echo "⏳ Downloading -> insightface"

wget -c https://huggingface.co/MonsterMMORPG/tools/resolve/main/antelopev2.zip -P ${model_path}/insightface/
unzip ${model_path}/insightface/antelopev2.zip -d ${model_path}/insightface/models/

#####################################
# upscale_models
#####################################
echo "⏳ Downloading -> upscale_models"

wget https://github.com/Phhofm/models/raw/main/4xLSDIRplus/4xLSDIRplus.pth -P ${model_path}/upscale_models/
