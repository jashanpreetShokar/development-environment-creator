
; 
;	Title: delenv
;	Date: Jan 30 2021
;	Purpose: Deletes the files created by devenv
; 
bits 32


section .data

message : db "starting to delete all files created by devenv unless a file has contents in it. [on current directory] starting in 2 SECONDS " , 0xa
message_length : equ $-message

countdown_done : db "countdown finished! deleting all files generated. " , 0xa
countdown_done_length : equ $-countdown_done

deletion_finished : db "finished deleting!" , 0xa
deletion_length : equ $-deletion_finished

source : db "source"  , 0xa, 0xd ,0x0 
include : db "include" , 0xa, 0xd ,0x0
build : db "build" , 0xa, 0xd ,0x0
assets : db "assets" , 0xa, 0xd , 0x0

readme_title : db "readme.txt" , 0xa, 0xd , 0x0

seconds: dd 0


section .text
global _start:


_start:
	; we get the text gfx on the screen.	 
	mov eax, 0x4
	mov ebx, 1
	mov ecx, message
	mov edx, message_length
	int 0x80

	mov dword[seconds],2
	mov eax, 162
	mov ebx, seconds
	mov ecx, 0
	int 0x80
	
	; done gfx

	mov eax, 0x4
	mov ebx, 1
	mov ecx, countdown_done
	mov edx, countdown_done_length
	int 0x80



 	; source folder

	mov eax, 40
	mov ebx, source 
	int 0x80

	; include folder

	mov eax, 40
	mov ebx, include 
	int 0x80

	; assets folder

	mov eax, 40
	mov ebx, assets 
	int 0x80

	; build

	mov eax, 40
	mov ebx, build
	int 0x80

	; read me

	mov eax, 10
	mov ebx, readme_title
	int 0x80

	mov eax, 0x4
	mov ebx, 1
	mov ecx, deletion_finished
	mov edx, deletion_length
	int 0x80


	mov eax, 0x1
	mov ebx, 0
	int 0x80
	ret
