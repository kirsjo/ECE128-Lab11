module cu ( 
    input clk, reset,
    input [2:0] adr1,
    input [2:0] adr2,
    output reg w_rf,
    output reg [2:0] adr,
    output reg DA,SA,SB,
    output reg [3:0] st_out,
    output reg  w_ram
);
  
    parameter S0_idle = 0 , S1_send_adr1 = 1 , S2_send_adr2 = 2 ,S3_multiply = 3 ,S4_write_ram = 4,S5_read_ram=5 ;
    reg [3:0] PS,NS ;
    
    
    always@(posedge clk or posedge reset)
        begin
            if(reset)
                PS <= S0_idle;   
            else    
                PS <= NS ;
        end  


    always@(*)
        begin 
            case(PS)
				S0_idle:begin
				    NS = S1_send_adr1;
                    w_rf =1'b0;
                    w_ram <= 3'b0;
            		st_out <= 4'b0; 
				end
				
				S1_send_adr1:begin	
				    w_rf <= 1'b1;
				    adr<= adr1;
				    DA <=1'b0;
				    SA <=1'b1;
				    SB <=1'b0;
				    st_out <= 4'b0001;
				    NS = S2_send_adr2;
				end
				
			    S2_send_adr2:begin
				    w_rf <= 1'b1;
				    adr<= adr2;
				    NS = S3_multiply;
				    DA <=1'b1;
				    SA <=1'b0;
				    SB <=1'b1;
          			st_out <= 4'b0010;
			   end
			
		       S3_multiply: begin
				    NS = S4_write_ram;	
                    st_out <= 4'b0011;
				    w_ram<= 1'b1;
			   end

               S4_write_ram: begin
                    st_out <= 4'b0100;
				    NS = S5_read_ram;	
			   end
				
		      S5_read_ram: begin
                    w_ram<= 1'b0;
                    st_out <= 4'b0101;
				    if(!reset) begin
				        NS = S1_send_adr1; 	
				    end
				    else begin
				        NS = S0_idle;
				    end
				end
			endcase
		end
	
endmodule
