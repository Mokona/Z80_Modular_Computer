'I2CMGR.BAS
'I2C Manager - Receive commands from CPU and translate to I2C commands to slaves.
'
'version 1.1 - no more command address on I2C card.
'version 1.2 - several bugs fixed.
'version 1.3 - change communication protocol.
'version 1.4 - change communication protocol.
'version 1.5 - use INT0 for chip select.
'
'Protocol:
'
'WRITE
'  <wr><slave><size_addr>[<addr_hi>]<addr_lo><num_bytes><b1>...<bn> ==>
'
'READ
'  <rd><slave><num_bytes> ==>
'                         <==   <b1>...<bn>
'
'READ RANDOM
'  <rr><slave><size_addr>[<addr_hi>]<addr_lo><num_bytes> ==>
'                                                        <==   <b1>...<bn>
'
'<wr> = 1
'<rd> = 2
'<rr> = 3
'
'<slave> = slave's address
'<size_addr> = 1 or 2, number of bytes for address. If 2, <addrr_hi> must be submmited,
'              otherwiths, only <addr_lo>.
'<num_bytes> = number of bytes to be written or read (min 1 and max 16).
'

$crystal = 24000000

'Configure I2C pins
Config Scl = P3.5
Config Sda = P3.4

'Some nicknames
Unwait Alias P3.0
Wr Alias P3.1
Cs Alias P3.2
A00 Alias P3.7

'Some constants
Const Cmd_sync = 0
Const Cmd_write = 1
Const Cmd_read = 2
Const Cmd_read_rand = 3
Const Ack = 8
Const Nack = 9

'Variables dimensioning
Dim Command As Byte                                           'Current command being executed
Dim Astep As Byte                                             'Step be executed
Dim Buf(19) As Byte                                           'Read/write buffer
Dim Port As Byte                                              'Port=P1 or P1=Port, for read and write, respectively
Dim Addr_size As Byte                                         'Size of address (1 or 2)
Dim Num_bytes As Byte                                         'Number of bytes to be written or read
Dim I As Byte                                                 'Used for Buf index
Dim J As Byte                                                 'General use variable

'*** Main program starts here
Beginning:
I2cstop
Gosub Release_wait

While 1 = 1

Wend



'*** Subroutines here

'*** Release CPU wait signal
Release_wait:
   Reset Unwait
   Set Unwait
Return

'*** Get/put data from/on P1
Trans_data:
   While Cs = 1
   Wend
   If A00 = 1 And Wr = 0 Then
      Dat = P1
   Elseif A00 = 1 And Wr = 1 Then

   Elseif A00 = 0 And Wr = 0 Then
      Dat = P1
   Elseif A00 = 0 And Wr = 1 Then
   
   End If
   Gosub Release_wait
Return
