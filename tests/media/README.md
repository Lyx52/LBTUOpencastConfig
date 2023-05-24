[[_TOC_]]

# Example files

## Master files

Master files are usually not included in this repository. They can be downloaded form the mentioned URL.

### Big Buck Bunny

Creative Commons Attribution 3.0 license

Blender Foundation | www.blender.org

<https://public.educast.cloud/media/master/big-buck-bunny.mp4>

```sh
$ ffprobe -hide_banner big-buck-bunny.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'big-buck-bunny.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:10:34.57, start: 0.000000, bitrate: 10492 kb/s
  Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 4000x2250 [SAR 1:1 DAR 16:9], 10002 kb/s, 60 fps, 60 tbr, 60k tbn, 120 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: mp3 (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 160 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
  Stream #0:2(und): Audio: ac3 (ac-3 / 0x332D6361), 48000 Hz, 5.1(side), fltp, 320 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
    Side data:
      audio service type: main
```

### Caminandes 1: Llama Drama

Creative Commons Attribution 3.0 license

(CC) caminandes.com

<https://public.educast.cloud/media/master/caminandes-1-llama-drama.mp4>

```sh
$ ffprobe -hide_banner caminandes-1-llama-drama.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'caminandes-1-llama-drama.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:01:30.00, start: 0.000000, bitrate: 36171 kb/s
  Stream #0:0(und): Video: h264 (Main) (avc1 / 0x31637661), yuv420p, 4096x2160 [SAR 1:1 DAR 256:135], 35877 kb/s, 24 fps, 24 tbr, 12288 tbn, 48 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 288 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
```

### Caminandes 3: Llamigos

Creative Commons Attribution 3.0 license

(CC) caminandes.com

<https://public.educast.cloud/media/master/caminandes-3-llamigos.mp4>

```sh
$ ffprobe -hide_banner caminandes-3-llamigos.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'caminandes-3-llamigos.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:02:30.13, start: 0.000000, bitrate: 10680 kb/s
  Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 1920x1080 [SAR 1:1 DAR 16:9], 10424 kb/s, 24 fps, 24 tbr, 12288 tbn, 48 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 255 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
```

### Noise

This file is created using the following command:

```sh
$ ffmpeg -hide_banner \
    -f rawvideo -video_size 3840x2160 -pixel_format yuv420p -framerate 25 -i /dev/urandom \
    -ar 48000 -ac 2 -f s16le -i /dev/urandom \
    -c:v libx264 \
      -preset medium \
      -profile:v high \
      -crf 23 \
    -c:a copy \
    -t 10 \
    noise.mov
```

This will test the worst case scenario for encoders.

<https://public.educast.cloud/media/master/noise.mov>

```sh
$ ffprobe -hide_banner noise.mov
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'noise.mov':
  Metadata:
    major_brand     : qt
    minor_version   : 512
    compatible_brands: qt
    encoder         : Lavf58.76.100
  Duration: 00:00:10.01, start: 0.000000, bitrate: 1048643 kb/s
  Stream #0:0: Video: h264 (High) (avc1 / 0x31637661), yuv420p, 3840x2160, 1047732 kb/s, 25 fps, 25 tbr, 12800 tbn, 50 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : FFMP
      encoder         : Lavc58.134.100 libx264
  Stream #0:1: Audio: pcm_s16le (sowt / 0x74776F73), 48000 Hz, stereo, s16, 1536 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
```

### Jur3

<https://public.educast.cloud/media/master/jur3.mp4>

```sh
$ ffprobe -hide_banner jur3.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'jur3.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:00:48.46, start: 0.000000, bitrate: 40425 kb/s
  Stream #0:0(und): Video: h264 (Constrained Baseline) (avc1 / 0x31637661), yuv420p(tv, bt709), 3840x2160 [SAR 1:1 DAR 16:9], 40412 kb/s, 29.97 fps, 29.97 tbr, 30k tbn, 59.94 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 127 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
```

### Sintel

Creative Commons Attribution 3.0 license

© copyright Blender Foundation | durian.blender.org

<https://public.educast.cloud/media/master/sintel.mov>

```sh
$ ffprobe -hide_banner sintel.mov
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'sintel.mov':
  Metadata:
    major_brand     : qt
    minor_version   : 512
    compatible_brands: qt
    encoder         : Lavf58.76.100
  Duration: 00:14:48.00, start: 0.000000, bitrate: 41972 kb/s
  Stream #0:0: Video: h264 (High) (avc1 / 0x31637661), yuv420p, 4096x1744, 29678 kb/s, 24 fps, 24 tbr, 12288 tbn, 48 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : FFMP
  Stream #0:1(eng): Audio: pcm_f32le (fl32 / 0x32336C66), 48000 Hz, 5.1, flt, 9216 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
  Stream #0:2(eng): Audio: pcm_f32le (fl32 / 0x32336C66), 48000 Hz, stereo, flt, 3072 kb/s
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
  Stream #0:3(eng): Subtitle: mov_text (text / 0x74786574), 0 kb/s (default)
    Metadata:
      handler_name    : SubtitleHandler
  Stream #0:4(ger): Subtitle: mov_text (text / 0x74786574), 0 kb/s
    Metadata:
      handler_name    : SubtitleHandler
```

### Tears of Steel

Creative Commons Attribution 3.0 license

(CC) Blender Foundation | mango.blender.org

<https://public.educast.cloud/media/master/tears-of-steel.mov>

```sh
$ ffprobe -hide_banner tears-of-steel.mov
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'tears-of-steel.mov':
  Metadata:
    major_brand     : qt
    minor_version   : 512
    compatible_brands: qt
    encoder         : Lavf58.76.100
  Duration: 00:12:14.00, start: 0.000000, bitrate: 70453 kb/s
  Stream #0:0: Video: h264 (High 4:4:4 Predictive) (avc1 / 0x31637661), yuv444p10le, 4096x1714 [SAR 1:1 DAR 2048:857], 61229 kb/s, 24 fps, 24 tbr, 12288 tbn, 48 tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : FFMP
      encoder         : Lavc58.134.100 libx264
  Stream #0:1(eng): Audio: pcm_s24le (in24 / 0x34326E69), 48000 Hz, 5.1, s32 (24 bit), 6912 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
  Stream #0:2(eng): Audio: pcm_s24le (in24 / 0x34326E69), 48000 Hz, stereo, s32 (24 bit), 2304 kb/s
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
  Stream #0:3(eng): Subtitle: mov_text (text / 0x74786574), 0 kb/s (default)
    Metadata:
      handler_name    : SubtitleHandler
  Stream #0:4(ger): Subtitle: mov_text (text / 0x74786574), 0 kb/s
    Metadata:
      handler_name    : SubtitleHandler
```

### Wikipedia Opencast

<https://public.educast.cloud/media/master/wikipedia-opencast-variable-resolution.mp4>

<https://public.educast.cloud/media/master/wikipedia-opencast-vfr.mp4>

```sh
$ ffprobe -hide_banner resolution-variable-wikipedia-opencast.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'resolution-variable-wikipedia-opencast.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:00:16.28, start: 0.000000, bitrate: 3977 kb/s
  Stream #0:0(und): Video: h264 (Constrained Baseline) (avc1 / 0x31637661), yuv420p, 1148x448, 3978 kb/s, SAR 1:1 DAR 41:16, 11.63 fps, 16k tbr, 16k tbn, 32k tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 2 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]

$ ffprobe -hide_banner fps-vfr-1-28-wikipedia-opencast.mp4
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'fps-vfr-1-28-wikipedia-opencast.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf58.76.100
  Duration: 00:00:15.00, start: 0.000000, bitrate: 1950 kb/s
  Stream #0:0(und): Video: h264 (Baseline) (avc1 / 0x31637661), yuv420p, 2048x1128 [SAR 1:1 DAR 256:141], 1950 kb/s, 8.36 fps, 120 tbr, 16k tbn, 32k tbc (default)
    Metadata:
      handler_name    : VideoHandler
      vendor_id       : [0][0][0][0]
  Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 2 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
      vendor_id       : [0][0][0][0]
```

## Samples

Samples are derived from the master files. Attribution and license remain the same.

### Full

The full encoding is done as seen below. All variations after that change some parameters from this default.

```sh
$ ffmpeg -hide_banner -i master.ext \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    full-out.mp4
```

### Short

60 second variation of master videos.

```sh
$ ffmpeg -hide_banner -i big-buck-bunny.mp4 \
    -sn -dn -map_metadata -1 \
    -t 60 \
    -s 1280x720 \
    -c:v libx264 \
      -fps_mode cfr -r 30 \
    -c:a aac \
      -ac 2 \
      -ar 44100 \
    -movflags +faststart \
    short-big-buck-bunny.mp4
```

### Tiny

2 frame variation of master videos.

```sh
$ ffmpeg -hide_banner -ss 00:00:30.0 -i big-buck-bunny.mp4 \
    -sn -dn -map_metadata -1 \
    -t 0.05 \
    -s 1280x720 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 30 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    -movflags +faststart \
    tiny-big-buck-bunny.mp4
```

### Stream Variations

TODO

testvideo-video-0.mp4
testvideo-video-720p.mp4
testvideo-video-720p+1080p.mp4

testvideo-vn-an.mp4

testvideo-sub-no.mp4
testvideo-sub-eng.mp4
testvideo-sub-eng+ger.mp4

testvideo-ac-0.mp4
testvideo-ac-2.0+5.1.mp4

### Format Variations

3gp
adif
aiff
amr
asf
avi
f4v
flv
m4v (with wrong codecs)
mkv
mov
mp4
mpeg
mpg
mts
mxf
nut
ogg
ogv
swf
ts
webm
wmv

### Video Variations

#### Aspect Ratio & Resolution

##### 16:9 (144p, 240p, 360p, 480p, 720p, 1080p, 1440p, 2160p, 4320p)

<details>

```sh
$ ffmpeg -hide_banner -ss 00:01:46.0 -i big-buck-bunny.mp4 \
    -t 10 \
    -filter:v "scale=256:256:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-144p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=427:427:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-240p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=640:640:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-360p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=854:854:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-480p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=1280:1280:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-720p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-1080p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=2560:2560:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-1440p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=3840:3840:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-2160p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=7680:7680:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-16-9-4320p-big-buck-bunny.mp4
```

</details>

##### 9:16 (144p, 240p, 360p, 480p, 720p, 1080p, 1440p, 2160p, 4320p)

<details>

```sh
$ ffmpeg -hide_banner -ss 00:01:46.0 -i big-buck-bunny.mp4 \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=256:256:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-144p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=427:427:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-240p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=640:640:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-360p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=854:854:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-480p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=1280:1280:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-720p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-1080p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=2560:2560:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-1440p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=3840:3840:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-2160p-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "transpose=cclock_flip,scale=7680:7680:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-9-16-4320p-big-buck-bunny.mp4
```

</details>

##### 2.40:1 (144p, 240p, 360p, 480p, 720p, 1080p, 1440p, 2160p, 4320p)

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:21.0 -i tears-of-steel.mov \
    -t 10 \
    -filter:v "scale=256:256:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-144p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=427:427:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-240p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=640:640:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-360p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=854:854:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-480p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=1280:1280:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-720p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-1080p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=2560:2560:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-1440p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=3840:3840:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-2160p-tears-of-steel.mp4 \
    \
    -t 10 \
    -filter:v "scale=7680:7680:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    resolution-2.40-1-4320p-tears-of-steel.mp4
```

</details>

##### Variable

`resolution-variable-wikipedia-opencast.mp4` was created with Opencast Studio (Chrome macOS).

#### Framerates

##### Constant frame rates (15, 24, 25, 29.970, 30, 50, 60, 120)

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 15 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-15-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-24-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 25 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-25-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 30000/1001 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-29.970-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 30 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-30-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 50 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-50-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 60 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-60-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -fps_mode cfr -r 120 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    fps-cfr-120-caminandes-3-llamigos.mp4
```

</details>

##### Variable frame rates

`fps-vfr-1-28-wikipedia-opencast.mp4` was created with Opencast Studio (Chrome macOS).

#### Field Order

<details>

```sh
$ ffmpeg -hide_banner -ss 00:01:46.0 -i big-buck-bunny.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1,fps=30" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    field_order-progressive-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1,fps=60,tinterlace=interleave_top,fieldorder=tff" \
    -sn -dn -map_metadata -1 \
    -flags +ilme+ildct \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -x264opts tff=1 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    field_order-tff-big-buck-bunny.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1,fps=60,tinterlace=interleave_bottom,fieldorder=bff" \
    -sn -dn -map_metadata -1 \
    -flags +ilme+ildct \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -x264opts bff=1 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    field_order-bff-big-buck-bunny.mp4
```

</details>

#### Display/Storage/Pixel Aspect Ratio

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1080,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    sar-1-1-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:2160,setsar=2/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    sar-2-1-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1440:1080,setsar=4/3" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    sar-4-3-caminandes-3-llamigos.mp4
```

</details>

#### Display Matrix

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    tmp-display_matrix-caminandes-3-llamigos.mp4

$ ffmpeg -hide_banner -i tmp-display_matrix-caminandes-3-llamigos.mp4 \
    -sn -dn -map_metadata -1 \
    -metadata:s:v:0 rotate="-90" \
    -c copy \
    display_matrix-rotate-90-caminandes-3-llamigos.mp4 \
    \
    -sn -dn -map_metadata -1 \
    -metadata:s:v:0 rotate="-180" \
    -c copy \
    display_matrix-rotate-180-caminandes-3-llamigos.mp4 \
    \
    -sn -dn -map_metadata -1 \
    -metadata:s:v:0 rotate="+90" \
    -c copy \
    display_matrix-rotate+90-caminandes-3-llamigos.mp4

$ rm tmp-display_matrix-caminandes-3-llamigos.mp4
```

</details>

#### Color Range

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2:out_range=full,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuvj420p \
      -color_range pc \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    -movflags +write_colr \
    color_range-pc-caminandes-3-llamigos.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2:out_range=limited,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
      -color_range tv \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    -movflags +write_colr \
    color_range-tv-caminandes-3-llamigos.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      format=yuv420p
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color_range-tv-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      format=yuvj420p
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuvj420p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range pc \
      -field_order progressive \
    color_range-pc-bars.mp4
```

</details>

#### Color

TODO: add examples for

* yuv420p12
* yuv422p12
* yuv444p12
* hdr
* hlg
* log formate
* alpha channel

<details>

```sh
$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv420p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv420p-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv420p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
    color-yuv420p-bt709-untagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv420p10:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p10 \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv420p10-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv422p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv422p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv422p-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv422p10:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv422p10 \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv422p10-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv444p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv444p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv444p-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt709:format=yuv444p10:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv444p10 \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv444p10-bt709-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      format=rgb24
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264rgb \
      -preset medium \
      -pix_fmt rgb24 \
      -color_range pc \
      -field_order progressive \
    color-rgb24-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt601-6-625:format=yuv420p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p \
      -colorspace bt470bg \
      -color_primaries bt470bg \
      -color_trc gamma28 \
      -color_range tv \
      -field_order progressive \
    color-yuv420p-bt601-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt601-6-625:format=yuv420p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
    color-yuv420p-bt601-untagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt2020:format=yuv420p10:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p10 \
      -colorspace bt2020nc \
      -color_primaries bt2020 \
      -color_trc bt2020-10 \
      -color_range tv \
      -field_order progressive \
    color-yuv420p10-bt2020-tagged-bars.mp4

$ ffmpeg -hide_banner \
    -f lavfi -i "
      smptehdbars=size=1920x1080:rate=25:duration=30,
      setparams=field_mode=prog:range=tv:color_primaries=bt709:color_trc=bt709:colorspace=bt709,
      colorspace=all=bt2020:format=yuv420p10:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
    color-yuv420p10-bt2020-untagged-bars.mp4

$ ffmpeg -hide_banner \
    -i color-yuv420p-bt601-tagged-bars.mp4 \
    -filter:v "
      colorspace=all=bt709:format=yuv420p:fast=true
    " \
    -noauto_conversion_filters \
    -noautoscale \
    -c:v libx264 \
      -preset medium \
      -pix_fmt yuv420p \
      -colorspace bt709 \
      -color_primaries bt709 \
      -color_trc bt709 \
      -color_range tv \
      -field_order progressive \
    color-yuv420p-bt601-to-bt709-tagged-bars.mp4
```

</details>

#### Codecs

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v mpeg1video \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-mpeg1-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v mpeg2video \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-mpeg2-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v baseline \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-h.264-baseline-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v main \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-h.264-main-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-h.264-high-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "format=yuv420p10,scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high10 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p10 \
    codec-h.264-high10-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "format=yuv422p10,scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high422 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv422p10 \
    codec-h.264-high422-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "format=yuv444p10,scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high444 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv444p10 \
    codec-h.264-high444-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx265 \
      -preset:v medium \
      -profile:v main \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-hevc-main-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libx265 \
      -preset:v medium \
      -profile:v main10 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p10 \
    codec-hevc-main10-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libvpx \
      -deadline good \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-vp8-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libvpx-vp9 \
      -deadline good \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-vp9-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libaom-av1 \
      -tile-columns 2 -tile-rows 4 \
      -cpu-used 6 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-av1-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v libtheora \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-theora-5-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v wmv2 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-wmv2-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v msmpeg4v3 \
      -r 24 \
      -b:v 4M \
      -pix_fmt:v yuv420p \
    codec-msmpeg4v3-caminandes-3-llamigos.nut



$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v prores_ks \
      -profile:v proxy \
      -r 24 \
      -pix_fmt:v yuv422p10 \
    codec-prores-422proxy-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v prores_ks \
      -profile:v lt \
      -r 24 \
      -pix_fmt:v yuv422p10 \
    codec-prores-422lt-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v prores_ks \
      -profile:v standard \
      -r 24 \
      -pix_fmt:v yuv422p10 \
    codec-prores-422-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v prores_ks \
      -profile:v hq \
      -r 24 \
      -pix_fmt:v yuv422p10 \
    codec-prores-422hq-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -an -sn -dn -map_metadata -1 \
    -c:v prores_ks \
      -profile:v 4444 \
      -r 24 \
      -pix_fmt:v yuv444p10 \
    codec-prores-4444-caminandes-3-llamigos.nut
```

</details>

### Audio Variations

#### Number of Channels

<details>

```sh
$ ffmpeg -hide_banner -ss 00:04:10.0 -i sintel.mov \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 1 \
      -ab 196k \
      -ar 44100 \
    ac-1-sintel.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 44100 \
    ac-2-sintel.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 6 \
      -ab 196k \
      -ar 44100 \
    ac-5.1-sintel.mp4 \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 8 \
      -ab 196k \
      -ar 44100 \
    ac-7.1-sintel.mp4
```

</details>

#### Sample Rate

<details>

```sh
$ ffmpeg -hide_banner -ss 00:04:10.0 -i sintel.mov \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 8000 \
    ar-8000-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 16000 \
    ar-16000-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 22050 \
    ar-22050-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 44100 \
    ar-44100-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 48000 \
    ar-48000-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 96000 \
    ar-96000-sintel.mkv \
    \
    -t 10 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 6 \
      -ar 192000 \
    ar-192000-sintel.mkv
```

</details>

#### Codecs

<details>

```sh
$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libmp3lame \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-mp3-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a aac \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-aac-lc-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libfdk_aac \
      -profile:a aac_he \
      -ac 2 \
      -ab 64k \
      -ar 48000 \
    acodec-aac-he-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libfdk_aac \
      -profile:a aac_he_v2 \
      -ac 2 \
      -ab 32k \
      -ar 48000 \
    acodec-aac-he-v2-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libfdk_aac \
      -profile:a aac_ld \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-aac-ld-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libfdk_aac \
      -profile:a aac_eld \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-aac-eld-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libopus \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-opus-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libvorbis \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-vorbis-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a flac \
      -ac 2 \
      -ar 48000 \
    acodec-flac-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a pcm_s24le \
      -ac 2 \
      -ar 48000 \
    acodec-pcm_s24le-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a pcm_f32le \
      -ac 2 \
      -ar 48000 \
    acodec-pcm_f32le-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a alac \
      -ac 2 \
      -ar 48000 \
    acodec-alac-caminandes-3-llamigos.mp4

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a wmav1 \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-wmav1-caminandes-3-llamigos.mkv

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a wmav2 \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-wmav2-caminandes-3-llamigos.mkv

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a ac3 \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-ac3-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a eac3 \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-eac3-caminandes-3-llamigos.mkv

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -filter:v "select=eq(n\,0),scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -c:v libx264 \
      -preset:v medium \
      -profile:v high \
      -r 24 \
      -crf:v 23 \
      -pix_fmt:v yuv420p \
    -c:a libspeex \
      -ac 2 \
      -ab 196k \
      -ar 32000 \
    acodec-speex-caminandes-3-llamigos.nut

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -t 10 \
    -c:a libmp3lame \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-mp3-caminandes-3-llamigos.mp3

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 \
    -filter:v "scale=1920:1920:force_original_aspect_ratio=decrease:force_divisible_by=2,setsar=1/1" \
    -sn -dn -map_metadata -1 \
    -frames:v 1 \
    tmp-cover-acodec-mp3-caminandes-3-llamigos.png

$ ffmpeg -hide_banner -ss 00:00:39.0 -i caminandes-3-llamigos.mp4 -i tmp-cover-acodec-mp3-caminandes-3-llamigos.png \
    -t 10 \
    -map 0:1 -map 1:0 \
    -id3v2_version 3 \
      -map_metadata -1 \
      -metadata:s:v title="Album cover" \
      -metadata:s:v comment="Cover (front)" \
    -c:v copy \
    -c:a libmp3lame \
      -ac 2 \
      -ab 196k \
      -ar 48000 \
    acodec-mp3-caminandes-3-llamigos-cover.mp3
```

</details>

### Subtitle Variations

#### Codecs

<details>

```sh
$ ffmpeg -hide_banner -i full-sintel-deu.srt full-sintel-deu.ass
$ ffmpeg -hide_banner -i full-sintel-eng.srt full-sintel-eng.ass
$ ffmpeg -hide_banner -i full-sintel-fra.srt full-sintel-fra.ass
$ ffmpeg -hide_banner -i full-sintel-spa.srt full-sintel-spa.ass

$ ffmpeg -hide_banner -i full-sintel-deu.srt full-sintel-deu.ssa
$ ffmpeg -hide_banner -i full-sintel-eng.srt full-sintel-eng.ssa
$ ffmpeg -hide_banner -i full-sintel-fra.srt full-sintel-fra.ssa
$ ffmpeg -hide_banner -i full-sintel-spa.srt full-sintel-spa.ssa

$ ffmpeg -hide_banner -i full-sintel-deu.srt full-sintel-deu.vtt
$ ffmpeg -hide_banner -i full-sintel-eng.srt full-sintel-eng.vtt
$ ffmpeg -hide_banner -i full-sintel-fra.srt full-sintel-fra.vtt
$ ffmpeg -hide_banner -i full-sintel-spa.srt full-sintel-spa.vtt

$ ffmpeg -hide_banner -i full-tears-of-steel-deu.srt full-tears-of-steel-deu.ass
$ ffmpeg -hide_banner -i full-tears-of-steel-eng.srt full-tears-of-steel-eng.ass
$ ffmpeg -hide_banner -i full-tears-of-steel-fra.srt full-tears-of-steel-fra.ass
$ ffmpeg -hide_banner -i full-tears-of-steel-spa.srt full-tears-of-steel-spa.ass

$ ffmpeg -hide_banner -i full-tears-of-steel-deu.srt full-tears-of-steel-deu.ssa
$ ffmpeg -hide_banner -i full-tears-of-steel-eng.srt full-tears-of-steel-eng.ssa
$ ffmpeg -hide_banner -i full-tears-of-steel-fra.srt full-tears-of-steel-fra.ssa
$ ffmpeg -hide_banner -i full-tears-of-steel-spa.srt full-tears-of-steel-spa.ssa

$ ffmpeg -hide_banner -i full-tears-of-steel-deu.srt full-tears-of-steel-deu.vtt
$ ffmpeg -hide_banner -i full-tears-of-steel-eng.srt full-tears-of-steel-eng.vtt
$ ffmpeg -hide_banner -i full-tears-of-steel-fra.srt full-tears-of-steel-fra.vtt
$ ffmpeg -hide_banner -i full-tears-of-steel-spa.srt full-tears-of-steel-spa.vtt
```

</details>
