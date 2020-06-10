# How to use bdml2bd5 on docker

## Build bdml2bd5-docker

```
$ cd bdml2bd5-docker
$ docker build -t bdml2bd5-docker . 
```

## Use bdml2bd5 on docker

When you put "xxxxxxxx.bdml0.18.xml" to "bdml2bd5-docker/bdmls" folder, 

```
$ cd bdml2bd5-docker
$ docker run -it -v bdmls:/root/bdmls bdml2bd5-docker

(on docker)# cd bdmls

(on docker)# ../bdml2bd5/bdml2bd5 xxxxxxxx.bdml0.18.xml
(dataset name)
(number of dataset)
finish to set data
(on docker)# ls -l xxxxxxxx.bd5.h5
xxxxxxxxbd5.h5

(on docker)# exit
```

## Use case for test

```
$ cd bdml2bd5-docker
$ mkdir bdmls
$ cd bdmls
$ wget http://ssbd.qbic.riken.jp/data/bdml/Ce_ZB/081505_L1.bdml0.18.xml
$ cd ..

$ docker run -it -v bdmls:/root/bdmls bdml2bd5-docker

(on docker)# cd bdmls

(on docker)# ../bdml2bd5/bdml2bd5 081505_L1.bdml0.18.xml
081505_L1
1
finish to set data
(on docker)# ls 081505_L1.bd5.h5 
081505_L1.bd5.h5
```
