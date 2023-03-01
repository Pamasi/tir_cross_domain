echo 'running uav2yolo_prep...'

echo 'cleaning folders...'
rm -rf test_uav
rm -rf train_uav
rm -rf val_uav

echo 'creating temporary folders'
mkdir test_uav
mkdir train_uav
mkdir val_uav

echo 'copying relevant data annotations and images'
cp normal_json/annotations/test.json ./test_uav/
mv ./test_uav/test.json ./test_uav/index.json

cp normal_json/annotations/train.json ./train_uav/
mv ./train_uav/train.json ./train_uav/index.json

cp normal_json/annotations/val.json ./val_uav/
mv ./val_uav/val.json ./val_uav/index.json

cp -r ./normal_json/test ./test_uav/data
cp -r ./normal_json/train ./train_uav/data
cp -r ./normal_json/val ./val_uav/data

cp uav2yolo.py test_uav/
cp uav2yolo.py train_uav/
cp uav2yolo.py val_uav/

echo 'running py script to create labels in the right format...'
cd test_uav && python3 uav2yolo.py . && cd ..
cd train_uav && python3 uav2yolo.py . && cd ..
cd val_uav && python3 uav2yolo.py . && cd ..

echo 'creating output folder.'
rm -rf thermal
mkdir -p thermal

mkdir -p thermal/images
mkdir -p thermal/labels

echo '>>> test'
cp -r test_uav/labels thermal/labels
mv thermal/labels/labels thermal/labels/test_flir_images
cp -r test_uav/data/ thermal/images
mv thermal/images/data thermal/images/test_flir_images

echo '>>> train'
cp -r train_uav/labels thermal/labels
mv thermal/labels/labels thermal/labels/train_flir_images
cp -r train_uav/data/ thermal/images
mv thermal/images/data thermal/images/train_flir_images

echo '>>> val'
cp -r val_uav/labels thermal/labels
mv thermal/labels/labels thermal/labels/val_flir_images
cp -r val_uav/data/ thermal/images
mv thermal/images/data thermal/images/val_flir_images

echo 'removing temporary folders...'
rm -rf test_uav train_uav val_uav

echo 'uav2yolo completed.'
