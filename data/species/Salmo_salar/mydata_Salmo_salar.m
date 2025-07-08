function [data, auxData, metaData, txtData, weights] = mydata_Salmo_salar 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_salar'; 
metaData.species_en = 'Atlantic salmon'; 

metaData.ecoCode.climate = {'MC','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'MAN','TH'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab';'aj';'ap';'am';'Lb';'Lj';'Li';'Wwb';'Wwj';'Ri'}; 
metaData.data_1     = {'L-Ww';'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author   = {'Charlotte Recapet'};    
metaData.date_subm = [2019 03 13];              
metaData.email    = {'charlotte.recapet@univ-pau.fr'};            
metaData.address  = {'ECOBIOP, National Institute for Agronomic Research - University Pau Pays de l''ADour, France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 04 17]; 

%% set data
% zero-variate data

data.ab = 196;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Berg2001';     
  temp.ab = C2K(4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'parents from river Stjordalselva (Norway)';
data.tj = 2.265*365.25;    units.tj = 'd';    label.tj = 'time since birth at metamorphosis'; bibkey.tj = 'Hutchings1998'; 
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'median of Scottish populations; temperature: rough guess - highly variable temperature throughout life';
data.tp = (2.265+1.39)*365.25;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Hutchings1998'; 
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'median of Scottish populations; rough guess - highly variable temperature throughout life';
data.am = 13*365.25;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Flower1935';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'maximum lifespan - females caught in loch Maree on 10th May, 1924; temperature: rough guess - highly variable temperature throughout life';

data.Lb  = 2.825;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'VanLeeuwen2016';  
  comment.Lb = 'parents from River Blackwater (Scotland) - 1SW mother';
% data.Lb  = 2.925;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'VanLeeuwen2016';  comment.Wwb = 'parents from River Blackwater (Scotland) - 2SW mother';
% data.Lb  = 2.77;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Solberg2014';  comment.Wwb = 'parents from Norwegian rivers';
% data.Lb  = 2.86;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Solberg2014';  comment.Wwb = 'parents from domestic strains (Norway)';
% data.Lb  = 2.81;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Dennis Stream, Fig. 6 (New Brunswick - Canada)';
%  temp.Lb = C2K(2);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 3.00;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Dennis Stream, Fig. 6 (New Brunswick - Canada)';
%  temp.Lb = C2K(6);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.70;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Dennis Stream, Fig. 6 (New Brunswick - Canada)';
%  temp.Lb = C2K(12);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.89;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Miramichi River (New Brunswick - Canada)';
%  temp.Lb = C2K(4);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.90;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Miramichi River (New Brunswick - Canada)';
%  temp.Lb = C2K(6);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.86;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Miramichi River (New Brunswick - Canada)';
%  temp.Lb = C2K(8);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.80;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Miramichi River (New Brunswick - Canada)';
%  temp.Lb = C2K(10);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.76;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Peterson1977';  comment.Wwb = 'parents from Miramichi River (New Brunswick - Canada)';
%  temp.Lb = C2K(12);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
% data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Srivastava1991';  comment.Wwb = 'parents from Northeast Placentia River (Newfoundland, Canada)';
%  temp.Lb = C2K(7);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';

%% Length at precocious maturation (males only)

% data.Lpp  = ;   units.Lpp  = 'cm';  label.Lpp  = 'total length at precocious puberty'; bibkey.Lpp  = ''; comment.Lpp = 'males only';

%% Length at smoltification

data.Lj  = 12;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Hutchings1998'; 
  comment.Lj = 'median of Scottish populations';
% data.Lj  = 18.7;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Hutchings1998'; comment.Lj = 'Nivelle';
% data.Lj  = 12.5;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Hutchings1998'; comment.Lj = 'median of Icelandic populations';
% data.Lj  = 15.5;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Jutila2006'; comment.Lj = 'Simojoki (Baltic Sea, Finland) - mean from 1972 to 1991';
% data.Lj  = 14.7;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Jutila2006'; comment.Lj = 'Simojoki (Baltic Sea, Finland) - mean from 1992 to 2004';

%% Length at maturity (or 1 year before first spawning)

% data.Lp  = ;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = ''; 

%% Length at spawning

data.Li  = 95;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Fleming1996'; 
  comment.Li = 'maximum of Scottish populations maxima - females';
% data.Li  = 88.1;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hutchings1998'; comment.Li = 'maximum of Scottish populations means';
% data.Li  = 67.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hutchings1998'; comment.Li = 'Nivelle';
% data.Li_M  = 109;   units.Li_M  = 'cm';  label.Li_M  = 'ultimate total length';   bibkey.Li_M  = 'Solberg2014'; comment.Li_M = 'maximum of Norwegian populations maxima - males';
% data.Li_F  = 96;   units.Li_F  = 'cm';  label.Li_F  = 'ultimate total length';   bibkey.Li_F  = 'Solberg2014'; comment.Li_F = 'maximum of Norwegian populations maxima - females';

%% Egg volume
% data.V0 = 0.090;  units.V0 = 'cm^3'; label.V0 = 'egg volume'; bibkey.V0 = 'Berg2001';  comment.V0 = 'parents from river Stjordalselva (Norway)';

%% Egg weight

% data.Ww0 = 0.10;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'VanLeeuwen2016';  comment.Ww0 = 'parents from River Blackwater (Scotland) - 1SW mother';
% data.Ww0 = 0.12;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'VanLeeuwen2016';  comment.Ww0 = 'parents from River Blackwater (Scotland) - 2SW mother';
% data.Ww0 = 0.094;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Fleming1996';  comment.Ww0 = 'mean of River Almon (Scotland)';
% data.Ww0 = 0.16145;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Kazakov1981';  comment.Ww0 = 'mean of River Neva (Russia)';
% data.Ww0 = 0.113;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Srivastava1991';  comment.Ww0 = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Ww0 = 0.131;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Srivastava1991';  comment.Ww0 = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Ww0 = 0.104;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Berg2001';  comment.Ww0 = 'before fertilization - parents from river Stjordalselva (Norway)';

% data.Wd0 = 0.042;  units.Wd0 = 'g'; label.Ww0 = 'dry egg weight'; bibkey.Wd0 = 'Srivastava1991';  comment.Wd0 = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Wd0 = 0.039;  units.Wd0 = 'g'; label.Ww0 = 'dry egg weight'; bibkey.Wd0 = 'Srivastava1991';  comment.Wd0 = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Wd0 = 0.035;  units.Wd0 = 'g'; label.Ww0 = 'dry egg weight'; bibkey.Wd0 = 'Berg2001';  comment.Wd0 = 'before fertilization - parents from river Stjordalselva (Norway)';

%% Weight at hatching

% data.Wwh = 0.0552*100/(100-62.9);   units.Wwh = 'g';   label.Wwh = 'wet weight at hatching';     bibkey.Wwh = 'Carrick1979';  comment.Wwh = 'at 4 C - parents from River Kent (Cumbria, northern England)';
% data.Wwh = 0.117;   units.Wwh = 'g';   label.Wwh = 'wet weight at hatching';     bibkey.Wwh = 'Srivastava1991';  comment.Wwh = 'parents from Northeast Placentia River (Newfoundland, Canada)';

% data.Wdh = 0.0552;   units.Wdh = 'g';   label.Wdh = 'dry weight at hatching';     bibkey.Wdh = 'Carrick1979';  comment.Wdh = 'at 4 C - parents from River Kent (Cumbria, northern England)';
% data.Wdh = 0.034;   units.Wdh = 'g';   label.Wdh = 'dry weight at hatching';     bibkey.Wdh = 'Srivastava1991';  comment.Wdh = 'parents from Northeast Placentia River (Newfoundland, Canada)';

%% Weight at first feeding

data.Wwb = 0.16;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VanLeeuwen2016';  
  comment.Wwb = 'parents from River Blackwater (Scotland) - 1SW mother';
% data.Wwb = 0.195;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VanLeeuwen2016';  comment.Wwb = 'parents from River Blackwater (Scotland) - 2SW mother';
% data.Wwb = 0.123;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Srivastava1991';  comment.Wwb = 'parents from Northeast Placentia River (Newfoundland, Canada)';

% data.Wdb = 0.027;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Srivastava1991';  comment.Wdb = 'parents from Northeast Placentia River (Newfoundland, Canada)';

%% Weight at smoltification

data.Wwj = 25;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';   bibkey.Wwj = 'Jutila2006';  
  comment.Wwj = 'Simojoki (Baltic Sea, Finland) - mean from 1972 to 1981 and 1992 to 2004';

%% Weight at spawning

% data.Wwi_M = 12700;   units.Wwi_M = 'g';   label.Wwi_M = 'ultimate wet weight';     bibkey.Wwi_M = 'Solberg2014'; ; comment.Wwi_M = 'maximum of Norwegian populations maxima - males';
% data.Wwi_F = 13130;   units.Wwi_F = 'g';   label.Wwi_F = 'ultimate wet weight';     bibkey.Wwi_F = 'Solberg2014'; ; comment.Wwi_F = 'maximum of Norwegian populations maxima - females';

%% Reserve energy in egg (egg = reserve only)

% data.E0 = 1113; units.E0 = 'J'; label.E0 = 'egg reserve energy'; bibkey.E0 = 'Srivastava1991';   comment.E0 = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.E0 = 1028; units.E0 = 'J'; label.E0 = 'egg reserve energy'; bibkey.E0 = 'Srivastava1991';   comment.E0 = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.E0 = 757; units.E0 = 'J'; label.E0 = 'egg reserve energy'; bibkey.E0 = 'Berg2001';   comment.E0 = 'before fertilization - parents from river Stjordalselva (Norway)';

%% Total energy

% data.E = 845; units.E = 'J'; label.E = 'total energy content'; bibkey.E = 'Srivastava1991';   comment.Wdb = 'hatching - parents from Northeast Placentia River (Newfoundland, Canada)';
%  length.E = 1.8; units.length.E = 'cm'; label.length.E = 'total length';
% data.E = 639; units.E = 'J'; label.E = 'total energy content'; bibkey.E = 'Srivastava1991';   comment.Wdb = 'first feeding - parents from Northeast Placentia River (Newfoundland, Canada)';
%  length.E = 2.5; units.length.E = 'cm'; label.length.E = 'total length';

%% Maximum reproductive rate

data.Ri  = 14499/365.25;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Thorpe1984';   
  temp.Ri = C2K(10);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'maximum at River Almond (Scotland); temperature: highly variable temperature throughout life';

%% uni-variate data

%% T-ah data

%data.Tah = [ ... % temperature (C), age at hatching (d)
%2  155
%4  126
%6  84
%8  64
%10 50
%12 38];
%data.Tah(:,1)=C2K(data.Tah(:,1));
%units.Tah   = {'K', 'd'};  label.Tah = {'temperature', 'age at hatching'}; 
%bibkey.Tah = 'Peterson1977'; comment.Tah = 'parents from Dennis Stream (New Brunswick - Canada)';

%data.Tah = [ ... % temperature (C), age at hatching (d)
%8  504/8
%10 492/10
%12 453/12];
%data.Tah(:,1)=C2K(data.Tah(:,1));
%units.Tah   = {'K', 'd'};  label.Tah = {'temperature', 'age at hatching'}; 
%bibkey.Tah = 'Gunnes1979'; comment.Tah = 'Norwegian strain (wild or domestic?)';

%data.Tah = [ ... % temperature (C), age at hatching (d)
%4.8  116.5
%6  92.5
%6.3  88];
%data.Tah(:,1)=C2K(data.Tah(:,1));
%units.Tah   = {'K', 'd'};  label.Tah = {'temperature', 'age at hatching'}; 
%bibkey.Tah = 'Solberg2014'; comment.Tah = 'parents from Norwegian wild and domestic stock - no differences between wild and domestic)';

%% T-ab data

%data.Tab = [ ... % temperature (C), age at yolk exhaustion (d)
%2 238
%6 177
%12  64];
%data.Tab(:,1)=C2K(data.Tab(:,1));
%units.Tab   = {'K', 'd'};  label.Tab = {'temperature', 'age at birth'}; 
%bibkey.Tah = 'Peterson1977'; comment.Tah = 'parents from Dennis Stream (New Brunswick - Canada)';

%% t-L data

%data.tL = [ ... % time since first feeding (d), fork length (cm)
%434  19.7
%448  20.9
%463  22.6
%477  21.1
%491  24.1
%506  24.1
%526  23.7
%540  23.8
%568  27.6];
%units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
%temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
%bibkey.tL = 'Rottiers1993'; comment.tL = 'Penobscot River strain (USA); temperature between 8 and 12 C';

data.tL = [ ... % time since emergence (d), fork length (cm)
0  2.8
0  2.9
0  2.9
0  3.0
6  3.0
11 3.3
12 3.2
14 3.2
14 3.2
15 3.4
15  3.2
16  3.4
16  3.5
17  3.4
19  3.4
19  3.7
22  3.4
22  3.6
33  3.7
38  4.2
39  3.9
41  4.2
41  4.2
42  4.4
42  4.1
43  4.3
43  4.4
44  4.1
46  4.4
46  4.4
49  4.3
49  4.6];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Einum2000'; comment.tL = 'Imsa River (Norway); temperature increasing from 10.4 C to 14.1 C throughout the experiment';

%% t-W data in embryos

%data.tWwe_T12 = [ ... % time since fertilization (d), wet weight (g) at 12 C
%38 0.1045
%42 0.1284
%46 0.1585
%50 0.1124
%54 0.1242
%59 0.1259
%63 0.1276];
%units.tWwe_T12   = {'d', 'g'};  label.tWwe_T12 = {'time since fertilization', 'wet weight'};  
%temp.tWwe_T12    = C2K(12);  units.temp.tWwe_T12 = 'K'; label.temp.tWwe_T12 = 'temperature';
%bibkey.tWwe_T12 = 'Gunnes1979'; comment.tWwe_T12 = 'Norwegian strain (wild or domestic?)';

%data.tWwe_T10 = [ ... % time since fertilization (d), wet weight (g) at 10 C
%38 0.1036
%42 0.1201
%46 0.1236
%50 0.1666
%54 0.1381
%59 0.1331
%63 0.1592];
%units.tWwe_T10   = {'d', 'g'};  label.tWwe_T10 = {'time since fertilization', 'wet weight'};  
%temp.tWwe_T10    = C2K(10);  units.temp.tWwe_T10 = 'K'; label.temp.tWwe_T10 = 'temperature';
%bibkey.tWwe_T10 = 'Gunnes1979'; comment.tWwe_T10 = 'Norwegian strain (wild or domestic?)';

%data.tWwe_T8 = [ ... % time since fertilization (d), wet weight (g) at 8 C
%38 0.0988
%42 0.1136
%46 0.1172
%50 0.1198
%54 0.1307
%59 0.1162
%63 0.1255];
%units.tWwe_T8   = {'d', 'g'};  label.tWwe_T8 = {'time since fertilization', 'wet weight'};  
%temp.tWwe_T8    = C2K(8);  units.temp.tWwe_T8 = 'K'; label.temp.tWwe_T8 = 'temperature';
%bibkey.tWwe_T8 = 'Gunnes1979'; comment.tWwe_T8 = 'Norwegian strain (wild or domestic?)';

%data.tWwVe_T12 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 12 C
%38 0.0128
%42 0.0301
%46 0.0405
%50 0.0465
%54 0.0533
%59 0.0624
%63 0.0674];
%units.tWwVe_T12   = {'d', 'g'};  label.tWwVe_T12 = {'time since fertilization', 'wet weight excluding yolk'};  
%temp.tWwVe_T12    = C2K(12);  units.temp.tWwVe_T12 = 'K'; label.temp.tWwVe_T12 = 'temperature';
%bibkey.tWwVe_T12 = 'Gunnes1979'; comment.tWwVe_T12 = 'Norwegian strain (wild or domestic?)';

%data.tWwVe_T10 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 10 C
%38 0.0138
%42 0.0311
%46 0.0366
%50 0.0465
%54 0.0594
%59 0.0698
%63 0.0687];
%units.tWwVe_T10   = {'d', 'g'};  label.tWwVe_T10 = {'time since fertilization', 'wet weight excluding yolk'};  
%temp.tWwVe_T10    = C2K(10);  units.temp.tWwVe_T10 = 'K'; label.temp.tWwVe_T10 = 'temperature';
%bibkey.tWwVe_T10 = 'Gunnes1979'; comment.tWwVe_T10 = 'Norwegian strain (wild or domestic?)';

%data.tWwVe_T8 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 8 C
%38 0.0128
%42 0.0270
%46 0.0331
%50 0.0432
%54 0.0457
%59 0.0634
%63 0.0623];
%units.tWwVe_T8   = {'d', 'g'};  label.tWwVe_T8 = {'time since fertilization', 'wet weight excluding yolk'};  
%temp.tWwVe_T8    = C2K(8);  units.temp.tWwVe_T8 = 'K'; label.temp.tWwVe_T8 = 'temperature';
%bibkey.tWwVe_T8 = 'Gunnes1979'; comment.tWwVe_T8 = 'Norwegian strain (wild or domestic?)';

%data.tWwYe_T12 = [ ... % time since fertilization (d), yolk wet weight (g) at 12 C
%38 0.0809
%42 0.0735
%46 0.0784
%50 0.0519
%54 0.0484
%59 0.0479
%63 0.0495]';
%units.tWwYe_T12   = {'d', 'g'};  label.tWwYe_T12 = {'time since fertilization', 'yolk wet weight'};  
%temp.tWwYe_T12    = C2K(12);  units.temp.tWwYe_T12 = 'K'; label.temp.tWwYe_T12 = 'temperature';
%bibkey.tWwYe_T12 = 'Gunnes1979'; comment.tWwYe_T12 = 'Norwegian strain (wild or domestic?)';

%data.tWwYe_T10 = [ ... % time since fertilization (d), yolk wet weight (g) at 10 C
%38 0.0786
%42 0.0767
%46 0.0660
%50 0.0721
%54 0.0558
%59 0.0458
%63 0.0521]';
%units.tWwYe_T10   = {'d', 'g'};  label.tWwYe_T10 = {'time since fertilization', 'yolk wet weight'};  
%temp.tWwYe_T10    = C2K(10);  units.temp.tWwYe_T10 = 'K'; label.temp.tWwYe_T10 = 'temperature';
%bibkey.tWwYe_T10 = 'Gunnes1979'; comment.tWwYe_T10 = 'Norwegian strain (wild or domestic?)';

%data.tWwYe_T8 = [ ... % time since fertilization (d), yolk wet weight (g) at 8 C
%38 0.0786
%42 0.0765
%46 0.0723
%50 0.0647
%54 0.0619
%59 0.0449
%63 0.0451]';
%units.tWwYe_T8   = {'d', 'g'};  label.tWwYe_T8 = {'time since fertilization', 'yolk wet weight'};  
%temp.tWwYe_T8    = C2K(8);  units.temp.tWwYe_T8 = 'K'; label.temp.tWwYe_T8 = 'temperature';
%bibkey.tWwYe_T8 = 'Gunnes1979'; comment.tWwYe_T8 = 'Norwegian strain (wild or domestic?)';

%% t-W data in juveniles

%data.tWw = [ ... % time since first feeding (d), wet weight (g)
%434 67.7
%448 81.6
%463 100.7
%477 83.5
%491 120.6
%506 121.5
%526 114.1
%540 110.6
%568 188.3];
%units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
%temp.tWw    = C2K(10);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; comment.temp.tWw = 'temperature between 8 and 12 C';
%bibkey.tWw = 'Rottiers1993'; comment.tWw = 'Penobscot River strain (USA)';

%data.tWd = [ ... % time since first feeding (d), dry weight (g)
%434 67.7*(1-0.7)
%448 81.6*(1-0.695)
%463 100.7*(1-0.718)
%477 83.5*(1-0.706)
%491 120.6*(1-0.731)
%506 121.5*(1-0.729)
%526 114.1*(1-0.721)
%540 110.6*(1-0.716)
%568 188.3*(1-0.707)];
%units.tWd   = {'d', 'g'};  label.tWd = {'time since birth', 'dry weight'};  
%temp.tWd    = C2K(10);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature'; comment.temp.tWd = 'temperature between 8 and 12 C';
%bibkey.tWd = 'Rottiers1993'; comment.tWd = 'Penobscot River strain (USA)';

%data.tWw = [ ... % time since yolk absorption (d), wet weight (g)
%434  67.7
%448  81.6
%463  100.7]';
%units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
%temp.tWw    = C2K(12);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; comment.temp.tWw = 'temperature increasing from 10.4 C to 14.1 C throughout the experiment';
%bibkey.tWw = 'Einum2000'; comment.tWw = 'Imsa River (Norway)';

%% t-W data in seawater

%data.tWw_T4 = [ ...  % time since transfer in seawater (d), wet weight (g) at 4 C
%22 61.8
%63 74.5
%90 78.1];
%units.tWw_T4   = {'d', 'g'};  label.tWw_T4 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T4    = C2K(4);  units.temp.tWw_T4 = 'K'; label.temp.tWw_T4 = 'temperature';
%bibkey.tWw_T4 = 'Handeland1998'; comment.tWw_T4 = 'domestic strain';

%data.tWw_T8 = [ ...  % time since transfer in seawater (d), wet weight (g) at 8 C
%22 63.6
%63 105.9
%90 132.6];
%units.tWw_T8   = {'d', 'g'};  label.tWw_T8 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T8   = C2K(8);  units.temp.tWw_T8 = 'K'; label.temp.tWw_T8 = 'temperature';
%bibkey.tWw_T8 = 'Handeland1998'; comment.tWw_T8 = 'domestic strain';

%data.tWw_T6 = [ ... % time since tranfer to seawater (d), wet weight (g) at 6 C
%0  75.8
%14 77.4
%28 88.7
%42 104.8
%56 125.7
%70 141.9
%84 153.1];
%units.tWw_T6   = {'d', 'g'};  label.tWw_T6 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T6   = C2K(6);  units.temp.tWw_T6 = 'K'; label.temp.tWw_T6 = 'temperature';
%bibkey.tWw_T6 = 'Handeland2008'; comment.tWw_T6 = 'AquaGen domestic strain';

%data.tWw_T10 = [ ... % time since tranfer to seawater (d), wet weight (g) at 10 C
%0  75.8
%14 83.8
%28 108.0
%42 143.5
%56 188.6
%70 235.4
%84 262.8];
%units.tWw_T10   = {'d', 'g'};  label.tWw_T10 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T10   = C2K(10);  units.temp.tWw_T10 = 'K'; label.temp.tWw_T10 = 'temperature';
%bibkey.tWw_T10 = 'Handeland2008'; comment.tWw_T10 = 'AquaGen domestic strain';
  
%data.tWw_T14 = [ ... % time since tranfer to seawater (d), wet weight (g) at 14 C
%0  75.8
%14 83.8
%28 116.1
%42 156.4
%56 214.4
%70 264.4
%84 295.0];
%units.tWw_T14   = {'d', 'g'};  label.tWw_T14 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T14   = C2K(14);  units.temp.tWw_T14 = 'K'; label.temp.tWw_T14 = 'temperature';
%bibkey.tWw_T14 = 'Handeland2008'; comment.tWw_T14 = 'AquaGen domestic strain';

%data.tWw_T18 = [ ... % time since tranfer to seawater (d), wet weight (g) at 18 C
%0	75.8
%14	88.7
%28	116.1
%42	151.5
%56	195.1
%70	227.3
%84	251.5];
%units.tWw_T18   = {'d', 'g'};  label.tWw_T18 = {'time since metamorphosis', 'wet weight'};  
%temp.tWw_T18   = C2K(18);  units.temp.tWw_T18 = 'K'; label.temp.tWw_T18 = 'temperature';
%bibkey.tWw_T18 = 'Handeland2008'; comment.tWw_T18 = 'AquaGen domestic strain';

%data.tWw = [ ... % time (d), wet weight (g)
%0*7  81.9
%2*7  77.5
%4*7  75
%6*7  72.9];
%units.tWw   = {'d', 'g'};  label.tWw = {'starvation time', 'wet weight'};  
%temp.tWw    = C2K(10);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
%bibkey.tWw = 'ElMowafi1997'; comment.tWw = 'probably a domestic strain';
  
%data.tWd = [ ... % time (d), dry weight (g)
%0*7  81.9*0.303
%2*7  77.5*0.266
%4*7  75*0.254
%6*7  72.9*0.247];
%units.tWd   = {'d', 'g'};  label.tWd = {'starvation time', 'dry weight'};  
%temp.tWd    = C2K(10);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
%bibkey.tWd = 'ElMowafi1997'; comment.tWd = 'probably a domestic strain';

%% L-W data

data.LWw = [ ... % fork length (cm), wet weight (g) (parrs)
5.5	2.1
5.6	2.1
5.7	2.0
5.9	2.4
5.9	2.1
6.0	2.9
6.0	2.6
6.0	2.4
6.2	3.0
6.2	2.9
6.2	2.7
6.2	2.6
6.3	3.0
6.3	2.7
6.4	2.9
6.4	2.7
6.4	3.4
6.5	3.4
6.5	3.3
6.5	3.1
6.5	2.7
6.5	3.6
6.5	3.0
6.6	3.3
6.6	3.5
6.6	2.9
6.6	2.8
6.6	3.6
6.7	3.4
6.7	3.3
6.7	3.8
6.8	3.4
6.8	4.1
6.8	3.6
6.8	3.4
6.8	3.3
6.9	3.5
7.0	4.6
7.0	4.3
7.0	3.8
7.0	3.7
7.0	4.4
7.0	4.0
7.0	4.1
7.1	4.5
7.1	4.4
7.1	4.1
7.1	3.9
7.2	5.0
7.2	4.1
7.2	4.9
7.2	3.6
7.2	3.8
7.2	3.5
7.2	4.5
7.3	5.0
7.3	4.4
7.3	4.1
7.3	4.7
7.3	4.2
7.3	4.5
7.4	4.8
7.4	4.9
7.4	5.2
7.4	4.4
7.5	4.5
7.5	4.8
7.5	5.4
7.5	4.9
7.5	3.8
7.5	4.6
7.5	4.5
7.6	5.5
7.6	4.6
7.6	4.8
7.6	5.4
7.7	4.7
7.7	4.2
7.7	4.5
7.7	4.4
7.8	5.3
7.8	5.1
7.9	5.2
7.9	6.0
7.9	5.7
7.9	5.4
7.9	5.1
7.9	6.6
7.9	4.8
8.0	6.9
8.0	5.4
8.0	5.6
8.0	5.0
8.0	4.7
8.1	5.8
8.1	5.0
8.1	4.8
8.1	6.0
8.1	5.4
8.2	6.7
8.2	6.2
8.2	5.0
8.2	5.8
8.3	7.1
8.4	5.0
8.4	7.4
8.4	7.2
8.4	7.0
8.4	5.8
8.4	7.6
8.5	7.4
8.5	7.2
8.5	8.2
8.5	5.5
8.5	6.7
8.6	6.9
8.6	6.8
8.6	6.6
8.6	6.4
8.6	7.9
8.6	5.6
8.7	8.0
8.7	7.1
8.8	6.5
8.8	7.9
8.8	6.8
8.8	8.2
8.9	8.6
8.9	9.3
8.9	7.8
9.0	8.3
9.0	8.0
9.0	8.6
9.0	7.3
9.0	8.9
9.1	8.2
9.1	8.5
9.2	7.6
9.2	7.5
9.2	9.0
9.2	9.9
9.3	9.1
9.3	8.1
9.3	8.4
9.4	7.7
9.4	9.3
9.4	10.2
9.5	10.9
9.5	10.6
9.5	9.9
9.5	8.1
9.5	7.9
9.6	8.5
9.6	10.7
9.6	8.7
9.6	11.1
9.6	9.7
9.7	8.1
9.7	9.3
9.7	10.3
9.7	7.6
9.8	8.5
9.8	10.9
9.8	9.9
9.8	10.3
9.9	9.6
9.9	10.2
10.0	11.8
10.1	10.5
10.1	11.3
10.1	12.2
10.1	8.9
10.1	8.7
10.2	11.8
10.2	11.3
10.2	12.1
10.2	10.1
10.3	12.3
10.3	11.9
10.3	11.6
10.3	11.1
10.3	12.7
10.4	10.0
10.4	12.5
10.4	12.1
10.4	11.7
10.5	9.7
10.5	11.1
10.5	14.2
10.5	12.1
10.6	10.6
10.6	13.0
10.6	11.7
10.6	11.3
10.7	13.2
10.7	12.2
10.8	11.4
10.8	12.9
10.8	13.4
10.9	13.3
10.9	12.7
11.0	13.2
11.0	15.2
11.1	16.7
11.1	12.8
11.2	14.4
11.2	17.7
11.2	17.1
11.3	12.1
11.3	16.6
11.3	16.0
11.4	16.8
11.5	18.5
11.7	15.2
11.8	15.8
11.9	14.5
12.0	16.6
12.0	18.2
12.1	18.9
12.1	17.5
12.2	15.4
12.4	16.5
12.5	23.7
12.6	21.1
12.9	18.9
13.5	25.3
14.4	27.2];   
units.LWw = {'cm', 'g'};     label.LWw = {'total length', 'wet weight'}; 
bibkey.LWw = 'Sutton2000'; comment.LWw = 'Northeast Brook, Newfoundland, Canada - cross-sectional';

%data.LWw = [ ... % fork length (cm), wet weight (g)
%19.7 67.7
%20.9 81.6
%22.6 100.7
%21.1 83.5
%24.1 120.6
%24.1 121.5
%23.7 114.1
%23.8 110.6
%27.6 188.3];
%units.LWw   = {'cm', 'g'};  label.LWw = {'total length', 'wet weight'};  
%bibkey.LWw = 'Rottiers1993'; comment.LWw = 'Penobscot River strain (USA) - temperature between 8 and 12 C';

%data.LWw_Norway = [ ... % fork length (cm), wet weight (g)
%60 1500
%68 3500
%80 6000
%84 6000
%85 6000
%92 8000];
%units.LWw_Norway   = {'cm', 'g'};  label.LWw_Norway = {'total length', 'wet weight'};  
%bibkey.LWw_Norway = 'Berg2001'; comment.LWw_Norway = 'females from river Stjordalselva (Norway)';

%data.LWw_Norway = [ ... % fork length (cm), wet weight (g)
%2.9  0.17
%3.6  0.36
%3.9  0.48];
%units.LWw_Norway   = {'cm', 'g'};  label.LWw_Norway = {'total length', 'wet weight'};  
%bibkey.LWw_Norway = 'Einum2000'; comment.LWw_Norway = 'Imsa River (Norway)';

%data.LWd = [... % fork length (cm),  dry weight (g) (parrs)
%5.5	0.43
%5.6	0.41
%5.7	0.43
%5.9	0.37
%6	0.54
%6	0.45
%6.2	0.52
%6.2	0.57
%6.2	0.49
%6.3	0.53
%6.3	0.61
%6.4	0.56
%6.4	0.5
%6.4	0.69
%6.5	0.62
%6.5	0.49
%6.5	0.71
%6.6	0.64
%6.6	0.58
%6.6	0.77
%6.8	0.69
%6.7	0.68
%6.7	0.64
%6.8	0.83
%7	0.75
%6.9	0.69
%6.8	0.65
%7	0.94
%7	0.85
%7	0.82
%7.1	0.76
%7	0.72
%7.2	0.97
%7.2	1.02
%7.3	0.83
%7.2	0.65
%7.3	0.93
%7.4	1.05
%7.3	0.86
%7.4	0.78
%7.5	0.97
%7.5	1.21
%7.6	1.08
%7.5	0.69
%7.5	0.92
%7.6	1.02
%7.6	0.83
%7.6	1.21
%7.8	1.05
%7.7	0.75
%7.7	0.87
%7.8	0.94
%7.7	0.81
%7.9	1.03
%7.9	1.21
%7.9	1.14
%7.9	1.41
%8.1	0.95
%8	1.56
%8.1	1.29
%8	1.02
%8.1	0.89
%8.1	1.15
%8.3	0.96
%8.2	1.38
%8.4	1.16
%8.2	1.12
%8.3	1.5
%8.5	1
%8.4	1.62
%8.4	1.37
%8.5	1.22
%8.4	1.21
%8.5	1.77
%8.5	1.49
%8.6	1.02
%8.6	1.61
%8.6	1.37
%8.8	1.23
%8.6	1.17
%8.7	1.48
%8.8	1.73
%8.9	2
%8.9	1.86
%8.8	1.26
%8.9	1.55
%9	1.43
%9	1.67
%9	1.98
%9.2	2.18
%9.3	1.61
%9.2	1.46
%9.4	1.78
%9.4	2.03
%9.5	1.5
%9.5	1.54
%9.4	1.85
%9.5	2.39
%9.6	2.15
%9.6	1.68
%9.6	1.62
%9.6	1.51
%9.7	1.36
%9.8	1.84
%9.7	2.33
%9.8	2.15
%9.7	1.73
%9.9	1.86
%10.1	2.15
%10.1	2.41
%10.1	1.65
%10.2	2.59
%10.2	1.88
%10.4	2.21
%10.3	2.41
%10.4	2.68
%10.5	1.77
%10.5	3.08
%10.5	2.04
%10.7	2.27
%10.7	2.55
%10.8	2.31
%10.9	2.81
%10.9	2.48
%11	3.14
%11.1	2.66
%11.1	2.94
%11.1	2.44
%11.2	2.32
%11.2	1.95
%11.2	3.96
%11.2	3.74
%11.3	3.25
%11.4	3.43
%11.3	2.5
%11.5	3.78
%11.8	3.01
%11.7	2.6
%11.8	2.86
%12.1	3.31
%11.9	2.94
%12	3.68
%12.1	3.49
%12.2	2.78
%12.4	2.94
%12.5	3.26
%12.6	4.41
%12.9	3.42
%13.5	5.33
%14.4	5.72
%6	0.52
%5.9	0.49
%11.1	3.18
%10.8	2.91
%11.8	2.67
%11	2.6
%10.4	2.56
%10.3	2.5
%10.5	2.49
%10.4	2.47
%10.2	2.25
%10.1	2.26
%10	2.21
%10.5	2.25
%10.6	2.33
%10.4	2.31
%9.6	2.33
%9.6	2.21
%9.5	2.09
%9.5	2.04
%9.8	1.97
%9.7	1.93
%9.8	1.89
%9.6	1.87
%10.4	1.86
%10.3	1.83
%10.4	1.81
%10.3	2.61
%10.4	2.26
%9.3	1.82
%9.2	1.79
%9.1	1.76
%9	1.73
%8.9	1.76
%8.9	1.71
%8.7	1.64
%8.4	1.69
%9.4	1.52
%9.3	1.52
%9.3	1.47
%9.3	1.41
%9	1.49
%8.5	1.39
%8.2	1.46
%8.7	1.27
%8.6	1.26
%8.4	1.25
%8.2	1.17
%8.1	1.19
%8	1.11
%7.9	1.07
%8	1
%8	0.97
%7.9	0.97
%7.9	0.94
%8.2	0.93
%7.7	0.83
%7.5	0.9
%7.5	0.94
%7.4	0.99
%7.3	0.98
%7.2	0.99
%7.1	0.94
%7.3	1.04
%7.4	1.07
%7.4	1.11
%7.5	1.1
%7.5	1.14
%7.6	1.05
%7	0.9
%7	0.88
%7.2	0.83
%7.2	0.85
%7.1	0.89
%7.2	0.88
%7.5	0.7
%7.7	0.78
%7.2	0.67
%6.7	0.72
%6.5	0.73
%6.6	0.68
%6.5	0.67
%6.6	0.66
%6.6	0.59
%6.4	0.52
%6.2	0.55];
%units.LWd = {'cm', 'g'};     label.LWd = {'total length', 'dry weight'};  
%bibkey.LWd = 'Sutton2000'; comment.LWd = 'Northeast Brook, Newfoundland, Canada - cross-sectional';

%data.LWd = [ ... % fork length (cm), dry weight (g)
%19.7 67.7*(1-0.7)
%20.9 81.6*(1-0.695)
%22.6 100.7*(1-0.718)
%21.1 83.5*(1-0.706)
%24.1 120.6*(1-0.731)
%24.1 121.5*(1-0.729)
%23.7 114.1*(1-0.721)
%23.8 110.6*(1-0.716)
%27.6 188.3*(1-0.707)];
%units.LWd   = {'cm', 'g'};  label.LWd = {'total length', 'dry weight'};  
%bibkey.LWd = 'Rottiers1993'; comment.LWd = 'Penobscot River strain (USA) - temperature between 8 and 12 C';

%% Wd-Ww data

%data.WdWw = [ ... % dry weight (g), wet weight (g) 
%0.43 2.1
%0.41 2.1
%0.43 2.0
%0.69 3.5
%2.21	11.8
%3.43	16.8
%3.78	18.5
%2.60	15.2
%2.94	14.5
%2.78	15.4
%2.94	16.5
%3.26	23.7
%4.41	21.1
%3.42	18.9
%5.33	25.3
%5.72	27.2];
%units.WdWw = {'g', 'g'};     label.WdWw = {'dry weight', 'wet weight'};  
%bibkey.WdWw = 'Sutton2000'; comment.WdWw = 'Northeast Brook, Newfoundland, Canada - cross-sectional';

%data.WdWw = [ ... % dry weight (g), wet weight (g)
%67.7*(1-0.7) 67.7
%81.6*(1-0.695) 81.6
%100.7*(1-0.718)  100.7
%83.5*(1-0.706) 83.5
%120.6*(1-0.731)  120.6
%121.5*(1-0.729)  121.5
%114.1*(1-0.721)  114.1
%110.6*(1-0.716)  110.6
%188.3*(1-0.707)  188.3];
%units.WdWw   = {'g', 'g'};  label.WdWw = {'dry weight', 'wet weight'};  
%bibkey.WdWw = 'Rottiers1993'; comment.WdWw = 'Penobscot River strain (USA) - temperature between 8 and 12 C';
  
%data.WdWw = [ ... % dry weight (g), wet weight (g)
%81.9*0.303 81.9
%77.5*0.266 77.5
%75*0.254 75
%72.9*0.247 72.9];
%units.WdWw   = {'g', 'g'};  label.WdWw = {'dry weight', 'wet weight'};  
%bibkey.WdWw = 'ElMowafi1997'; comment.WdWw = 'probably a domestic strain - under starvation';

%% L-WwR data

%data.LWwR = [ ... % total length (cm), ovary wet weight (g) 
%6.1	0.019
%6.4	0.018
%6.7	0.020
%7.1	0.029
%7.2	0.026
%7.4	0.030
%7.6	0.028
%7.8	0.034
%8.4	0.036
%8.4	0.037
%8.4	0.037
%8.4	0.037
%9.5	0.042
%9.5	0.035
%10.2	0.049
%10.2	0.041
%10.3	0.052
%10.3	0.046
%10.4	0.049
%10.5	0.049
%10.5	0.043
%10.6	0.038
%10.7	0.048
%10.7	0.048
%10.9	0.055
%11.1	0.056
%11.2	0.052
%11.4	0.057
%11.5	0.050];
%units.LWwR = {'cm', 'g'};     label.LWwR = {'total length', 'gonad wet weight'};  
%bibkey.LWwR = 'Adams1989'; comment.LWwR = 'Scottish stock - exact origin unknown - females';
%
%% L-N data

%data.LN = [ ... % total length (cm), number of eggs (#) 
%65.2	8249
%70.3	7422
%70.7	6763
%68.1	7177
%67.2	7419
%67.1	6516
%67.8	6239
%69.7	6380
%69.1	5893
%69.3	5477
%70.9	5687
%67.7	4052
%69.1	4505
%67.8	4400
%66.8	4503
%67.3	4850
%66.6	4919
%66.4	5162
%65.9	5473
%65.2	5681
%65.8	5959
%63.7	6686
%62.6	5782
%64.6	5264
%63.9	5055
%65.2	5021
%65.0	4709
%64.5	4222
%63.9	4569
%63.3	4776
%61.6	4948
%62.4	4775
%61.8	4427
%60.2	4807
%59.4	4633
%66.0	3877
%65.1	3737
%64.2	3528
%65.7	3460
%66.9	3427
%65.7	2870
%63.6	2555
%57.2	1472
%59.1	2446
%57.9	2549
%54.5	3378
%56.5	3172
%58.8	3105
%62.0	3248
%62.1	3977
%59.8	3384
%61.1	3663
%57.5	3381
%58.2	3660
%57.3	3936
%57.3	4110
%57.0	4422
%59.1	4008
%59.3	3730
%60.4	3836
%60.4	4217
%60.9	4565
%69.2	4158
%90.0	14456
%89.5	12130
%88.0	11573
%89.0	11261
%91.1	10535
%90.6	9875
%83.1	11741
%83.5	10977
%82.1	11045
%82.1	10872
%82.1	10768
%85.4	9869
%83.5	9728
%84.0	9104
%85.1	9001
%79.0	9549
%79.2	9029
%78.1	8750
%77.8	8368
%76.7	8297
%81.6	8407
%83.1	8339
%83.7	7958
%82.5	7957
%79.8	8370
%79.2	7988
%80.3	7711
%77.8	7222
%77.2	7222
%81.6	6672
%85.0	6085
%86.6	5011
%73.7	5656
%71.6	3675
%73.7	3573
%76.8	3126];   
%units.LN = {'cm', '#'};     label.LN = {'total length', 'number of eggs'};  
%bibkey.LN = 'Thorpe1984';    comment.LN = 'River Almond (Scotland)';

%% Proximal composition data
%data.tLipid = [ ...    % time since first feeding (d), lipid (g)
%434  67.7*0.121
%448  81.6*0.137
%463  100.7*0.107
%477  83.5*0.15
%491  120.6*0.103
%506  121.5*0.097
%526  114.1*0.11
%540  110.6*0.096
%568  188.3*0.111];
%units.tLipid   = {'d', 'g'};  label.tLipid = {'time since birth', 'lipid'};  
%temp.tLipid    = C2K(10);  units.temp.tLipid = 'K'; label.temp.tLipid = 'temperature';
%bibkey.tLipid = 'Rottiers1993';
%comment.tLipid = 'Penobscot River strain (USA) - temperature between 8 and 12 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6XCXT'; % Cat of Life
metaData.links.id_ITIS = '161996'; % ITIS
metaData.links.id_EoL = '46563143'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_salar'; % Wikipedia
metaData.links.id_ADW = 'Salmo_salar'; % ADW
metaData.links.id_Taxo = '42821'; % Taxonomicon
metaData.links.id_WoRMS = '127186'; % WoRMS
metaData.links.id_fishbase = 'Salmo-salar'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salmo_salar}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carey2000'; type = 'Article'; bib = [ ... 
'author = {Carey, James R. and Judge, Debra S.}, ' ... 
'year = {2000}, ' ...
'title = {Longevity Records: {L}ife Spans of Mammals, Birds, Amphibians, Reptiles, and Fish}, ' ...
'journal = {Monographs on Population Aging}, ' ...
'publisher = {Odense University Press}, ' ...
'volume = {8}, ' ...
'howpublished = {\url{https://www.demogr.mpg.de/longevityrecords/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Flower1935'; type = 'Article'; bib = [ ... 
'author = {Flower, Stanley.S.}, ' ... 
'year = {1935}, ' ...
'title = {Further notes on the duration of life in animals. - {I}. {F}ishes: as determined by otolith and scale - readings and direct observations on living animals.}, ' ...
'journal = {Proceedings of the Zoological Society of London}, ' ...
'volume = {265}, ' ...
'pages = {page 274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hutchings1998'; type = 'Article'; bib = [ ... 
'author = {Hutchings, Jeffrey A. and Jones, Megan E. B.}, ' ... 
'year = {1998}, ' ...
'title = {Life history variation and growth rate thresholds for maturity in {A}tlantic salmon, \emph{Salmo salar}}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {55}, ' ...
'number = {S1}, ' ...
'doi = {10.1139/d98-004}, ' ...
'pages = {Table A1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VanLeeuwen2016'; type = 'Article'; bib = [ ... 
'author = {Van Leeuwen, Travis E. and McLennan, Darryl and McKelvey, Simon and Stewart, David C. and Adams, Colin E. and Metcalfe, Neil B.}, ' ... 
'year = {2016}, ' ...
'title = {The association between parental life history and offspring phenotype in {A}tlantic salmon}, ' ...
'journal = {Journal of Experimental Biology}, ' ...
'volume = {219}, ' ...
'number = {3}, ' ...
'doi = {10.1242/jeb.122531}, ' ...
'pages = {Figures 1 and S2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jutila2006'; type = 'Article'; bib = [ ... 
'author = {Jutila, E. and Jokikokko, E. and Julkunen, M.}, ' ... 
'year = {2006}, ' ...
'title = {Long-term changes in the smolt size and age of {A}tlantic salmon, \emph{Salmo salar} {L}., in a northern {B}altic river related to parr density, growth opportunity and postsmolt survival.}, ' ...
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = {15}, ' ...
'number = {}, ' ...
'doi = {10.1111/j.1600-0633.2006.00171.x}, ' ...
'pages = {321-330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fleming1996'; type = 'Article'; bib = [ ... 
'author = {Fleming, Ian A.}, ' ... 
'year = {1996}, ' ...
'title = {Reproductive strategies of {A}tlantic salmon: ecology and evolution}, ' ...
'journal = {Reviews in Fish Biology and Fisheries}, ' ...
'volume = {6}, ' ...
'pages = {Tables 2, 3 and 5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thorpe1984'; type = 'Article'; bib = [ ... 
'author = {Thorpe, J.E. and Miles, M.S. and Keay, D.S.}, ' ... 
'year = {1984}, ' ...
'title = {Developmental rate, fecundity and egg size in {A}tlantic salmon, \emph{Salmo salar} {L}.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {43}, ' ...
'number = {1-3}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Figure 1, page 294, extracted using WebPlotDigitizer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sutton2000'; type = 'Article'; bib = [ ... 
'author = {Thorpe, J.E. and Miles, M.S. and Keay, D.S.}, ' ... 
'year = {1984}, ' ...
'title = {Developmental rate, fecundity and egg size in {A}tlantic salmon, \emph{Salmo salar} {L}.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {43}, ' ...
'number = {1-3}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Figure 1, page 294, extracted using WebPlotDigitizer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jonsson1998'; type = 'Article'; bib = [ ... 
'author = {Jonsson, N. and Jonsson, B. and Hansen, L. P.}, ' ... 
'year = {1998}, ' ...
'title = {Long-term study of the ecology of wild {A}tlantic salmon smolts in a small {N}orwegian river}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {52}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Table 1, page 641}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kazarov1981'; type = 'Article'; bib = [ ... 
'author = {Kazarov, R. V.}, ' ... 
'year = {1981}, ' ...
'title = {The effect of the size of {A}tlantic salmon, \emph{Salmo salar} {L}., eggs on embryos and alevins}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {19}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Tables I and III, page 355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% Kazarov also has relatioship between egg weight, length and weight at hatching, length and weight at first feeding, but averaged for five classes of size
%
bibkey = 'Peterson1977'; type = 'Article'; bib = [ ... 
'author = {Peterson, R. H. and Spinney, H. C. E. and Sreedharan A.}, ' ... 
'year = {1977}, ' ...
'title = {Development of {A}tlantic Salmon (\emph{Salmo salar}) Eggs and Alevins Under Varied Temperature Regimes}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {34}, ' ...
'number = {1}, ' ...
'doi = {10.1139/f77-004}, ' ...
'pages = {31-43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Handeland1998'; type = 'Article'; bib = [ ... 
'author = {Handeland, S. O. and Berge, A. and Bj\"{o}rnsson, B. T. and Stefansson, S. O.}, ' ... 
'year = {1998}, ' ...
'title = {Effects of temperature and salinity on osmoregulation and growth of {A}tlantic salmon (\emph{Salmo salar} {L}.) smolts in seawater}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {168}, ' ...
'number = {1-4}, ' ...
'doi = {10.1016/S0044-8486(98)00356-1}, ' ...
'pages = {289-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Handeland2008'; type = 'Article'; bib = [ ... 
'author = {Handeland, S. O. and Imsland, A. K. and Stefansson, S. O.}, ' ... 
'year = {2008}, ' ...
'title = {The effect of temperature and fish size on growth, feed intake, food conversion efficiency and stomach evacuation rate of {A}tlantic salmon post-smolts}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {283}, ' ...
'number = {1-4}, ' ...
'doi = {10.1016/j.aquaculture.2008.06.042}, ' ...
'pages = {36-42, Figure 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% Also has data on food intake (in g commercial feed by g of fish) as a function of time since smolting and temperature. Energy content of commercial feed unknown.
%
bibkey = 'Srivastava1991'; type = 'Article'; bib = [ ... 
'author = {Srivastava, Rakesh Kumar and Brown, Joseph A.}, ' ... 
'year = {1991}, ' ...
'title = {The biochemical characteristics and hatching performance of cultured and wild {A}tlantic salmon (\emph{Salmo salar}) eggs}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {69}, ' ...
'number = {9}, ' ...
'doi = {10.1139/z91-342}, ' ...
'pages = {2436-2441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carrick1979'; type = 'Article'; bib = [ ... 
'author = {Carrick, T. R.}, ' ... 
'year = {1979}, ' ...
'title = {The effect of acid water  on the hatching of salmonid eggs}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {14}, ' ...
'doi = {10.1111/j.1095-8649.1979.tb03506.x}, ' ...
'pages = {165-172, Table III}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wallace1988'; type = 'Article'; bib = [ ... 
'author = {Wallace, J. C. and Heggberget, T. G.}, ' ... 
'year = {1988}, ' ...
'title = {Incubation of eggs of {A}tlantic salmon (\emph{Salmo salar})  from different {N}orwegian streams at  temperatures below 1\,C.}, ' ...
'journal = {Journal of Fisheries and Aquatic Science}, ' ...
'volume = {45}, ' ...
'number = {1}, ' ...
'doi = {10.1139/f88-022}, ' ...
'pages = {193-196, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Adams1989'; type = 'Article'; bib = [ ... 
'author = {Wallace, C. E. and Thorpe, J. E.}, ' ... 
'year = {1989}, ' ...
'title = {Photoperiod and temperature effects on early development and reproductive investment in {A}tlantic salmon (\emph{Salmo salar} {L}.).}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {79}, ' ...
'number = {1-4}, ' ...
'doi = {10.1016/0044-8486(89)90483-3}, ' ...
'pages = {403-409, Figure 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rottiers1993'; type = 'Article'; bib = [ ... 
'author = {Rottiers, Donald V.}, ' ... 
'year = {1993}, ' ...
'title = {Elemental composition of a migratory and a land-locked strain of {A}tlantic salmon \emph{Salmo salar}}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A: Physiology}, ' ...
'volume = {104A}, ' ...
'number = {1}, ' ...
'doi = {10.1016/0300-9629(93)90014-U}, ' ...
'pages = {93-100, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElMowafi1997'; type = 'Article'; bib = [ ... 
'author = {ElMowafi, A. F. A. and Maage, A. and Lorentzen, M. and Hassanein, E. I. and Julshamn, K.}, ' ... 
'year = {1997}, ' ...
'title = {Tissue indicators of element status in {A}tlantic salmon (\emph{Salmo salar}) post-smolts: effect of fasting}, ' ...
'journal = {Aquaculture Nutrition}, ' ...
'volume = {3}, ' ...
'doi = {10.1046/j.1365-2095.1997.00073.x}, ' ...
'pages = {73-80, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunnes1979'; type = 'Article'; bib = [ ... 
'author = {Gunnes, Knut}, ' ... 
'year = {1979}, ' ...
'title = {Survival and development of {A}tlantic salmon eggs and fry at three different temperatures}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {16}, ' ...
'doi = {10.1016/0044-8486(79)90109-1}, ' ...
'pages = {211-218, Table I and Figure 5a}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berg2001'; type = 'Article'; bib = [ ... 
'author = {Berg, O. K. and Hendry, A. P. and Svendsen, B. and Bech, C. and Arnekleiv, J. V. and Lohrmann, A.}, ' ... 
'year = {2001}, ' ...
'title = {Maternal provisioning of offspring and the use of those resources during ontogeny: variation within and between {A}tlantic Salmon families}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {15}, ' ...
'doi = {10.1046/j.1365-2435.2001.00473.x}, ' ...
'pages = {13-23, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Einum2000'; type = 'Article'; bib = [ ... 
'author = {Einum, Sigurd and Fleming, Ian A.}, ' ... 
'year = {2000}, ' ...
'title = {Selection against late emergence and small offspring in {A}tlantic salmon (\emph{Salmo salar})}, ' ...
'journal = {Evolution}, ' ...
'volume = {54}, ' ...
'number = {2}, ' ...
'doi = {10.1111/j.0014-3820.2000.tb00064.x}, ' ...
'pages = {628-639}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/236}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

