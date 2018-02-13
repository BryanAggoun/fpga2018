----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
-- Create Date:   	Septembre 2016 
-- Module Name:    	Impulse_Count - Behavioral 
-- Project Name: 		TP1 - FPGA1
-- Target Devices: 	Nexys4 / Artix7

-- XDC File:			Impulse_Count.xdc					

-- Description: Compteur d'Impulsions - Version KO
--
--		Compteur d'Impulsions sur 4 bits
--			- Le Compteur s'Incrémente si on Appuie sur le Bouton Left
--			- Le Compteur se'Décrémente si on Appuie sur le Bouton Center
--			- Sup Passe à 1 si le Compteur Dépasse 9
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity IMPULSE_COUNT is
    Port ( Reset : in  STD_LOGIC;								-- Reset Asynchrone
           CLK : in STD_LOGIC;
           Button_L : in  STD_LOGIC;							-- Bouton Left
           Button_C : in  STD_LOGIC;							-- Bouton Center
           Count : out  STD_LOGIC_VECTOR (3 downto 0);	-- Compteur d'Impulsions
           Sup : out  STD_LOGIC);								-- Indicateur Valeur Seuil
end IMPULSE_COUNT;

architecture Behavioral of IMPULSE_COUNT is

signal cpt: std_logic_vector(3 downto 0);		-- Compteur d'Impulsions

    signal b1 : std_logic_vector(23 downto 0);
    signal b2 : std_logic_vector(23 downto 0);

begin

	count <= cpt;	-- Affichage en Sortie du Compteur

	-------------------------
	-- Gestion du Compteur --
	-------------------------
	process(reset,CLK)

	begin

		-- Reset Asynchrone
		if reset='1' then cpt<="0000";
		 b1 <= (others => '0');
		 b2 <= (others => '0');
		 
		elsif rising_edge(CLK) then
				-- Incrémentation Si on Appuie sur le Bouton Left
		   
		     if b1 >= 1 then
		      b1 <= b1 + 1;
		     end if;
		    
                if b2 >= 1 then
                       b2 <= b2 + 1;	     
		     end if;
		     
        if b1 = 0 and Button_L = '1' then            
           b1(0)<='1';
           cpt<=cpt+1;
        
           elsif b2 = 0 and Button_C = '1' then            
           b2(0)<='1';
                cpt<=cpt-1;
             end if;
        
   end if;


		
	end process;

	-------------------------
	-- Gestion du Flag Sup --
	-------------------------
	process(Cpt)

	begin
		
		-- Mise à 1 si CPT Dépasse 9. A 0 Sinon...
		if (cpt > 9) then 			
			Sup<='1'; 									
		else 							
			Sup<='0'; 
		end if;
	end process;

end Behavioral;

