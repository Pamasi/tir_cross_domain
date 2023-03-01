# Make sure you have the following folder structure:
#
# >> ls
#    dataprep.sh
#    flir/
#       flir_dataset/
#            images_thermal_train/
#            video_thermal_test/
#            images_thermal_val/
#       flir2yolo.py
#       flir_prep.sh
#    uav/
#       normal_json/
#            ...
#       uav2yolo.py
#       uav_prep.sh
#
# ------------------------------------------
#
# Output will be in the "thermal" folder, in the root directory where dataprep.sh is located.
#
# ------------------------------------------

sudo apt install rsync

echo '>>> Cleaning folder'
rm -rf thermal
mkdir thermal

# FLIR Dataset Prep
echo '>>> FLIR Dataset prep'
cd flir && bash flir_prep.sh && cd ..
echo '>>> FLIR Dataset : Collecting results'
rsync --remove-source-files -a flir/thermal .
echo '>>> FLIR Dataset prep done.'

# UAV Dataset Prep
echo '>>> UAV Dataset prep'
cd uav && bash uav_prep.sh && cd ..
echo '>>> UAV Dataset : Collecting results'
rsync --remove-source-files -a uav/thermal .
echo '>>> UAV Dataset prep done.'

echo '>>> DONE.'



