define hook-stepi
  if $ebp > 0
    # printf "ebp=%p, esp=%p\n", $ebp, $esp
    x/4x $ebp-16
    x/i $eip
  end
end

starti
watch $ebp
watch $esp

# layout asm
# layout reg

set disassemble-next-line on
# set logging file gdb.log
# set logging enabled
