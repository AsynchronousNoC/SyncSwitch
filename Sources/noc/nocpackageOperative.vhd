-- Copyright (c) 2011-2024 Columbia University, System Level Design Group
-- SPDX-License-Identifier: Apache-2.0

library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;


package MinimalPack is
	subtype misc_noc_flit_type is std_logic_vector(31 downto 0);
	subtype local_yx is std_logic_vector(2 downto 0);
	type misc_noc_flit_vector is array (natural range <>) of misc_noc_flit_type;


end MinimalPack;
