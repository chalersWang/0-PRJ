【01】1200
image.png

image.png

★ case：（port 0/1/3）（注：开bridge下无PDI）
chip_mode[1:0]->MODE[1:0]->LINKACT01,LINKACT0->0xE00.1,0xE00.0
一、PDI->EBUS/MII
1、MODE=00
image.png

（1）LVDS+LVDS+PDI（SPI/Digital）
① LVDS+LVDS+PDI（SPI）
② LVDS+LVDS+PDI（Digital-IN）：
无EEPROM LOADED
③ LVDS+LVDS+PDI（Digital-OUT）
（2）LVDS+LVDS+PDI（Bridge-EBUS）
（3）LVDS+LVDS+PDI（Bridge-MII）
2、MODE=10
image.png

（1）MII+LVDS+PDI（SPI）
GPI[1:0]？？？
（2）MII+LVDS+PDI（Bridge-EBUS）
3、MODE=11
（1）LVDS+MII+PDI（SPI）
GPI[1:0]？？？
（2）LVDS+MII+PDI（Bridge-EBUS）

二、PDI
1、DigitalIO
image.png

2、SPI
image.png

三、EBUS/MII
1、EBUS
image.png

2、MII
image.png


