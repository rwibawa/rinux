# Genesis

## Build
```sh
~$ cd src
/src$ nasm -f elf64 boot.s
/src$ gcc -nostdlib -nostdinc -fno-builtin -fno-stack-protector -c -o main.o main.c
/src$ ld -Tlink.ld -o kernel boot.o main.o
/src$ ll
total 64
drwxr-xr-x 2 ryan ryan  4096 Apr  3 16:12 ./
drwxr-xr-x 6 ryan ryan  4096 Apr  2 16:51 ../
-rw-r--r-- 1 ryan ryan   441 Apr  3 16:00 Makefile
-rw-r--r-- 1 ryan ryan  1152 Apr  3 16:10 boot.o
-rw-r--r-- 1 ryan ryan  2065 Aug 21  2007 boot.s
-rwxr-xr-x 1 ryan ryan 13792 Apr  3 16:12 kernel*
-rw-r--r-- 1 ryan ryan   659 Aug 21  2007 link.ld
-rw-r--r-- 1 ryan ryan   240 Apr  3 15:48 main.c
-rw-r--r-- 1 ryan ryan  1368 Apr  3 16:11 main.o
/src$ cd ..

$ sudo mkdir /mnt2
$ sudo /sbin/losetup /dev/loop0 floppy.img
$ sudo mount /dev/loop0 /mnt2
$ sudo cp src/kernel /mnt2/kernel
$ ll /mnt2
total 33
drwxr-xr-x  4 root root  1024 Aug 20  2007 ./
drwxr-xr-x 20 root root  4096 Apr  3 15:22 ../
drwxr-xr-x  3 root root  1024 Dec 28  2006 boot/
-rwxr-xr-x  1 root root 13792 Apr  3 16:17 kernel*
drwx------  2 root root 12288 Dec 28  2006 lost+found/
$ sudo umount /dev/loop0
$ sudo /sbin/losetup -d /dev/loop0

$ sudo apt-get install -y bochs bochs-x
$ ./run_bochs.sh 

```