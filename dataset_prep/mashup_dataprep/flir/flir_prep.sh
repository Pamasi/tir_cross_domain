echo 'running flir2yolo_prep...'

echo 'cleaning folders...'
rm -rf images/train_flir_images/labels
rm -rf images/test_flir_images/labels
rm -rf images/val_flir_images/labels

echo 'rename folders in the correct way. ignor errors.'
mv flir_dataset/images_thermal_train flir_dataset/train_flir_images
mv flir_dataset/video_thermal_test flir_dataset/test_flir_images
mv flir_dataset/images_thermal_val flir_dataset/val_flir_images

echo 'copying py script inside each folder'
cp flir2yolo.py flir_dataset/train_flir_images
cp flir2yolo.py flir_dataset/test_flir_images
cp flir2yolo.py flir_dataset/val_flir_images

echo 'running py script to create labels in the right format...'
cd flir_dataset/train_flir_images && python3 flir2yolo.py . && cd ../..
cd flir_dataset/test_flir_images && python3 flir2yolo.py . && cd ../..
cd flir_dataset/val_flir_images && python3 flir2yolo.py . && cd ../..

echo 'creating output folder.'
rm -rf thermal
mkdir -p thermal

mkdir -p thermal/images
mkdir -p thermal/labels

echo 'moving the labels and images inside the "thermal" directory...'

echo '>>> test'
mv ./flir_dataset/test_flir_images/labels ./thermal/labels/test_flir_images
cp -r ./flir_dataset/test_flir_images/data thermal/images
mv thermal/images/data thermal/images/test_flir_images

echo '>>> train'
mv ./flir_dataset/train_flir_images/labels ./thermal/labels/train_flir_images
cp -r ./flir_dataset/train_flir_images/data thermal/images
mv thermal/images/data thermal/images/train_flir_images

echo '>>> val'
mv ./flir_dataset/val_flir_images/labels ./thermal/labels/val_flir_images
cp -r ./flir_dataset/val_flir_images/data thermal/images
mv thermal/images/data thermal/images/val_flir_images

echo 'removing temporary folders...'

echo 'flir2yolo completed.'
