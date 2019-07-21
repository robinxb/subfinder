# subfinder in Docker 容器化字幕查找器 

subfinder 是一个通用字幕查找器，可以查找字幕并下载。

subfinder is a subtitle finder.

我基于原工程将其容器化，省去了python运行环境和编译.

I made this project into container, you can save time for build it.

此容器将每隔10分钟检测设置文件夹及其子文件夹下所有文件的字幕。

This container will detect subtitles every 10 minutes in the folder and its subfolder which you set before.

# How to use 如何使用

Run docker command / 运行docker指令

`docker run -d -v "/path/to/yourfolder:/mymovie" -e SUBFIND_DIR=/mymovie/ robinxb/subfinder`

# Environment / 环境变量

1. `SUBFIND_DIR` Target folder 目标文件夹

# Suggestion / 建议

You can set folder to the temp folder where incompleted downloadings store in.

你可以将目标文件夹设置为未完成下载的临时文件夹。

# Example / 例子

```
[~] # docker run -d -v "/share/ttg/temp/:/mymovie" -e SUBFIND_DIR=/mymovie/ robinxb/subfinder
[~] # docker logs 38e
crond: crond (busybox 1.30.1) started, log level 8
crond: USER root pid   9 cmd subfinder ${SUBFIND_DIR}
[07/21 02:40:01]-[INFO]: 开始
[07/21 02:40:01]-[INFO]: 在 /mymovie 下没有发现视频文件
```
