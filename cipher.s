# Tyler Brennan
# CPSC275 F 2019

  .file "cipher.s"
.global cipher
  .type cipher, @function
cipher:
  pushl %ebp
  movl  %esp, %ebp
  andl  $-16, %esp
  subl  $32, %esp

  movl  16(%ebp), %eax  # Store 'shift' variable in %eax
  movl  $91, %ecx       # Store 90 in %ecx ('z' ASCII value)
  cmpl  $1, 12(%ebp)     # Check if encrypt or decrypt
  je    .DECRYPT
  addl  8(%ebp), %eax   # c + shift (for encrypt)
  .RETURN:
  movl  %eax, %edx
  sarl  $31, %edx
  idivl %ecx            # (c +/- shift) % 90  (90 is the ASCII value for 'z')
  addl  $65, %edx       # Add ASCII value for 'a' to mod in case it goes over
  movl  %edx, %eax

  leave
  ret

  .DECRYPT:
  subl  8(%ebp), %eax   # c - shift (for decrypt)
  jmp   .RETURN
