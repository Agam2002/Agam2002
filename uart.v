/*
The UART that is going to transmit data receives the data from a data bus.
The data bus is used to send data to the UART by another device like a CPU,
memory, or microcontroller. Data is transferred from the data bus to the 
transmitting UART in parallel form. After the transmitting UART gets the 
parallel data from the data bus, it adds a start bit, a parity bit, and a 
stop bit, creating the data packet. Next, the data packet is output serially,
bit by bit at the Tx pin. The receiving UART reads the data packet bit by bit 
at its Rx pin. The receiving UART then converts the data back into parallel 
form and removes the start bit, parity bit, and stop bits. Finally, the receiving 
UART transfers the data packet in parallel to the data bus on the receiving end:

*/
module uart(in,out,trans);

input [7:0] in;
input trans;
output reg [7:0] out;
//Data is loaded in parallel
reg [11:0] Tx;  //Tx terminal of UART
reg [11:0] Rx;  // Rx of of receiving terminal
reg start_bit,parity_bit; // parametric bits for packet making
reg [1:0] stop_bit;
// creating data packet;

/*
start_bit is active low signal for transmission
stop bits are indicator for termination of serial data
*/
initial
begin start_bit=1; 
stop_bit=2'b11;
end

integer i;

// This is where the formation of packet takes place which will be loaded to Tx, Data will be in parallel form
always @(posedge trans)
begin
  if(trans)
   begin
     start_bit=0;
     parity_bit= ^(in)?1:0;  // Parity bit=1 if odd 0 for even no. os 1's
     Tx={start_bit,in,parity_bit,stop_bit};
   end
end

// Here the data will be transmitted to Rx of another UART in serial form
always @(negedge trans)
 begin
    for(i=0;i<12;i=i+1)
       #5 Rx[i]=Tx[i];

start_bit=1;
out=Rx[10:3];
end




endmodule



// Testbench of the given UART code


module uart_test;

reg [7:0] in;
reg trans;
wire [7:0] out;

uart uut(in,out,trans);

initial
begin

in=8'b10110010;  // data to be transferred B2
trans=0;

$dumpfile("uart_test.vcd");
$dumpvars(0,uart_test);


end

initial
begin
#30 trans=1;
#50 trans=0;
#80 trans=1;
#50 trans=0;
end
initial #119 in=8'b00100110;
initial #350 $finish;

endmodule