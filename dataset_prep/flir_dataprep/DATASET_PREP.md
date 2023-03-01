# How To Prepare FLIR Dataset for YOLO

1) Download FLIR-Dataset from [FLIR site](https://www.flir.com/oem/adas/adas-dataset-form/)

The folder needed are only those containing 'thermal'; all other files can be ignored/delete.

You should have some folders like:
- train thermal images
- val thermal images
- test thermal images

Once create this initial setup, you have to use `flir2yolo.py`: copy it in each folder (the same as before) and then run 

        python 3 flir2yolo.py .

You should notice a new folder called `labels` containing a .txt for each images in the data folder.

After repeating this process for each of the 3 folder with thermal images, you need to create a folders structure as in the README.md in this dataprep folder...

Then you need to change properly the path arguments in the thermal.yaml in the data folder of this project, setting the entire absolute path to data etc.
something like this

```yaml
path: /path_to_dataset
train: /path_to_dataset/images/train_flir_images  # 10742 images
val: /path_to_dataset/images/val_flir_images  # 1144 images
test: /path_to_dataset/images/test_flir_images  # 3749 images

```
From /YOLO/... everything should be the same as in thi example, you only need to change the previous part

# WIP Let's see if a script to automate this is needed


