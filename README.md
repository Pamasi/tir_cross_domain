#  Cross-Domain Object Detection for UAV-based Thermal Imaging

Semester project done by [Paolo Dimasi](https://github.com/Pamasi), [Alberto Foti](https://github.com/XXmorpheusX) and [Samuele Pino](https://github.com/SamuelePino) for the course 01URPOV - Machine learning for vision and multimedia at Politecnico of Turin.

## Installation


``` shell
# apt install required packages
apt update
apt install -y zip htop screen libgl1-mesa-glx

# pip install required packages
pip install -r requirements.txt

```

</details>

## Testing

``` shell
python3 test.py --data data/data.yaml --img 640 --batch 32 --conf 0.001 --iou 0.65 --device 0 --weights <path/yolov7-weight.pt> --name <your_yolov7_trained_name>
```




## Training

Data preparation


``` shell
# train yolov7  models
python3 train.py --workers 32 --device 0  --batch-size 32 --data cfg/thermal-data.yaml --img 640 512 --cfg cfg/network/yolov7-tiny-silu.yaml --name <your_yolov7_name> --hyp data/hyp.yaml  --epochs 100  --weights "''"

```

## Transfer learning

``` shell
# finetune p5 models
python3 train.py --workers 8 --device 0 --batch-size 32 --data data/custom.yaml --img 640 512 --cfg cfg/training/yolov7-custom.yaml --weights <path/yolov7-weight.pt> --name <your_yolov7_pretrained_name> --hyp data/hyp.yaml
```

## Inference

On video:
``` shell
python3 detect.py --weights <path/yolov7-weight.pt> --conf 0.25 --img 640 --source <path/yourvideo.mp4>
```

On image:
``` shell
python3 detect.py --weights <path/yolov7-weight.pt> --conf 0.25 --img 640 --source <path/yourimage.jpg>
```

<div align="center">
    <a href="./">
        <img src="./images/uav_view_prediction.jpg" width="59%"/>
    </a>
</div>



## Teaser


<div align="center">
    <a href="./">
        <img src="./images/stree_view.jpg" width="24%"/>
    </a>
    <a href="./">
        <img src="./images/stree_view_prediction.jpg" width="24%"/>
    </a>
    <a href="./">
        <img src="./images/uav_view.jpg" width="24%"/>
    </a>
    <a href="./">
        <img src="./images/uav_view_prediction.jpg" width="24%"/>
    </a>
</div>

## Citation
As long as you cite us  you are free to use it.

## Acknowledgements

<details><summary> <b>Expand</b> </summary>

* [https://github.com/WongKinYiu/yolov7](https://github.com/WongKinYiu/yolov7)
* [https://github.com/suojiashun/HIT-UAV-Infrared-Thermal-Dataset](https://github.com/suojiashun/HIT-UAV-Infrared-Thermal-Dataset)



</details>

## Copyright
Copyright (C) 2022  Paolo Dimasi, Alberto Foti, Samuele Pino
