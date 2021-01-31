; 
;	Title: devenv
;	Date: Jan 30 2021
;	Purpose: creates a development environment for you
; 
bits 32 ; should work on your system, as most system can also use 32 bit assembly as well.
		; if not, uhh, i guess wait for a 64 bit version? 




section .data
message : db "creating a developer environment [on current directory] " , 0xa
messagelength equ $-message

source : db "source"  , 0xa, 0xd ,0x0 
include : db "include" , 0xa, 0xd ,0x0
build : db "build" , 0xa, 0xd ,0x0
assets : db "assets" , 0xa, 0xd , 0x0

readme_title : db "readme.md" , 0xa, 0xd , 0x0


section .text
global _start:


_start:
	; we get the text gfx on the screen.	 
	mov eax, 0x4
	mov ebx, 1
	mov ecx, message
	mov edx, messagelength
	int 0x80

	; source folder

	mov eax, 39
	mov ebx, source
	mov ecx, 0o777 
 
	int 0x80

	; include folder

	mov eax, 39
	mov ebx, include
	mov ecx, 0o777
 
	int 0x80

	; assets folder

	mov eax, 39
	mov ebx, assets
	mov ecx, 0o777
 
	int 0x80

	; build

	mov eax, 39
	mov ebx, build
	mov ecx, 0o777
	int 0x80

	; read me

	mov eax, 8
	mov ebx, readme_title
	mov ecx, 0o777
	int 0x80


	mov eax, 0x1
	mov ebx, 0
	int 0x80
	ret
