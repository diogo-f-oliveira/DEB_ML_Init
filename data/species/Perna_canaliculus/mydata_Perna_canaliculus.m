function [data, auxData, metaData, txtData, weights] = mydata_Perna_canaliculus

%% set metadata

metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae ';
metaData.species    = 'Perna_canaliculus'; 
metaData.species_en = 'New Zealand green-lipped mussel';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'GSI'; 'Ri'};
metaData.data_1     = {'t-L_f'; 't-Wd_f'; 't-Ww_f'; 'L-Ww_f'; 'L-Wd_f'; 'Ww-dWw_f'; 'L-N_T'; 'L-E_f'; 'L-dL_f'; 'L-JO_f'; 'Ww-JX_f'};

metaData.COMPLETE = 5.5; % using criteria of LikaKear2011

metaData.author   = {'Jeffrey Ren'};                            
metaData.date_subm = [2018 12 11];                            
metaData.email    = {'jeffrey.ren@niwa.co.nz', 'jeffrey.ren2012@gmail.com'};                  
metaData.address  = {'National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand'}; 

metaData.author_mod_1    = {'Suncana Gecek', 'Nina Marn', 'Martin Cheng'};    
metaData.date_mod_1      = [2024 03 08];              
metaData.email_mod_1     = {'suncana@irb.hr'};            
metaData.address_mod_1   = {'Rudjer Boskovic Institute, Bijenicka cesta 54, Zagreb, Croatia'};

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc    = [2024 03 08]; 


%% set data
% zero-variate data;
%======================================================================================= 

%data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Buchann1998';   
%  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'Rusk2012','RuskAlfa2017'};   
  temp.ab = C2K(15.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'D-larvae at day 2 pf, some late D-larvae (4 days pf) have developed PII layer, which coincides with digestive system and exogenous feeding, see also https://doi.org/10.1093/mollus/eyt044 '; 
data.tj = 20-data.ab;      units.tj = 'd';    label.tj = 'time since birth at metamorphosis';             bibkey.tj = {'Rusk2012'};   
  temp.tj = C2K(19.1);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'post-larvae at day 20 post-fertilization, characterized by layers indicating the onset of settlement transition'; 
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.Lp = 'estimate based on Alfa2001: spawning occurs between Jun and Dec, and in Jul and Apr shells 3-60mm in length were recovered; zero weight for par estimation'; 
data.am = 20 * 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.Lb  = 0.00979; units.Lb  = 'cm';  
data.Lb  = 0.0111; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = {'Rusk2012','RuskAlfa2017'};
comment.Lb = 'shell length of late D-larvae'; 
data.Lj  = 0.028; units.Lj  = 'cm';  label.Lj  = 'shell length at metamorphosis';   bibkey.Lj  = 'RaggGale2019';
comment.Lj = '0.0242 cm in Rusk2012'; 
data.Lp  = 2.7;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Alfa2001';
% data.Li  = 24; bibkey.Li = 'Wiki';
data.Li  = 14.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li = 'Alfa2001';

% J.Ren: data.Wdb = 1e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';    bibkey.Wdb = 'guess';
%data.Wdb = 5e-8;   units.Wdb = 'g';   label.Wdb = 'ash free dry weight at birth';    bibkey.Wdb = 'RaggGale2019';
data.Wdb = 5e-8 /(0.00979/0.0111);   units.Wdb = 'g';   label.Wdb = 'ash free dry weight at birth';    bibkey.Wdb = {'Rusk2012','RaggGale2019'};
comment.Wdb = 'Used the ratio of lengths for 2-day and 4-day old D-larvae, and weight of 2-day D-larva; resulting value 5.67e-08'; 
data.Wdj = 1.8e-6;   units.Wdj = 'g';   label.Wdj = 'ash free dry weight at metamorphosis';    bibkey.Wdj = 'RaggGale2019';
%data.Wdp = 0.5;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';    bibkey.Wdp = 'NIWA';
%  comment.Wdp = 'calculation based on length-weight relationship from NIWA unpublished data';
data.Wdp = 0.15;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';    bibkey.Wdp = 'NIWA';
  comment.Wdp = 'Calculation based on mean value of 2 length-dry weight relationships established by Ibarrola et al. 2017 (Lp=27mm)';
%data.Wdi = 35;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';
data.Wdi = 35;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';

data.GSI  = 0.14; units.GSI  = '-'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'NIWA';   
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI is both temporally and spatially variable';

%data.Ri  = 1e7/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Buchann1998';      
%  comment.Ri = 'Estimated value';
data.Ri  = 1e8/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Jenk1979','ChenRagg2020'}; 
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '95th percentile of exper.data, in accordance with Jenk1979; Temperature is average from exp data';

data.E0 = 0.0004; units.E0  = 'J';  label.E0  = 'energy content of an egg';     bibkey.E0  = 'ChenRagg2020'; 
    comment.E0 = 'median 0.0003 J, average 0.0004 J, range 0.00007-0.003J; calculated from egg diameter, and energy content of AFDW/g egg according to Kooijman 2010; WW to AFDW using 0.137 from adult data';
    
% uni-variate data
%======================================================================================= 

% time-length (larvae)
tL0 = [ ... % age (days) (moved from 15.5 to 19.1C at day 4), length (mum)
     2     4     5     7     8     9    10    11    12    13    15    16    17    18    19
  98.17  111.02  122.81  134.68  141.60  137.43  136.24  141.80  165.58  172.14  198.93  186.01  210.88  212.76  241.93]';
data.tL0(:,1) = tL0(:,1) - 2;    % convert age to time since birth and disregard first value
data.tL0(:,2) = tL0(:,2) * 1e-4; % convert mu to cm
units.tL0 = {'d', 'cm'};     label.tL0 = {'time since birth', 'length'}; 
  temp.tL0 = C2K(19.1);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'Rusk2012'; comment.tL0 = 'Figure 2.6 on page 46'; 


% Jeffrey Ren data

% time-length (site 1)
data.tL1 = [ ... % time (yr), length (cm)
 1.030	1.274	1.312	1.359	1.447	1.526	1.611	1.693	1.778	1.860	1.945	2.030
 4.79	5.99	6.3	6.72	6.72	7.23	7.51	7.95	7.96	8.68	9.30	9.37]';
data.tL1(:,1) = data.tL1(:,1) * 365; % conver age in year to day
units.tL1 = {'d', 'cm'};     label.tL1 = {'time since birth', 'length'}; 
  temp.tL1 = C2K(15);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
L0.tL1 = data.tL1(1,2); units.L0.tL1 = 'cm'; label.L0.tL1 = 'initial length';
  bibkey.tL1 = 'NIWA'; comment.tL1 = 'annual mean temperature';

% time-dry weight (site 1)
data.tWd1 = [ ... % time (d), dry flesh weight (g)
1.030	1.274	1.312	1.359	1.447	1.526	1.611	1.693	1.778	1.860	1.945	2.030
0.35	0.71	0.8	0.91	1.11	1.27	1.57	1.86	2.02	2.31	2.80	2.38]';
data.tWd1(:,1) = data.tWd1(:,1) * 365; % conver age in year to day
units.tWd1   = {'d', 'g'};  label.tWd1 = {'time', 'dry weight'};  
 temp.tWd1    = C2K(15);  units.temp.tWd1 = 'K'; label.temp.tWd1 = 'temperature';
  bibkey.tWd1 = 'NIWA';

 
% time-length (site 2)
data.tL2 = [ ... % time (yr), length (cm)
1.030	1.274	1.312	1.359	1.447	1.526	1.611	1.693	1.778	1.860	1.945	2.030
4.79	6.46	6.53	6.85	7.35	7.32	7.79	8.18	8.47	9.28	9.56	9.54]';
data.tL2(:,1) = data.tL2(:,1) * 365; % conver age in year to day
units.tL2 = {'d', 'cm'};     label.tL2 = {'time since birth', 'length'}; 
  temp.tL2 = C2K(15);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
 L0.tL2 = data.tL2(1,2); units.L0.tL2 = 'cm'; label.L0.tL2 = 'initial length';
  bibkey.tL2 = 'NIWA'; comment.tL2 = 'annual mean temperature'; 
  
% time-dry weight (site 2)
data.tWd2 = [ ... % time (d), dry flesh weight (g)
1.030	1.274	1.312	1.359	1.447	1.526	1.611	1.693	1.778	1.860	1.945	2.030
0.35	0.87	0.9	0.96	1.05	1.07	1.7	2.18	2.41	3.22	3.13	3.08]';
data.tWd2(:,1) = data.tWd2(:,1) * 365; % conver age in year to day
units.tWd2   = {'d', 'g'};  label.tWd2 = {'time', 'dry weight'};  
temp.tWd2    = C2K(15);  units.temp.tWd2 = 'K'; label.temp.tWd2 = 'temperature';
bibkey.tWd2 = 'NIWA';

%% --------- % Martin data % ----------------

% individuals - 1-length, 2- weight, 3-# eggs, 4- egg diameter
% individuals 1:27 at temp 18, 28:54 at temp 20C
LWt = [ % start length (mm), %weight before spawning (g)
123.43	130.38	131.27	134.14	121.21	136.09	131.96	129.96	127.48	133.90	133.90	128.83	126.66	101.88	98.21	107.37	98.50	107.62	107.83	107.33	116.66	108.34	105.42	107.01	115.65	111.60	104.29	128.43	133.14	127.44	118.66	125.17	133.25	139.30	122.47	131.64	128.10	137.07	129.32	133.18	109.74	112.54	99.16	110.42	110.88	126.62	113.16	92.54	104.34	114.31	109.08	97.32	100.06	99.17
123.2	191.5	154.9	181.1	102.4	176.6	160.3	174.8	155.2	213.0	212.9	186.1	184.8	64.9	61.9	76.3	62.7	70.0	69.3	77.6	77.4	86.7	76.5	79.1	95.3	87.3	67.5	140.2	174.8	189.6	175.7	128.5	162.5	184.0	152.9	163.8	160.4	212.4	154.0	188.7	70.5	82.3	64.8	78.3	78.6	115.2	84.5	59.1	75.8	94.8	85.4	57.4	70.9	67.0]';

eggND = [ % number of eggs, % diameter of eggs (rows correspond to individuals above)
99240000	31900000	43440000	59590000	16840000	130900000	92150000	17340000	67300000	44640000	79790000	73430000	62390000	44290000	33540000	90390000	53940000	11840000	91940000	25190000	16540000	67290000	45080000	18140000	24390000	88240000	52840000	37790000	10995000	53490000	76230000	10690000	118200000	71540000	72590000	65630000	53850000	112800000	23125000	74390000	18690000	42000000	20600000	7020000	82540000	55840000	23140000	56150000	40590000	64890000	34440000	11340000	55890000	14040000
59.05	59.96	61.92	77.81	48.40	52.64	52.04	104.97	34.92	54.10	65.80	82.39	39.41	38.27	56.69	40.74	48.89	54.44	47.01	58.20	73.93	46.75	49.71	60.47	61.70	55.03	67.48	54.48	55.80	82.10	57.02	126.01	47.18	48.60	60.70	56.51	61.32	40.42	85.24	64.39	56.87	51.48	51.81	64.80	45.98	37.97	54.86	57.54	61.73	60.44	59.51	55.22	45.19	51.43]';

data.LWt_18 = [LWt(1:27,1)/10, LWt(1:27,2)];
units.LWt_18   = {'cm', 'g'};  label.LWt_18 = {'length', 'total wet weight'};  
bibkey.LWt_18 = 'ChenRagg2020';

data.LN_18 = [LWt(1:27,1)/10, eggND(1:27,1)];
units.LN_18   = {'cm', '#'};  label.LN_18 = {'length', 'number of spawned eggs'};  
temp.LN_18    = C2K(18);  units.temp.LN_18 = 'K'; label.temp.LN_18 = 'temperature';
bibkey.LN_18 = 'ChenRagg2020';

data.LWt_20 = [LWt(28:end,1)/10, LWt(28:end,2)];
units.LWt_20   = {'cm', 'g'};  label.LWt_20 = {'length', 'total wet weight'};  
bibkey.LWt_20 = 'ChenRagg2020';

data.LN_20 = [LWt(28:end,1)/10, eggND(28:end,1)];
units.LN_20   = {'cm', '#'};  label.LN_20 = {'length', 'number of spawned eggs'};  
temp.LN_20    = C2K(20);  units.temp.LN_20 = 'K'; label.temp.LN_20 = 'temperature';
bibkey.LN_20 = 'ChenRagg2020';


%%   TREATMENT 5
% length-wet weight (treatment 5): Wt is total wet weight including shell (treatment 5, EXPERIMENT1)
L5=[61.00 64.00 65.14 66.89 68.00 68.89 64.00 67.00 68.11 68.39 69.03 69.82 74.00 77.00 78.60 80.19 80.89 81.92 63.00 65.00 67.40 68.68 69.27 70.36 61.00 62.00 64.54 65.49 66.28 66.77 72.00 75.00 78.38 79.55 80.80 81.74 70.00 70.00 70.27 60.00 64.00 64.38 65.60 66.59 67.09 63.00 69.00 72.35 73.17 74.25 75.60 65.00 66.00 66.39 66.88 67.35 67.06 63.00 67.00 69.31 71.22 72.38 74.93 62.00 64.00 64.64 64.94 65.78 66.49 59.00 61.00 63.32 64.28 65.11 67.10 56.00 57.00 58.56 59.17 60.16 64.49 70.00 73.00 74.56 75.70 76.99 77.44 65.00 67.00 68.23 68.73 69.18 70.09 59.00 61.00 63.09 64.47 65.01 65.42 70.00 70.00 71.83 73.69 74.13 74.82 58.00 60.00 61.97 63.13 63.25 63.00 65.00 65.96 67.72 69.02 70.43 65.00 67.00 68.88 69.85 70.84 72.06 66.00 69.00 70.75 71.50 72.49 74.44 69.00 71.00 71.73 73.63 74.07 74.93 72.00 75.00 77.37 78.40 79.90 81.29 70.00 71.00 72.74 73.49 73.86 74.33 63.00 65.00 64.66 65.19 65.33 66.34 61.00 62.00 63.95 65.14 65.79 66.07 66.00 68.00 70.01 71.27 71.35 72.72 71.00 74.00 75.47 76.10 76.85 77.93 69.00 72.00 73.85 75.75 76.95 77.38 71.00 74.00 77.56 78.87 79.77 80.35 77.00 79.00 80.91 82.38 82.70 83.64 63.00 65.00 65.77 66.94 67.32 67.94 72.00 74.00 75.29 77.30 78.16 79.68 70.00 71.00 71.92 73.01 73.51 74.34 66.00 66.00 67.37 68.83 69.11 69.40 72.00 74.00 75.02 76.30 76.60 77.09 65.00 67.00 69.67 71.31 71.89 72.93 67.00 69.00 70.43 71.86 72.62 73.34]';
Wt5=[16.92 21.20 22.52 24.54 25.11 26.77 20.69 22.74 24.45 24.52 29.76 26.33 31.87 33.94 37.32 39.66 40.84 42.33 21.24 22.59 25.28 26.29 26.99 28.45 18.62 19.44 21.30 22.05 23.00 24.07 31.16 35.19 38.49 40.23 42.63 44.18 25.42 25.70 26.22 16.63 19.30 20.29 21.35 22.31 23.01 20.38 24.55 29.51 31.21 32.50 34.13 20.49 21.45 21.84 22.12 22.47 22.66 20.04 24.93 28.07 29.81 32.41 35.12 18.75 19.85 21.43 21.60 22.45 23.39 15.36 17.28 19.32 19.73 20.87 22.67 13.90 15.05 16.19 16.63 18.35 21.48 25.31 28.03 30.77 31.88 34.05 34.46 20.21 21.60 23.40 23.63 24.16 25.09 17.32 18.50 20.64 21.63 22.29 23.11 27.40 28.60 30.44 31.85 32.83 33.94 16.60 18.22 19.66 20.50 20.82 18.65 20.90 22.48 23.96 25.47 27.06 23.06 25.03 27.48 28.37 29.81 31.54 23.37 26.80 28.83 29.59 31.06 32.32 25.33 28.60 30.49 32.48 34.14 34.86 29.73 33.46 37.55 39.37 41.73 44.09 25.98 29.42 31.19 31.53 32.06 32.54 19.33 20.31 20.66 20.89 21.38 21.88 18.87 20.30 22.08 23.06 23.85 24.78 23.10 24.84 26.85 28.16 29.16 29.91 26.66 29.27 30.95 31.87 32.69 33.65 29.10 31.30 34.14 36.41 38.05 38.73 32.56 36.78 42.00 44.33 45.65 47.03 40.40 43.60 46.54 49.24 50.45 51.45 22.84 25.15 26.29 26.83 27.47 28.08 31.07 34.30 36.42 38.44 39.76 42.35 27.30 29.19 30.59 31.27 32.45 33.14 22.30 23.00 24.48 25.41 25.64 26.21 30.04 32.36 33.59 35.20 35.43 36.33 21.68 23.85 26.22 27.44 28.51 29.69 23.96 25.70 27.95 29.14 30.31 31.23]';
data.LWt_f5 = [ ... % length (mm), total wet weight (including shell) (g)
L5/10  Wt5 
];
units.LWt_f5   = {'cm', 'g'};  label.LWt_f5 = {'length', 'total wet weight, exp1'};  
bibkey.LWt_f5 = 'ChenRagg2020'; comment.LWt_f5 = 'Treatment 5'; 


% length-ash-free dry weight(treatment 5): Wafd is ash free dry flesh weight (treatment 5, EXPERIMENT2)
L_f5=[64.37 72.93 72.81 70.22 68.86 71.38 69.07 65.64 58.27 64.28 73.66 67.75 59.18 68.57 67.74 64.13 65.88 69.40 64.39 61.69 68.18 76.13 64.51 66.21 65.56 67.61 73.51 68.75 65.80 62.09 80.02 69.02 74.39 68.53 69.50 69.00 61.95 75.91 75.30]';
AFDWFleshW5=[0.688 1.048 1.082 0.865 0.904 1.531 0.912 0.938 0.479 0.650 1.236 0.879 0.464 1.117 0.530 0.582 0.926 0.878 0.792 0.706 1.427 1.786 1.112 1.101 1.320 0.797 0.968 0.730 0.573 0.545 1.267 0.916 1.413 1.194 0.876 1.184 0.525 1.118 1.385]';

data.LWafd_f5_E2 = [ ... % length (cm),  ash free dry flesh weight (g)
L_f5/10  AFDWFleshW5 
];
units.LWafd_f5_E2   = {'cm', 'g'};  label.LWafd_f5_E2 = {'length', 'ash-free dry flesh weight, exp2'};  
bibkey.LWafd_f5_E2 = 'ChenRagg2020'; comment.LWafd_f5_E2 = 'Treatment 5'; 

% L-Wt-Ww-Wd (treatment 5)
Wt_f5 = [19.42 29.30 29.84 25.95 24.62 28.13 26.20 23.12 16.15 19.46 29.90 24.15 16.46 25.26 24.37 20.67 22.49 26.59 22.90 19.06 26.68 32.93 24.38 25.12 24.37 25.32 33.88 25.53 21.93 18.17 40.55 28.33 35.13 27.82 27.35 25.69 18.20 34.13 35.52]';
Ww_f5 = [4.61  6.70  6.97  6.15  5.94  7.92  6.34  6.03  3.15  4.85  7.66  5.73  3.24  7.65  5.10  4.18  6.45  6.13  4.82  4.78  7.78  9.40  6.44  7.04  7.50  5.87  7.15  5.54  4.34  4.06 10.01  5.98  9.57  6.93  5.96  7.53  4.44  7.61 10.31]';
Wd_f5 = [0.803 1.204 1.243 0.999 1.040 1.685 1.059 1.065 0.554 0.766 1.406 1.014 0.556 1.273 0.658 0.677 1.077 1.017 0.902 0.825 1.587 1.991 1.254 1.253 1.476 0.930 1.133 0.862 0.682 0.641 1.516 1.063 1.647 1.351 1.018 1.354 0.641 1.298 1.617]';

data.LWt_f5_E2 = [ ... % length (cm),  total wet weight (g)
L_f5/10  Wt_f5 
];
units.LWt_f5_E2   = {'cm', 'g'};  label.LWt_f5_E2 = {'length', 'total wet weight, exp2'};  
bibkey.LWt_f5_E2 = 'ChenRagg2020'; comment.LWt_f5_E2 = 'Treatment 5'; 

data.LWw_f5_E2 = [ ... % length (cm),  wet flesh weight (g)
L_f5/10  Ww_f5 
];
units.LWw_f5_E2   = {'cm', 'g'};  label.LWw_f5_E2 = {'length', 'wet flesh weight, exp2'};  
bibkey.LWw_f5_E2 = 'ChenRagg2020'; comment.LWw_f5_E2 = 'Treatment 5'; 

data.LWd_f5_E2 = [ ... % length (cm),  dry flesh weight (g)
L_f5/10  Wd_f5 
];
units.LWd_f5_E2   = {'cm', 'g'};  label.LWd_f5_E2 = {'length', 'dry flesh weight, exp2'};  
bibkey.LWd_f5_E2 = 'ChenRagg2020'; comment.LWd_f5_E2 = 'Treatment 5'; 

% ENERGY (kJ/mussel)
L_f5e = [64.37 72.93 72.81 68.86 71.38 69.07 65.64 58.27 64.28 73.66 67.75 59.18 67.74 64.13 65.88 69.40 64.39 61.69 68.18 76.13 64.51 66.21 65.56 67.61 73.51 68.75 65.80 62.09 80.02 69.02 74.39 68.53 61.95 75.91 75.30]';
En_f5 = [15.26 22.34 22.42 19.60 31.48 19.76 19.76  9.93 13.75 25.58 18.52  9.27 10.68 11.99 19.55 18.79 15.37 13.92 30.37 37.58 24.05 23.30 27.42 16.74 21.49 15.29 11.65 11.18 26.23 18.60 28.49 26.21 10.75 22.82 29.42]';

data.LEn_f5_E2 = [L_f5e/10 En_f5*1e3]; %length (cm), energy (J/mussel)
units.LEn_f5_E2 = {'cm', 'J'}; label.LEn_f5_E2 = {'length', 'energy per mussel'}; 
bibkey.LEn_f5_E2 = 'ChenRagg2020';

% time-length data (treatment 5, EXPERIMENT1)
data.tL_f5 = [ ... % time (days), length (mm)
792 862 936 981 1027 1087
66.08 68.30 69.95 71.13 71.87 72.88]';
data.tL_f5(:,1) = data.tL_f5(:,1) -  data.tL_f5(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
data.tL_f5(:,2) = data.tL_f5(:,2) * 0.1;              % convert mm to cm
units.tL_f5 = {'d', 'cm'};     label.tL_f5 = {'time', 'length'}; 
  temp.tL_f5 = C2K(18);  units.temp.tL_f5 = 'K'; label.temp.tL_f5 = 'temperature';
  L0.tL_f5 = data.tL_f5(1,2);  units.L0.tL_f5 = 'cm'; label.L0.tL_f5 = 'initial length';
  bibkey.tL_f5 = 'ChenRagg2020'; comment.tL_f5 = 'Treatment 5; mean of (complete) growth curves (6 time points) ';


% time-total wet weight data (treatment 5, EXPERIMENT1)
data.tWt_f5 = [ ... % time (days), total wet weight (g)
792 862 936 981 1027 1087
23.56 25.90 28.06 29.24 30.49 31.57]';
data.tWt_f5(:,1) = data.tWt_f5(:,1) -  data.tWt_f5(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
units.tWt_f5 = {'d', 'g'};     label.tWt_f5 = {'time', 'total wet weight, exp1'}; 
  temp.tWt_f5 = C2K(18);  units.temp.tWt_f5 = 'K'; label.temp.tWt_f5 = 'temperature';
  bibkey.tWt_f5 = 'ChenRagg2020'; comment.tWt_f5 = 'Treatment 5; mean of (complete) growth curves (6 time points) ';


% Growth in total wet weight/day:  WtdWt (treatment 5, EXPERIMENT 1)
% total wet weight-change in total wet weight
Wt5 = [16.92 20.69 31.87 21.24 18.62 31.16 25.42 16.63 20.38 20.49 20.04 18.75 15.36 13.90 25.31 20.21 17.32 27.40 16.60 18.65 23.06 23.37 25.33 29.73 25.98 19.33 18.87 23.10 26.66 29.10 32.56 40.40 22.84 31.07 27.30 22.30 30.04 21.68 23.96 21.20 22.74 33.94 22.59 19.44 35.19 25.70 19.30 24.55 21.45 24.93 19.85 17.28 15.05 28.03 21.60 18.50 28.60 18.22 20.90 25.03 26.80 28.60 33.46 29.42 20.31 20.30 24.84 29.27 31.30 36.78 43.60 25.15 34.30 29.19 23.00 32.36 23.85 25.70 22.52 24.45 37.32 25.28 21.30 38.49 20.29 29.51 21.84 28.07 21.43 19.32 16.19 30.77 23.40 20.64 30.44 19.66 22.48 27.48 28.83 30.49 37.55 31.19 20.66 22.08 26.85 30.95 34.14 42.00 46.54 26.29 36.42 30.59 24.48 33.59 26.22 27.95 24.54 39.66 26.29 22.05 40.23 21.35 31.21 22.12 29.81 21.60 19.73 16.63 31.88 23.63 21.63 31.85 20.50 23.96 28.37 29.59 32.48 39.37 31.53 20.89 23.06 28.16 31.87 36.41 44.33 49.24 26.83 38.44 31.27 25.41 35.20 27.44 29.14 25.11 40.84 26.99 23.00 42.63 22.31 32.50 22.47 32.41 22.45 20.87 18.35 34.05 24.16 22.29 32.83 25.47 29.81 31.06 34.14 41.73 32.06 21.38 23.85 29.16 32.69 38.05 45.65 50.45 27.47 39.76 32.45 25.64 35.43 28.51 30.31]';
dWtdt5 = [0.0611 0.0293 0.0296 0.0193 0.0117 0.0576 0.0040 0.0381 0.0596 0.0137 0.0699 0.0157 0.0274 0.0164 0.0389 0.0199 0.0169 0.0171 0.0231 0.0321 0.0281 0.0490 0.0467 0.0533 0.0491 0.0140 0.0204 0.0249 0.0373 0.0314 0.0603 0.0457 0.0330 0.0461 0.0270 0.0100 0.0331 0.0310 0.0249 0.0178 0.0231 0.0457 0.0364 0.0251 0.0446 0.0070 0.0134 0.0670 0.0053 0.0424 0.0214 0.0276 0.0154 0.0370 0.0243 0.0289 0.0249 0.0195 0.0214 0.0331 0.0274 0.0255 0.0553 0.0239 0.0047 0.0241 0.0272 0.0227 0.0384 0.0705 0.0397 0.0154 0.0286 0.0189 0.0200 0.0166 0.0320 0.0304 0.0449 0.0016 0.0520 0.0224 0.0167 0.0387 0.0236 0.0378 0.0062 0.0387 0.0038 0.0091 0.0098 0.0247 0.0051 0.0220 0.0313 0.0187 0.0329 0.0198 0.0169 0.0442 0.0404 0.0076 0.0051 0.0218 0.0291 0.0204 0.0504 0.0518 0.0600 0.0120 0.0449 0.0151 0.0207 0.0358 0.0271 0.0264 0.0124 0.0257 0.0152 0.0207 0.0522 0.0209 0.0280 0.0076 0.0565 0.0185 0.0248 0.0374 0.0472 0.0115 0.0143 0.0213 0.0070 0.0328 0.0313 0.0320 0.0361 0.0513 0.0115 0.0107 0.0172 0.0217 0.0178 0.0357 0.0287 0.0263 0.0139 0.0287 0.0257 0.0050 0.0050 0.0233 0.0254 0.0277 0.0248 0.0243 0.0178 0.0258 0.0117 0.0272 0.0032 0.0452 0.0157 0.0300 0.0522 0.0068 0.0155 0.0137 0.0185 0.0265 0.0288 0.0210 0.0120 0.0393 0.0080 0.0083 0.0155 0.0125 0.0160 0.0113 0.0230 0.0167 0.0102 0.0432 0.0115 0.0095 0.0150 0.0197 0.0153]';
data.WtdWt_f5 = [... % total wet weight (g), growth (g total wet weight per day,including shell) 
Wt5 dWtdt5
];
units.WtdWt_f5   = {'g', 'g/d'};  label.WtdWt_f5 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f5   = C2K(18);  units.temp.WtdWt_f5 = 'K'; label.temp.WtdWt_f5 = 'temperature';
bibkey.WtdWt_f5 = 'ChenRagg2020'; comment.WtdWt_f5 = 'Treatment 5'; 
%
% total wet weight-change in total wet weight:  WtdWt (treatment 5, EXPERIMENT 2)
Wt5 = [16.63 25.89 26.73 22.30 21.94 22.66 21.67 19.08 14.80 18.64 22.57 21.82 15.80 23.22 21.93 16.92 18.99 22.04 21.11 17.81 21.17 26.12 21.15 21.16 21.19 21.81 29.76 22.76 19.95 16.76 36.59 25.15 31.37 22.06 24.59 24.13 17.48 31.37 32.42 18.04 27.80 28.77 24.25 22.80 25.42 23.42 20.15 15.76 19.20 25.80 22.90 16.33 24.30 23.75 20.43 20.39 24.40 22.07 18.65 23.83 29.85 22.20 22.82 23.00 23.64 32.83 24.30 21.44 18.06 40.38 27.21 33.55 25.26 26.00 25.30 18.05 32.83 34.57]';
dWtdt5 = [0.0201 0.0273 0.0291 0.0279 0.0123 0.0394 0.0250 0.0153 0.0137 0.0080 0.0461 0.0154 0.0076 0.0154 0.0260 0.0501 0.0200 0.0337 0.0137 0.0120 0.0380 0.0533 0.0150 0.0237 0.0259 0.0261 0.0439 0.0220 0.0213 0.0186 0.0541 0.0294 0.0311 0.0457 0.0201 0.0167 0.0081 0.0209 0.0307 0.0179 0.0238 0.0165 0.0239 0.0219 0.0467 0.0347 0.0376 0.0059 0.0046 0.0577 0.0208 0.0020 0.0130 0.0078 0.0031 0.0250 0.0348 0.0143 0.0059 0.0483 0.0550 0.0256 0.0277 0.0190 0.0227 0.0125 0.0205 0.0071 0.0017 0.0025 0.0175 0.0226 0.0332 0.0188 0.0066 0.0019 0.0167 0.0144]';
data.WtdWt_f5_EXP2 = [... % total wet weight (g), growth (g total wet weight per day,including shell) 
Wt5 dWtdt5
];
units.WtdWt_f5_EXP2   = {'g', 'g/d'};  label.WtdWt_f5_EXP2 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f5_EXP2   = C2K(18);  units.temp.WtdWt_f5_EXP2 = 'K'; label.temp.WtdWt_f5_EXP2 = 'temperature';
bibkey.WtdWt_f5_EXP2 = 'ChenRagg2020'; comment.WtdWt_f5_EXP2 = 'Treatment 5'; 

% length-change in length: LdL (treatment 5, EXPERIMENT 1)
L5 = [61.00 64.00 74.00 63.00 61.00 72.00 70.00 60.00 63.00 65.00 63.00 62.00 59.00 56.00 70.00 65.00 59.00 70.00 58.00 63.00 65.00 66.00 69.00 72.00 70.00 63.00 61.00 66.00 71.00 69.00 71.00 77.00 63.00 72.00 70.00 66.00 72.00 65.00 67.00 64.00 67.00 77.00 65.00 62.00 75.00 70.00 64.00 69.00 66.00 67.00 64.00 61.00 57.00 73.00 67.00 61.00 70.00 60.00 65.00 67.00 69.00 71.00 75.00 71.00 65.00 62.00 68.00 74.00 72.00 74.00 79.00 65.00 74.00 71.00 66.00 74.00 67.00 69.00 65.14 68.11 78.60 67.40 64.54 78.38 64.38 72.35 66.39 69.31 64.64 63.32 58.56 74.56 68.23 63.09 71.83 61.97 65.96 68.88 70.75 71.73 77.37 72.74 64.66 63.95 70.01 75.47 73.85 77.56 80.91 65.77 75.29 71.92 67.37 75.02 69.67 70.43 66.89 68.39 80.19 68.68 65.49 79.55 65.60 73.17 66.88 71.22 64.94 64.28 59.17 75.70 68.73 64.47 73.69 63.13 67.72 69.85 71.50 73.63 78.40 73.49 65.19 65.14 71.27 76.10 75.75 78.87 82.38 66.94 77.30 73.01 68.83 76.30 71.31 71.86 68.00 69.03 80.89 69.27 66.28 80.80 66.59 74.25 67.35 72.38 65.78 65.11 60.16 76.99 69.18 65.01 74.13 69.02 70.84 72.49 74.07 79.90 73.86 65.33 65.79 71.35 76.85 76.95 79.77 82.70 67.32 78.16 73.51 69.11 76.60 71.89 72.62]';
dLdt5 = [0.0429  0.0429  0.0429  0.0286  0.0143  0.0429  0.0000  0.0571  0.0857  0.0143  0.0571  0.0286  0.0286  0.0143  0.0429  0.0286  0.0286  0.0000  0.0286  0.0286  0.0286  0.0429  0.0286  0.0429  0.0143  0.0286  0.0143  0.0286  0.0429  0.0429  0.0429  0.0286  0.0286  0.0286  0.0143  0.0000  0.0286  0.0286  0.0286  0.0154  0.0150  0.0216  0.0324  0.0343  0.0457  0.0036  0.0051  0.0453  0.0053  0.0312  0.0086  0.0314  0.0211  0.0211  0.0166  0.0282  0.0247  0.0266  0.0130  0.0254  0.0236  0.0099  0.0320  0.0235 -0.0046  0.0264  0.0272  0.0199  0.0250  0.0481  0.0258  0.0104  0.0174  0.0124  0.0185  0.0138  0.0361  0.0193  0.0389  0.0062  0.0353  0.0284  0.0211  0.0260  0.0271  0.0182  0.0109  0.0424  0.0067  0.0213  0.0136  0.0253  0.0111  0.0307  0.0413  0.0258  0.0391  0.0216  0.0167  0.0422  0.0229  0.0167  0.0118  0.0264  0.0280  0.0140  0.0422  0.0291  0.0327  0.0260  0.0447  0.0242  0.0324  0.0284  0.0364  0.0318  0.0241  0.0139  0.0152  0.0128  0.0172  0.0272  0.0215  0.0235  0.0102  0.0252  0.0183  0.0180  0.0215  0.0280  0.0098  0.0117  0.0096  0.0026  0.0283  0.0215  0.0215  0.0096  0.0326  0.0080  0.0030  0.0141  0.0017  0.0163  0.0261  0.0196  0.0070  0.0083  0.0187  0.0109  0.0061  0.0065  0.0126  0.0165  0.0148  0.0132  0.0172  0.0182  0.0082  0.0157  0.0083  0.0225 -0.0048  0.0425  0.0118  0.0332  0.0722  0.0075  0.0152  0.0068  0.0115  0.0235  0.0203  0.0325  0.0143  0.0232  0.0078  0.0168  0.0047  0.0228  0.0180  0.0072  0.0097  0.0157  0.0103  0.0253  0.0138  0.0048  0.0082  0.0173  0.0120]';
data.LdL_f5 = [... %length (mm diameter), growth in length(mm diameter per day)
L5/10 dLdt5/10    % convert mm to cm
];
units.LdL_f5   = {'cm', 'cm/d'};  label.LdL_f5 = {'diameter', 'change in diameter, exp1'};  
temp.LdL_f5   = C2K(18);  units.temp.LdL_f5 = 'K'; label.temp.LdL_f5 = 'temperature';
bibkey.LdL_f5 = 'ChenRagg2020'; comment.LdL_f5 = 'Treatment 5 (EXP1)'; 

% length-change in length: LdL (treatment 5, EXPERIMENT 2)
L5 = [61 69 69 66 64 66 64 60 56 63 66 65 58 67 67 62 61 65 62 62 63 70 61 63 63 64 71 66 64 60 77 67 72 63 79 67 67 60 74 76 63 71 71 68 67 70 66 62 58 64 68 67 58 68 68 64 63 67 63 62 65 73 63 64 65 66 72 67 66 62 79 68 73 66 69 68 62 75 74]';
dLdt5 = [0.0286  0.0286  0.0286  0.0286  0.0429  0.0571  0.0286  0.0286  0.0286  0.0143  0.0286  0.0286  0.0000  0.0143  0.0143  0.0286  0.0286  0.0286  0.0143  0.0000  0.0286  0.0429  0.0286  0.0143  0.0286  0.0286  0.0143  0.0143  0.0286  0.0286  0.0286  0.0143  0.0143  0.0429  0.0143  0.0286  0.0143  0.0286  0.0143 -0.0286  0.0178  0.0306  0.0278  0.0313  0.0224  0.0238  0.0384  0.0461  0.0041  0.0050  0.0797  0.0125  0.0182  0.0077  -0.0033  0.0017  0.0343  0.0381  0.0240 -0.0044  0.0539  0.0559  0.0178  0.0266  0.0078  0.0218  0.0180  0.0292 -0.0029  0.0014  0.0148  0.0159  0.0199  0.0329  0.0069  0.0169 -0.0006  0.0117  0.0197]';
data.LdL_f5_EXP2 = [... %length (mm diameter), growth in length(mm diameter per day)
L5/10 dLdt5/10   % convert mm to cm
];
units.LdL_f5_EXP2   = {'cm', 'cm/d'};  label.LdL_f5_EXP2 = {'diameter', 'change in diameter, exp2'};  
temp.LdL_f5_EXP2   = C2K(18);  units.temp.LdL_f5_EXP2 = 'K'; label.temp.LdL_f5_EXP2 = 'temperature';
bibkey.LdL_f5_EXP2 = 'ChenRagg2020'; comment.LdL_f5_EXP2 = 'Treatment 5 (EXP2)'; 


% flesh wet weight-ingestion rate (treatment 5)     
FleshW5=[4.61  6.70  6.97  6.15  5.94  7.92  6.34  6.03  4.85  7.66  5.73  3.24  7.65  5.10  4.18  6.45  6.13  4.82  4.78  7.78  9.40  6.44  7.04  7.50  5.87  7.15 5.54  4.34  4.06 10.01  5.98  9.57  6.93  5.96  7.53  4.44  7.61 10.31]';
%Length5=[ 64.37 72.93 72.81 70.22 68.86 71.38 69.07 65.64 64.28 73.66 67.75 59.18 68.57 67.74 64.13 65.88 69.40 64.39 61.69 68.18 76.13 64.51 66.21 65.56 67.61 73.51 68.75 65.80 62.09 80.02 69.02 74.39 68.53 69.50 69.00 61.95 75.91 75.30]';
JX5=[1089.5  783.9  786.6 1140.6  242.4 1389.9 1213.7  862.8  930.4 1265.3  965.5  666.8 1299.7  575.5 1011.8 1396.4 1033.5 1059.3 1423.5 1354.2 1256.8  872.2 182.1 1401.0 1069.8 1439.3 1243.9 1174.7 1413.8 1531.3 1905.6  483.2  866.5 1285.9 1240.4  855.1  919.7 1400.0]';
data.WwJX_f5 = [... %flesh wet weight (g), ingestion rate (J of prey per day) 
FleshW5 JX5
% FleshW5 JX5 * 260/1079   % 0.759 energie je neobjasnjivo; 260 J/day =poo + O2 + growth
];
units.WwJX_f5   = {'g', 'J/d'};  label.WwJX_f5 = {'wet flesh weight', 'algae consumption'};  
temp.WwJX_f5    = C2K(18);  units.temp.WwJX_f5 = 'K'; label.temp.WwJX_f5 = 'temperature';
bibkey.WwJX_f5 = 'ChenRagg2020'; comment.WwJX_f5 = 'Treatment 5'; 


% length-oxygen consumption
L5=[58.27 59.18 61.69 61.95 62.09 64.13 64.28 64.37 64.39 64.51 65.56 65.64 65.80 65.88 66.21 67.61 67.74 67.75 68.18 68.53 68.57 68.75 68.86 69.02 69.40 69.50 70.22 71.38 72.81 72.93 73.51 73.66 74.39 75.30 75.91 76.13 80.02]';
JO5=[ 3.310  4.257  7.962  7.567  5.330  6.773  4.370  2.158  6.683  9.273 11.534  6.784  7.516  8.036  9.049  3.835  6.453  5.461  7.088  2.521  5.444  5.970 6.764  8.919  6.625  8.717  8.581  8.295  6.402  3.086 10.029  9.971 13.688  5.898 10.826  8.045 12.186]';
data.LJO_f5 = [... % length (mm), O2 consumption (ug/min)
L5/10  JO5 % convert mm to cm
];
units.LJO_f5   = {'cm', 'mug/min'};  label.LJO_f5 = {'length', 'O_2 consumption'};  
temp.LJO_f5    = C2K(18);  units.temp.LJO_f5 = 'K'; label.temp.LJO_f5 = 'temperature';
bibkey.LJO_f5 = 'ChenRagg2020';  comment.LJO_f5 = 'Treatment 5'; 

%%   TREATMENT 4

% length-total wet weight (treatment 4): (treatment 4, EXPERIMENT1)
L4 = [64.00 64.00 64.35 64.47 64.43 62.00 63.00 63.72 63.84 63.74 64.00 65.00 65.31 65.76 65.91 66.08 63.00 65.00 65.85 66.30 66.30 66.44 67.00 67.00 68.88 69.25 69.39 69.15 60.00 59.00 60.08 60.22 59.85 61.00 62.00 62.08 62.27 62.34 62.00 63.00 63.31 63.60 64.00 63.50 63.00 65.00 65.07 65.39 65.53 65.63 55.00 57.00 57.29 58.24 58.82 59.08 59.00 60.00 60.64 60.78 60.81 60.43 64.00 64.00 65.01 65.46 65.53 65.52 64.00 65.00 65.21 65.43 64.00 65.00 65.76 66.17 66.18 66.55 57.00 57.00 57.77 61.00 63.00 62.72 62.58 62.86 62.73 65.00 66.00 65.87 66.33 66.41 66.65 63.00 64.00 63.81 70.00 70.00 70.52 70.63 70.71 70.61 61.00 62.00 62.71 62.72 62.70 62.90 70.00 71.00 71.82 72.38 72.82 72.96 63.00 65.00 66.17 67.16 67.76 68.46 66.00 67.00 68.92 69.86 70.65 70.98 69.00 70.00 71.40 71.89 72.35 72.61 67.00 68.00 68.36 68.53 69.08 69.42 63.00 63.00 63.99 64.05 64.15 64.18 64.00 65.00 67.34 67.70 68.43 68.79 61.00 62.00 62.63 62.57 67.00 69.00 69.52 69.66 69.76 69.59 70.00 72.00 71.32 72.34 72.30 72.34 75.00 76.00 76.09 76.37 76.48 76.53 74.00 76.00 77.71 77.36 77.87 78.04 74.00 75.00 76.74 77.38 77.60 77.71 72.00 71.00 72.64 72.91 72.64 72.00 72.00 72.62 72.73 72.77 69.00 71.00 70.72 70.78 70.60 70.84 68.00 70.00 69.65 69.56 63.00 64.00 64.47 64.56 64.40 64.58 64.00 65.00 65.04 65.36 65.37 65.31 69.00 70.00 70.32 71.08 71.07]';
W4 = [20.64 21.50 22.16 22.48 22.27 18.93 19.65 19.96 19.83 19.94 21.04 21.27 21.85 22.06 22.32 22.44 21.39 22.04 23.17 23.18 23.27 23.41 24.48 25.25 26.00 26.13 26.35 26.38 15.63 15.76 16.09 16.04 16.17 17.62 17.36 18.19 18.10 18.29 18.89 19.50 20.12 20.24 20.69 20.71 21.63 22.68 23.25 23.23 23.54 23.64 14.22 15.00 15.79 16.32 17.04 17.09 17.68 18.10 18.70 18.67 18.96 19.04 21.17 22.02 22.77 22.84 23.08 23.04 19.85 20.45 20.52 20.38 19.54 20.76 21.67 21.89 22.30 22.29 14.72 15.05 15.30 19.54 20.19 20.34 20.17 20.23 20.41 23.22 23.60 23.96 23.91 24.07 24.38 20.24 21.22 21.58 27.35 28.10 28.51 28.15 28.48 28.32 20.57 21.10 21.37 21.39 21.59 21.65 26.65 27.69 29.00 29.60 30.14 30.45 20.62 22.03 23.58 24.16 25.15 25.60 24.08 25.20 27.18 28.34 29.44 29.82 27.00 28.63 30.03 30.31 30.85 31.00 23.74 24.67 25.37 25.47 25.99 26.21 18.82 19.60 20.28 20.08 20.25 20.29 20.46 22.50 24.07 24.11 24.91 24.95 18.66 19.72 20.10 20.02 23.42 24.45 25.00 24.81 25.01 25.13 26.56 27.62 28.45 28.33 28.44 28.69 37.41 38.80 38.87 39.00 39.16 39.26 34.61 36.61 38.60 38.43 39.26 39.19 34.17 36.00 38.22 38.69 39.18 39.38 33.62 34.70 34.70 34.39 34.67 32.97 33.30 33.46 33.73 34.13 26.57 27.60 27.65 27.51 27.69 27.87 26.77 27.60 27.83 27.82 20.90 22.03 22.09 22.39 22.60 22.49 22.30 22.97 23.45 23.12 23.55 23.66 26.70 27.50 28.13 28.11 28.58]';
data.LWt_f4 = [ ... % length (mm),  total wet weight (g)
L4/10   W4 % convert mm to cm
];
data.LWt_f4(:,2) = data.LWt_f4(:,2); % total weight (including shell) 
units.LWt_f4   = {'cm', 'g'};  label.LWt_f4 = {'length', 'total wet weight, exp1'};  
bibkey.LWt_f4 = 'ChenRagg2020'; comment.LWt_f4 = 'Treatment 4'; 

% Length-ashfree dry weight (treatment 4, EXPERIMENT2)
L_f4=[67.27 67.12 59.67 64.82 64.69 64.91 72.75 61.81 58.02 71.07 70.84 62.90 68.18 66.90 70.42 74.44 59.15 66.08 66.14 66.04 63.26 70.38 65.56 66.65 71.97 73.60 71.30 64.92 70.66 66.36 66.92 70.92 76.05 74.00 69.66 72.49 65.34 75.73 70.83]';
AFDWFleshW4=[0.468 0.588 0.230 0.620 0.415 0.462 1.107 0.492 0.492 0.760 0.689 0.656 0.485 0.556 1.020 0.639 0.476 0.629 0.684 0.651 1.026 0.484 0.841 0.858 1.231 0.795 0.571 0.639 0.661 0.561 0.904 1.118 0.814 1.125 0.435 1.247 0.856 0.840 0.441]';

data.LWafd_f4_E2 = [ ... % length (mm),  afd flesh weight (g)
L_f4/10  AFDWFleshW4 % convert mm to cm
];
units.LWafd_f4_E2   = {'cm', 'g'};  label.LWafd_f4_E2 = {'length', 'ash-free dry flesh weight, exp2'};  
bibkey.LWafd_f4_E2 = 'ChenRagg2020'; comment.LWafd_f4_E2 = 'Treatment 4'; 

% L-Wt-Ww-Wd (treatment 4)
Wt_f4 = [24.32 24.62 16.36 20.48 20.94 21.47 29.75 19.06 15.79 25.72 25.87 20.38 23.62 25.84 26.70 32.44 16.25 23.48 22.68 23.60 19.97 27.32 22.55 24.27 30.50 29.65 26.20 21.54 26.38 22.48 28.42 28.98 37.89 37.01 26.14 32.03 24.80 31.50 27.02]';
Ww_f4 = [4.28 4.56 2.41 4.50 3.58 3.77 7.16 2.60 3.40 5.54 5.10 4.58 4.48 4.71 6.58 6.29 3.34 4.45 5.10 5.59 5.35 4.62 5.26 5.16 7.37 5.22 4.98 4.55 5.48 4.44 6.20 7.38 8.37 7.47 4.42 8.22 5.66 6.05 5.22]';
Wd_f4 = [0.567 0.699 0.300 0.729 0.460 0.558 1.276 0.587 0.572 0.895 0.816 0.768 0.603 0.663 1.175 0.785 0.336 0.739 0.825 0.755 1.141 0.596 0.967 0.974 1.398 0.797 0.694 0.756 0.793 0.671 1.058 1.296 1.007 1.308 0.556 1.438 0.994 0.986 0.568]';

data.LWt_f4_E2 = [ ... % length (mm),  total wet weight (g)
L_f4/10  Wt_f4 % convert mm to cm
];
units.LWt_f4_E2   = {'cm', 'g'};  label.LWt_f4_E2 = {'length', 'total wet weight, exp2'};  
bibkey.LWt_f4_E2 = 'ChenRagg2020'; comment.LWt_f4_E2 = 'Treatment 4'; 

data.LWw_f4_E2 = [ ... % length (mm),  wet flesh weight (g)
L_f4/10  Ww_f4 % convert mm to cm
];
units.LWw_f4_E2   = {'cm', 'g'};  label.LWw_f4_E2 = {'length', 'wet flesh weight, exp2'};  
bibkey.LWw_f4_E2 = 'ChenRagg2020'; comment.LWw_f4_E2 = 'Treatment 4'; 

data.LWd_f4_E2 = [ ... % length (mm),  dry flesh weight (g)
L_f4/10  Wd_f4
];
units.LWd_f4_E2   = {'cm', 'g'};  label.LWd_f4_E2 = {'length', 'dry flesh weight, exp2'};  
bibkey.LWd_f4_E2 = 'ChenRagg2020'; comment.LWd_f4_E2 = 'Treatment 4'; 

% length-energy
L_f4e = [67.27 67.12 59.67 64.82 64.69 64.91 72.75 61.81 58.02 71.07 70.84 62.90 68.18 66.90 74.44 59.15 66.08 66.14 66.04 63.26 70.38 65.56 66.65 71.97 73.60 71.30 64.92 70.66 66.36 66.92 70.92 76.05 74.00 69.66 72.49 65.34 75.73 70.83]';
En_f4 = [10.01 12.11  4.48 12.89  7.55  9.53 23.79 10.19 10.23 15.90 14.80 12.99 10.15 11.90 12.96  5.53 13.39 14.73 13.42 20.32 10.11 18.29 18.67 26.69 14.15 11.72 13.45 13.91 11.12 18.40 24.87 17.69 26.23  9.36 24.90 18.19 17.99  9.16]';
%
data.LEn_f4_E2 = [L_f4e/10 En_f4*1e3]; %length (cm), energy (J/mussel)
units.LEn_f4_E2 = {'cm', 'J'}; label.LEn_f4_E2 = {'length', 'energy per mussel'}; 
bibkey.LEn_f4_E2 = 'ChenRagg2020';

% time-length (treatment 4, EXPERIMENT1)
data.tL_f4= [ ... % time (days), length (cm)
792 862 936 981 1027 1087
65.57 66.75 67.45 67.81 68.03 68.13]';
data.tL_f4(:,1) = data.tL_f4(:,1) -  data.tL_f4(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
data.tL_f4(:,2) = data.tL_f4(:,2) * 0.1;              % convert mm to cm
units.tL_f4= {'d', 'cm'};     label.tL_f4= {'time', 'length'}; 
  temp.tL_f4= C2K(18);  units.temp.tL_f4= 'K'; label.temp.tL_f4= 'temperature';
  L0.tL_f4 = data.tL_f4(1,2);  units.L0.tL_f4 = 'cm'; label.L0.tL_f4 = 'initial length';
  bibkey.tL_f4= 'ChenRagg2020'; comment.tL_f4= 'Treatment 5; mean of (complete) growth curves (6 time points) ';

% time-wet weight (treatment 4, EXPERIMENT1)
data.tWt_f4= [ ... % time (days), total wet weight (g)
792 862 936 981 1027 1087
23.50 24.50 25.33 25.45 25.84 25.96]';
data.tWt_f4(:,1) = data.tWt_f4(:,1) -  data.tWt_f4(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
units.tWt_f4= {'d', 'g'};     label.tWt_f4= {'time', 'total wet weight, exp1'}; 
  temp.tWt_f4= C2K(18);  units.temp.tWt_f4= 'K'; label.temp.tWt_f4= 'temperature';
  bibkey.tWt_f4= 'ChenRagg2020'; comment.tWt_f4= 'Treatment 4; mean of (complete) growth curves (6 time points) ';

% total wet weight- change in total wet weight:  WtdWt (treatment 4, EXPERIMENT1)
Wt4 = [20.64 18.93 21.04 21.39 24.48 15.63 17.62 18.89 21.63 14.22 17.68 21.17 19.85 19.54 14.72 19.54 23.22 20.24 27.35 20.57 26.65 20.62 24.08 27.00 23.74 18.82 20.46 18.66 23.42 26.56 37.41 34.61 34.17 33.62 32.97 26.57 26.77 20.90 22.30 26.70 21.50 19.65 21.27 22.04 25.25 15.76 17.36 19.50 22.68 15.00 18.10 22.02 20.45 20.76 15.05 20.19 23.60 21.22 28.10 21.10 27.69 22.03 25.20 28.63 24.67 19.60 22.50 19.72 24.45 27.62 38.80 36.61 36.00 34.70 33.30 27.60 27.60 22.03 22.97 27.50 22.16 19.96 21.85 23.17 26.00 16.09 18.19 20.12 23.25 15.79 18.70 22.77 20.52 21.67 20.34 23.96 28.51 21.37 29.00 23.58 27.18 30.03 25.37 20.28 24.07 20.10 25.00 28.45 38.87 38.60 38.22 34.70 33.46 27.65 27.83 22.09 23.45 28.13 22.48 19.83 22.06 23.18 26.13 16.04 18.10 20.24 23.23 16.32 18.67 22.84 21.89 20.17 23.91 28.15 21.39 29.60 24.16 28.34 30.31 25.47 20.08 24.11 24.81 28.33 39.00 38.43 38.69 34.39 33.73 27.51 22.39 23.12 28.11 22.32 23.27 26.35 20.69 23.54 17.04 18.96 23.08 22.30 20.23 24.07 28.48 21.59 30.14 25.15 29.44 30.85 25.99 20.25 24.91 25.01 28.44 39.16 39.26 39.18 27.69 22.60 23.55]';
dWtdt4 = [0.0123  0.0103  0.0033  0.0093  0.0110  0.0019 -0.0037  0.0087  0.0150  0.0111  0.0060  0.0121  0.0086  0.0174  0.0047  0.0093  0.0054  0.0140  0.0107 0.0076  0.0149  0.0201  0.0160  0.0233  0.0133  0.0111  0.0291  0.0151  0.0147  0.0151  0.0199  0.0286  0.0261  0.0154  0.0047  0.0147  0.0119  0.0161 0.0096  0.0114  0.0089  0.0042  0.0078  0.0153  0.0101  0.0045  0.0112  0.0084  0.0077  0.0107  0.0081  0.0101  0.0009  0.0123  0.0034  0.0020  0.0049 0.0049  0.0055  0.0036  0.0177  0.0209  0.0268  0.0189  0.0095  0.0092  0.0212  0.0051  0.0074  0.0112  0.0009  0.0269  0.0300  0.0000  0.0022  0.0007 0.0031  0.0008  0.0065  0.0085  0.0071 -0.0029  0.0047  0.0002  0.0029 -0.0011 -0.0020  0.0027 -0.0004  0.0118 -0.0007  0.0016 -0.0031  0.0049 -0.0038 -0.0011 -0.0080  0.0004  0.0133  0.0129  0.0258  0.0062  0.0022 -0.0044  0.0009 -0.0018 -0.0042 -0.0027  0.0029 -0.0038  0.0104 -0.0069  0.0060 -0.0031 -0.0002  0.0067 -0.0073 -0.0004 -0.0046  0.0024  0.0057  0.0020  0.0048  0.0028  0.0041  0.0098  0.0067  0.0157  0.0063  0.0052  0.0089  0.0013  0.0035 0.0072  0.0043  0.0117  0.0215  0.0239  0.0117  0.0113  0.0037  0.0174  0.0043  0.0024  0.0035  0.0180  0.0107  0.0061  0.0087  0.0039  0.0046  0.0093 0.0102  0.0020  0.0023  0.0005  0.0003  0.0017  0.0008  0.0013 -0.0007 -0.0002  0.0030  0.0052 -0.0027  0.0010  0.0052  0.0075  0.0063  0.0025  0.0037 0.0007  0.0007  0.0020  0.0042  0.0017 -0.0012  0.0033  0.0030 -0.0018  0.0018]';
data.WtdWt_f4 = [... % total wet weight (g), growth (g total wet weight per day) 
Wt4 dWtdt4
];
% data.WdW_f4 = data.WdW_f4 * 0.2163; % total weight (including shell) to wet flesh weight
units.WtdWt_f4   = {'g', 'g/d'};  label.WtdWt_f4 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f4   = C2K(18);  units.temp.WtdWt_f4 = 'K'; label.temp.WtdWt_f4 = 'temperature';
bibkey.WtdWt_f4 = 'ChenRagg2020'; comment.WtdWt_f4 = 'Treatment 4'; 

% total wet weight- change in total wet weight:  WtdWt (treatment 4, EXPERIMENT 2)
Wt4 = [23.56 23.58 16.18 19.67 20.55 20.41 26.29 18.14 15.09 24.81 24.70 19.54 23.29 23.76 25.69 32.47 15.83 22.45 21.96 21.58 18.46 26.72 21.85 23.56 27.98 28.06 25.59 20.22 23.96 21.44 26.62 27.02 37.72 35.22 35.09 25.72 29.08 23.69 30.84 26.81 24.22 24.30 16.40 20.10 21.00 21.36 28.56 18.43 15.60 25.30 25.60 18.53 21.87 25.15 26.30 32.68 16.30 23.20 22.87 23.12 19.20 27.27 22.30 24.19 29.50 29.03 26.25 21.30 25.90 22.30 28.22 29.25 39.74 37.37 36.60 26.20 31.07 24.78 31.44 27.08]';
dWtdt4 = [0.0094  0.0103  0.0031  0.0061  0.0064  0.0136  0.0324  0.0041  0.0073  0.0070  0.0129 -0.0144 -0.0203  0.0199  0.0087  0.0030  0.0067  0.0107  0.0130  0.0220  0.0106  0.0079  0.0064  0.0090  0.0217  0.0139  0.0094  0.0154  0.0277  0.0123  0.0229  0.0319  0.0289  0.0307  0.0216  0.0069  0.0284  0.0156  0.0086  0.0039  0.0012  0.0051 -0.0006  0.0047 -0.0010  0.0014  0.0186  0.0080  0.0034  0.0072  0.0039  0.0220  0.0222  0.0097  0.0068 -0.0028 -0.0007  0.0036 -0.0029  0.0086  0.0110  0.0006  0.0032  0.0011  0.0139  0.0079 -0.0008  0.0035  0.0057  0.0031  0.0030 -0.0042  0.0191  0.0063  0.0065 -0.0010  0.0137  0.0003  0.0008 -0.0008]';
data.WtdWt_f4_EXP2 = [... % total wet weight (g), growth (g total wet weight per day,including shell) 
Wt4 dWtdt4
];
units.WtdWt_f4_EXP2   = {'g', 'g/d'};  label.WtdWt_f4_EXP2 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f4_EXP2   = C2K(18);  units.temp.WtdWt_f4_EXP2 = 'K'; label.temp.WtdWt_f4_EXP2 = 'temperature';
bibkey.WtdWt_f4_EXP2 = 'ChenRagg2020'; comment.WtdWt_f4_EXP2 = 'Treatment 4'; 



% length-change in length (treatment 4, EXPERIMENT1)
L4 = [64.00 62.00 64.00 63.00 67.00 60.00 61.00 62.00 63.00 55.00 59.00 64.00 64.00 64.00 57.00 61.00 65.00 63.00 70.00 61.00 70.00 63.00 66.00 69.00 67.00 63.00 64.00 61.00 67.00 70.00 75.00 74.00 74.00 72.00 72.00 69.00 68.00 63.00 64.00 69.00 64.00 63.00 65.00 65.00 67.00 59.00 62.00 63.00 65.00 57.00 60.00 64.00 65.00 65.00 57.00 63.00 66.00 64.00 70.00 62.00 71.00 65.00 67.00 70.00 68.00 63.00 65.00 62.00 69.00 72.00 76.00 76.00 75.00 71.00 72.00 71.00 70.00 64.00 65.00 70.00 64.35 63.72 65.31 65.85 68.88 60.08 62.08 63.31 65.07 57.29 60.64 65.01 65.21 65.76 62.72 65.87 70.52 62.71 71.82 66.17 68.92 71.40 68.36 63.99 67.34 62.63 69.52 71.32 76.09 77.71 76.74 72.64 72.62 70.72 69.65 64.47 65.04 70.32 64.47 63.84 65.76 66.30 69.25 60.22 62.27 63.60 65.39 58.24 60.78 65.46 66.17 62.58 66.33 70.63 62.72 72.38 67.16 69.86 71.89 68.53 64.05 67.70 69.66 72.34 76.37 77.36 77.38 72.91 72.73 70.78 64.56 65.36 71.08 65.91 66.30 69.39 64.00 65.53 58.82 60.81 65.53 66.18 62.86 66.41 70.71 62.70 72.82 67.76 70.65 72.35 69.08 64.15 68.43 69.76 72.30 76.48 77.87 77.60 70.60 64.40 65.37]';
dLdt4 = [0.0000  0.0143  0.0143  0.0286  0.0000 -0.0143  0.0143  0.0143  0.0286  0.0286  0.0143  0.0000  0.0143  0.0143  0.0000  0.0286  0.0143  0.0143  0.0000  0.0143  0.0143  0.0286  0.0143  0.0143  0.0143  0.0000  0.0143  0.0143  0.0286  0.0286  0.0143  0.0286  0.0143 -0.0143  0.0000  0.0286  0.0286  0.0143  0.0143  0.0143  0.0047  0.0097  0.0042  0.0115  0.0254  0.0146  0.0011  0.0042  0.0009  0.0039  0.0086  0.0136  0.0028  0.0103  0.0104 -0.0038 -0.0018 -0.0026  0.0070  0.0096  0.0111  0.0158  0.0259  0.0189  0.0049  0.0134  0.0316  0.0085  0.0070 -0.0092  0.0012  0.0231  0.0235  0.0222  0.0084 -0.0038 -0.0047  0.0064  0.0005  0.0043  0.0027  0.0027  0.0100  0.0100  0.0082  0.0031  0.0042  0.0064  0.0071  0.0211  0.0031  0.0100  0.0049  0.0091 -0.0031  0.0102  0.0024  0.0002  0.0124  0.0220  0.0209  0.0109  0.0038  0.0013  0.0080 -0.0013  0.0031  0.0227  0.0062 -0.0078  0.0142  0.0060  0.0024  0.0013 -0.0020  0.0020  0.0071  0.0169 -0.0009 -0.0022  0.0033  0.0000  0.0030 -0.0080  0.0015  0.0087  0.0030  0.0126  0.0007  0.0015  0.0002  0.0061  0.0017  0.0017 -0.0004  0.0096  0.0130  0.0172  0.0100  0.0120  0.0022  0.0159  0.0022 -0.0009  0.0024  0.0111  0.0048 -0.0059  0.0009 -0.0039 -0.0035  0.0002 -0.0002  0.0028  0.0023 -0.0040 -0.0083  0.0017  0.0043 -0.0063 -0.0002  0.0062 -0.0022  0.0040 -0.0017  0.0033  0.0023  0.0117  0.0055  0.0043  0.0057  0.0005  0.0060 -0.0028  0.0007  0.0008  0.0028  0.0018  0.0040  0.0030 -0.0010]';
data.LdL_f4 = [... %length (mm diameter), growth in length(mm diameter per day)
L4/10 dLdt4/10   % convert mm to cm
];
units.LdL_f4   = {'cm', 'cm/d'};  label.LdL_f4 = {'diameter', 'change in diameter, exp1'};  
temp.LdL_f4   = C2K(18);  units.temp.LdL_f4 = 'K'; label.temp.LdL_f4 = 'temperature';
bibkey.LdL_f4 = 'ChenRagg2020'; comment.LdL_f4 = 'Treatment 4 (EXP1)'; 

% length-change in length: (treatment 4, EXPERIMENT2)
L4 = [66 65 59 63 64 64 70 61 56 70 70 62 68 66 69 74 58 65 65 64 62 69 65 66 70 72 69 63 67 66 66 69 77 74 73 69 70 64 74 69 66 67 59 64 64 64 71 61 57 71 70 61 69 67 70 75 59 66 66 65 62 70 65 66 71 73 71 64 70 66 67 70 79 75 73 70 72 65 76 71]';
dLdt4 = [0.0000  0.0286  0.0000  0.0143  0.0000  0.0000  0.0143  0.0000  0.0143  0.0143  0.0000 -0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143 0.0143  0.0143  0.0000  0.0143  0.0000  0.0000  0.0143  0.0143  0.0286  0.0143  0.0429  0.0000  0.0143  0.0143  0.0286  0.0143  0.0000  0.0143  0.0286  0.0143  0.0286  0.0286  0.0153  0.0019  0.0105  0.0102  0.0115  0.0117  0.0273  0.0103  0.0182  0.0012  0.0122  0.0226 -0.0104 -0.0014  0.0071 -0.0066  0.0020  0.0010  0.0022  0.0186  0.0180  0.0045  0.0073  0.0090  0.0135  0.0077  0.0051  0.0133  0.0079  0.0062 -0.0012  0.0142  0.0086  0.0127  0.0159 -0.0057  0.0070  0.0052 -0.0038 -0.0023]';
data.LdL_f4_EXP2 = [... %length (mm diameter), growth in length(mm diameter per day)
L4/10 dLdt4/10    % convert mm to cm
];
units.LdL_f4_EXP2   = {'cm', 'cm/d'};  label.LdL_f4_EXP2 = {'diameter', 'change in diameter, exp2'};  
temp.LdL_f4_EXP2   = C2K(18);  units.temp.LdL_f4_EXP2 = 'K'; label.temp.LdL_f4_EXP2 = 'temperature';
bibkey.LdL_f4_EXP2 = 'ChenRagg2020'; comment.LdL_f4_EXP2 = 'Treatment 4 (EXP2)'; 

% flesh wet weight - ingestion rate: WwJx (treatment 4) 
FleshW4=[4.28 4.56 2.41 4.50 3.58 3.77 7.16 2.60 3.40 5.54 5.10 4.58 4.48 4.71 6.58 6.29 3.34 4.45 5.10 5.59 4.62 5.26 5.16 7.37 5.22 4.98 4.55 5.48 4.44 6.20 7.38 8.37 7.47 4.42 8.22 5.66 6.05 5.22]';
%Length4=[67.27 67.12 59.67 64.82 64.69 64.91 72.75 61.81 58.02 71.07 70.84 62.90 68.18 66.90 70.42 74.44 59.15 66.08 66.14 66.04 70.38 65.56 66.65 71.97 73.60 71.30 64.92 70.66 66.36 66.92 70.92 76.05 74.00 69.66 72.49 65.34 75.73 70.83]'; % (length data corresponds to the same time-point as Ww-JX data) 
JX4=[279.5 234.8 677.4 252.2 225.1 110.4 553.9 205.9 202.0 340.8 572.5 413.5 272.1 308.8 276.7 270.6 181.9 247.2 549.0 292.6 329.0 228.6 280.1 455.1  77.9 309.6 329.2 486.7 400.9 304.9 327.4 274.2 214.7 280.4 168.9 275.8 377.4 297.8]';
data.WwJX_f4 = [... %wet flesh weight (g), ingestion rate (J of prey per day) 
FleshW4 JX4
];
units.WwJX_f4   = {'g', 'J/d'};  label.WwJX_f4 = {'wet flesh weight', 'algae consumption'};  
temp.WwJX_f4    = C2K(18);  units.temp.WwJX_f4 = 'K'; label.temp.WwJX_f4 = 'temperature';
bibkey.WwJX_f4 = 'NIWA'; comment.WwJX_f4 = 'Treatment 4'; 

% wet weight-oxygen consumption (treatment 4)
L4=[ 58.02 59.15 59.67 61.81 62.90 63.26 64.82 64.91 64.92 65.34 66.14 66.36 66.65 66.90 66.92 67.12 67.27 68.18 69.66 70.38 70.42 70.66 70.83 70.84 70.92 71.07 71.30 71.97 72.49 72.75 73.60 74.00 74.44 75.73 76.05]';
JO4=[3.615  1.290  4.500  3.825  5.067 19.114  6.049  4.644  6.081  4.674  5.985  4.182  4.469  6.946  3.844  6.976  4.064  5.607  4.590  5.074  5.176  6.704 2.945  9.750  6.309  4.233  4.804  6.598 13.102  8.300  7.121  6.207  6.311  7.057  6.521]';
data.LJO_f4 = [... % length (mm), O2 consumption (ug/min)
L4/10 JO4 % convert mm to cm
];
units.LJO_f4   = {'cm', 'mug/min'};  label.LJO_f4 = {'length', 'O_2 consumption'};  
temp.LJO_f4    = C2K(18);  units.temp.LJO_f4 = 'K'; label.temp.LJO_f4 = 'temperature';
bibkey.LJO_f4 = 'ChenRagg2020';  comment.LJO_f4 = 'Treatment 4'; 

%% TREATMENT 3

% length-total wet weight (treatment 3): (treatment 3, EXPERIMENT1)
L3=[61.00 61.00 61.43 61.51 61.30 71.00 67.00 70.95 71.01 71.19 70.69 69.00 70.00 69.97 70.10 70.11 58.00 59.00 59.80 59.76 60.07 60.07 61.00 61.00 60.92 61.15 60.99 64.00 64.00 63.74 62.00 64.00 64.54 64.77 64.95 65.12 60.00 61.00 61.42 61.38 61.42 61.49 56.00 57.00 57.42 57.70 57.83 57.65 59.00 59.00 59.62 61.00 62.00 61.96 62.00 62.16 62.19 61.00 62.00 62.26 62.82 63.18 63.03 61.00 62.00 62.10 62.13 62.30 61.00 63.00 63.31 63.76 63.92 63.87 65.00 66.00 66.44 67.05 67.20 67.13 70.00 70.00 70.29 60.00 60.00 60.77 60.65 60.99 61.04 65.00 66.00 65.91 65.97 66.28 66.39 60.00 60.00 60.15 63.00 64.00 64.13 64.30 64.49 64.24 71.00 72.00 71.93 72.47 72.80 73.16 66.00 67.00 67.28 67.41 67.50 67.24 69.00 69.00 69.40 69.46 69.55 69.21 67.00 68.00 68.62 68.74 68.76 69.03 59.00 62.00 63.23 65.94 66.69 63.00 63.00 62.62 62.84 62.82 70.00 72.00 71.73 71.88 71.90 63.00 64.00 64.59 64.86 65.01 65.02 63.00 64.00 64.50 64.28 64.67 64.66 65.00 66.00 66.72 66.78 66.80 72.00 74.00 74.06 74.59 75.06 75.12 66.00 67.00 67.13 67.35 67.58 67.82 68.00 70.00 70.40 70.66 70.75 68.00 69.00 69.17 69.19 69.30 69.00 70.00 69.92 69.81 60.00 56.00 59.99 66.00 62.00 66.70 66.69 61.00 62.00 62.47 62.69 62.71 62.66 68.00 68.06 68.10 68.08 67.61]';
Wt3=[18.19 18.20 18.54 18.40 18.58 28.22 28.44 29.03 29.14 29.31 29.34 26.95 27.40 27.64 27.53 27.82 17.21 17.29 17.66 17.61 17.75 17.80 19.82 20.45 20.79 20.75 20.90 19.48 19.83 20.03 20.01 20.80 21.53 21.50 21.88 21.94 16.18 16.58 17.01 16.92 17.02 17.02 15.17 15.60 16.14 16.08 16.26 16.15 14.90 15.40 14.08 18.20 19.11 19.39 19.38 19.54 19.72 16.32 17.11 17.72 18.07 18.24 18.44 17.39 17.93 18.12 18.07 18.20 18.35 18.87 19.93 19.67 19.97 19.99 22.66 23.46 24.00 24.19 24.37 24.50 28.02 28.58 28.98 18.44 18.95 19.35 19.19 19.38 19.46 20.99 21.82 22.05 22.05 22.21 22.36 20.64 21.35 21.73 21.14 22.10 22.47 22.47 22.77 22.81 28.55 29.40 30.22 30.31 31.11 31.04 24.06 25.35 25.93 25.75 26.05 26.04 25.33 26.21 26.62 26.39 26.67 26.74 23.94 25.07 25.87 25.94 26.17 26.41 17.72 19.44 21.65 24.19 25.16 20.44 20.70 20.72 20.64 20.79 24.85 25.90 26.47 26.61 26.63 20.82 21.71 22.23 22.21 22.24 22.40 20.69 21.69 22.13 22.07 22.40 18.81 23.84 24.45 25.09 25.01 25.67 31.86 33.74 34.74 34.97 35.40 35.60 23.14 23.80 24.75 24.81 24.98 25.27 27.59 29.09 29.75 29.68 29.96 25.09 25.75 26.10 25.92 26.08 27.98 29.10 29.33 29.25 18.60 18.85 19.02 23.80 24.15 24.51 24.43 18.30 18.98 19.53 19.55 19.62 19.62 24.07 24.28 23.50 23.95 24.72]';
data.LWt_f3 = [ ... % length (mm), total wet weight (including shell) (g)
L3/10  Wt3  % convert mm to cm
]; 
units.LWt_f3   = {'cm', 'g'};  label.LWt_f3 = {'length', 'total wet weight, exp1'};  
bibkey.LWt_f3 = 'ChenRagg2020'; comment.LWt_f3 = 'Treatment 3'; 

% length-ash free dry flesh weight (treatment 3, EXPERIMENT2)
L_f3=[70.40 64.05 67.64 65.91 67.74 62.44 62.13 74.69 63.53 61.80 58.58 58.74 69.64 66.45 62.82 63.60 68.38 66.63 65.41 67.42 68.04 66.54 68.11 64.72 65.52 67.13 61.55 65.14 62.43 79.09 65.14 70.19 71.67 80.11 67.22 70.56 68.70 73.83 72.58]';
AFDWFleshW3=[0.856 0.704 0.533 0.582 0.603 0.398 0.416 1.171 0.763 0.817 0.218 0.410 0.790 0.524 0.511 0.412 0.736 0.674 0.507 1.069 0.998 0.645 0.868 0.913 0.761 0.592 0.412 0.284 0.332 1.145 0.790 0.925 0.877 1.172 0.359 0.508 0.763 0.897 0.985]';

data.LWafd_f3_E2 = [ ... % length (mm),  afd flesh weight (g)
L_f3/10  AFDWFleshW3 
];
units.LWafd_f3_E2   = {'cm', 'g'};  label.LWafd_f3_E2 = {'length', 'ash-free dry flesh weight, exp2'};  
bibkey.LWafd_f3_E2 = 'ChenRagg2020'; comment.LWafd_f3_E2 = 'Treatment 3'; 


% L-Wt-Ww-Wd (treatment 3)
Wt_f3 = [25.95 21.83 24.06 22.32 23.86 18.13 17.39 30.19 19.22 18.64 16.68 16.25 26.20 23.15 21.10 22.06 25.12 23.69 21.68 25.46 25.35 23.88 26.35 21.41 22.19 22.25 19.36 22.17 19.18 41.26 24.27 29.94 29.81 39.08 24.55 28.75 26.19 31.83 30.39]';
Ww_f3 = [6.40 4.60 4.75 4.17 4.77 3.43 3.13 7.00 4.40 5.00 2.78 3.60 5.91 4.17 3.92 3.79 4.78 4.83 4.40 6.54 5.87 6.16 7.00 5.54 5.31 3.92 3.18 2.87 3.33 8.53 5.55 7.04 6.39 9.06 3.37 3.76 5.74 7.40 6.66]';
Wd_f3 = [0.992 0.810 0.653 0.678 0.719 0.493 0.494 1.335 0.861 0.928 0.283 0.502 0.937 0.630 0.609 0.507 0.845 0.796 0.613 1.219 1.121 0.765 1.035 1.032 0.877 0.686 0.499 0.359 0.419 1.361 0.914 1.086 1.029 1.398 0.464 0.634 0.904 1.075 1.138]';

data.LWt_f3_E2 = [ ... % length (mm),  total wet weight (g)
L_f3/10  Wt_f3 % convert mm to cm
];
units.LWt_f3_E2   = {'cm', 'g'};  label.LWt_f3_E2 = {'length', 'total wet weight, exp2'};  
bibkey.LWt_f3_E2 = 'ChenRagg2020'; comment.LWt_f3_E2 = 'Treatment 3'; 

data.LWw_f3_E2 = [ ... % length (mm),  wet flesh weight (g)
L_f3/10  Ww_f3 % convert mm to cm
];
units.LWw_f3_E2   = {'cm', 'g'};  label.LWw_f3_E2 = {'length', 'wet flesh weight, exp2'};  
bibkey.LWw_f3_E2 = 'ChenRagg2020'; comment.LWw_f3_E2 = 'Treatment 3'; 

data.LWd_f3_E2 = [ ... % length (mm),  dry flesh weight (g)
L_f3/10  Wd_f3
];
units.LWd_f3_E2   = {'cm', 'g'};  label.LWd_f3_E2 = {'length', 'dry flesh weight, exp2'};  
bibkey.LWd_f3_E2 = 'ChenRagg2020'; comment.LWd_f3_E2 = 'Treatment 3'; 

% length-energy 
L_f3e = [70.40 64.05 65.91 67.74 62.44 74.69 63.53 61.80 58.58 58.74 69.64 66.45 62.82 63.60 68.38 66.63 65.41 67.42 68.04 66.54 68.11 65.52 67.13 61.55 65.14 62.43 79.09 65.14 70.19 71.67 80.11 67.22 70.56 68.70 73.83 72.58]';
En_f3 = [16.81 14.89 12.11 12.10  7.73 24.71 15.60 17.28  4.24  8.52 16.29 10.60 10.23  8.69 15.20 13.52 10.27 22.27 21.02 13.62 18.14 16.13 11.80  8.51  5.36  6.86 24.79 17.79 19.19 20.00 23.77  7.63 10.49 15.25 17.55 20.68]';
%
data.LEn_f3_E2 = [L_f3e/10 En_f3*1e3]; %length (cm), energy (J/mussel)
units.LEn_f3_E2 = {'cm', 'J'}; label.LEn_f3_E2 = {'length', 'energy per mussel'}; 
bibkey.LEn_f3_E2 = 'ChenRagg2020';

% time-length (treatment 3, EXPERIMENT1)
data.tL_f3= [ ... % time (yr), length (cm)
792 862 936 981 1027 1087
64.05 64.77 65.32 65.51 65.70 65.66]';
data.tL_f3(:,1) = data.tL_f3(:,1) -  data.tL_f3(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
data.tL_f3(:,2) = data.tL_f3(:,2) * 0.1;              % convert mm to cm
units.tL_f3= {'d', 'cm'};     label.tL_f3= {'time', 'length'}; 
  temp.tL_f3= C2K(18);  units.temp.tL_f3= 'K'; label.temp.tL_f3= 'temperature';
  L0.tL_f3 = data.tL_f3(1,2);  units.L0.tL_f3 = 'cm'; label.L0.tL_f3 = 'initial length';
  bibkey.tL_f3= 'ChenRagg2020'; comment.tL_f3= 'Treatment 3; mean of (complete) growth curves (6 time points) ';

% total wet weight-change in total wet:  WtdWt (treatment 3, EXPERIMENT1)
Wt3 = [18.19 28.22 26.95 17.21 19.82 19.48 20.01 16.18 15.17 14.90 18.20 16.32 17.39 18.35 22.66 28.02 18.44 20.99 20.64 21.14 28.55 24.06 25.33 23.94 17.72 20.44 24.85 20.82 20.69 23.84 31.86 23.14 27.59 25.09 27.98 18.60 23.80 18.30 18.20 28.44 27.40 17.29 20.45 19.83 20.80 16.58 15.60 15.40 19.11 17.11 17.93 18.87 23.46 28.58 18.95 21.82 21.35 22.10 29.40 25.35 26.21 25.07 19.44 20.70 25.90 21.71 21.69 24.45 33.74 23.80 29.09 25.75 29.10 18.85 24.15 18.98 18.54 29.03 27.64 17.66 20.79 21.53 17.01 16.14 19.39 17.72 18.12 19.93 24.00 19.35 22.05 22.47 30.22 25.93 26.62 25.87 20.72 26.47 22.23 22.13 25.09 34.74 24.75 29.75 26.10 29.33 24.51 19.53 24.28 18.40 29.14 27.53 17.61 20.75 21.50 16.92 16.08 19.38 18.07 18.07 19.67 24.19 19.19 22.05 22.47 30.31 25.75 26.39 25.94 20.64 26.61 22.21 22.07 25.01 34.97 24.81 29.68 25.92 19.55 23.50 29.31 17.75 21.88 17.02 16.26 19.54 18.24 19.97 24.37 19.38 22.21 22.77 31.11 26.05 26.67 26.17 24.19 22.24 35.40 24.98 19.62 23.95]';
dWtdt3 = [0.0001  0.0031  0.0064  0.0011  0.0090  0.0050  0.0113  0.0057  0.0061  0.0071  0.0130  0.0113  0.0077  0.0074  0.0114  0.0080  0.0073  0.0119  0.0101  0.0137  0.0121  0.0184  0.0126  0.0161  0.0246  0.0037  0.0150  0.0127  0.0143  0.0087  0.0269  0.0094  0.0214  0.0094  0.0160  0.0036  0.0050  0.0097   0.0046  0.0080  0.0032  0.0050  0.0046  0.0027  0.0099  0.0058  0.0073 -0.0178  0.0038  0.0082  0.0026  0.0143  0.0073  0.0054  0.0054  0.0031  0.0051   0.0050  0.0111  0.0078  0.0055  0.0108  0.0299  0.0003  0.0077  0.0070  0.0059  0.0086  0.0135  0.0128  0.0089  0.0047  0.0031  0.0023  0.0049  0.0074 -0.0031  0.0024 -0.0024 -0.0011 -0.0009 -0.0007 -0.0020 -0.0013 -0.0002  0.0078 -0.0011 -0.0058  0.0042 -0.0036  0.0000  0.0000  0.0020 -0.0040 -0.0051  0.0016 -0.0018  0.0031 -0.0004 -0.0013 -0.0018  0.0051  0.0013 -0.0016 -0.0040 -0.0018 -0.0018  0.0004 -0.0173  0.0039  0.0037  0.0063  0.0030  0.0033  0.0083  0.0022  0.0039  0.0035  0.0037  0.0028  0.0065  0.0039  0.0041  0.0035  0.0065  0.0174  0.0065  0.0061  0.0050  0.0033  0.0004  0.0007  0.0072  0.0143  0.0093  0.0037  0.0061  0.0035  0.0015  0.0098  0.0005  0.0008  0.0010  0.0000 -0.0018  0.0030  0.0033  0.0003  0.0022  0.0013  0.0025  0.0007 -0.0012 -0.0002  0.0012  0.0040  0.0162  0.0027  0.0033  0.0048  0.0000  0.0128]';
data.WtdWt_f3 = [... % total wet weight (g), growth (g total wet weight per day) 
Wt3 dWtdt3
];
units.WtdWt_f3   = {'g', 'g/d'};  label.WtdWt_f3 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f3   = C2K(18);  units.temp.WtdWt_f3 = 'K'; label.temp.WtdWt_f3 = 'temperature';
bibkey.WtdWt_f3 = 'ChenRagg2020'; comment.WtdWt_f3 = 'Treatment 3'; 

% total wet weight-change in total wet weight:  WtdWt (treatment 3, EXPERIMENT 2)
Wt3 = [25.31 21.17 23.41 21.90 17.88 23.46 17.86 16.81 29.56 18.43 17.73 16.41 16.25 25.24 22.34 20.68 21.69 23.62 22.55 21.47 24.41 24.18 22.71 25.99 20.48 19.60 21.33 18.06 20.47 17.70 40.03 21.94 28.25 28.69 37.00 24.38 27.22 25.54 30.71 27.61 25.73 21.64 24.20 22.30 23.65 17.95 17.14 30.00 18.88 18.15 16.63 16.56 26.00 22.60 21.10 22.15 24.38 23.42 21.90 25.10 24.58 23.55 26.15 21.23 21.05 22.15 19.00 22.55 19.10 41.40 23.40 26.65 29.57 38.55 24.57 27.43 26.00 31.35 29.13]';
dWtdt3 = [0.0060  0.0067  0.0113  0.0057  0.0010  0.0027  0.0013  0.0047  0.0063  0.0064  0.0060  0.0031  0.0044  0.0109  0.0037  0.0060  0.0066  0.0109  0.0124  0.0061  0.0099  0.0057  0.0120  0.0023  0.0107  0.0207  0.0117  0.0134  0.0297  0.0200  0.0196  0.0209 -0.0229  0.0126  0.0221  0.0027  0.0030  0.0066  0.0091  0.0217  0.0031  0.0024 -0.0024  0.0003  0.0025  0.0021  0.0035  0.0030  0.0049  0.0058  0.0007 -0.0052  0.0028  0.0086  0.0000 -0.0016  0.0095  0.0039 -0.0027  0.0055  0.0133  0.0045  0.0025  0.0031  0.0144  0.0015  0.0047 -0.0063  0.0012 -0.0021  0.0105  0.0588  0.0034  0.0077 -0.0003  0.0171  0.0027  0.0058  0.0148]';
data.WtdWt_f3_EXP2 = [... % total wet weight (g), growth (g total wet weight per day,including shell) 
Wt3 dWtdt3
];
units.WtdWt_f3_EXP2   = {'g', 'g/d'};  label.WtdWt_f3_EXP2 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f3_EXP2   = C2K(18);  units.temp.WtdWt_f3_EXP2 = 'K'; label.temp.WtdWt_f3_EXP2 = 'temperature';
bibkey.WtdWt_f3_EXP2 = 'ChenRagg2020'; comment.WtdWt_f3_EXP2 = 'Treatment 3'; 

% length-change length: (treatment 3, EXPERIMENT1)
L3 = [61.00 69.00 58.00 61.00 64.00 62.00 60.00 56.00 59.00 61.00 61.00 61.00 61.00 65.00 70.00 60.00 65.00 60.00 63.00 71.00 66.00 69.00 67.00 59.00 63.00 70.00 63.00 63.00 65.00 72.00 66.00 68.00 68.00 69.00 61.00 68.00 61.00 67.00 70.00 59.00 61.00 64.00 64.00 61.00 57.00 59.00 62.00 62.00 62.00 63.00 66.00 70.00 60.00 66.00 60.00 64.00 72.00 67.00 69.00 68.00 62.00 63.00 72.00 64.00 64.00 66.00 74.00 67.00 70.00 69.00 70.00 56.00 62.00 62.00 67.00 61.43 70.95 69.97 59.80 60.92 64.54 61.42 57.42 61.96 62.26 62.10 63.31 66.44 60.77 65.91 64.13 71.93 67.28 69.40 68.62 62.62 71.73 64.59 64.50 66.72 74.06 67.13 70.40 69.17 69.92 66.70 62.47 68.06 61.51 71.01 70.10 59.76 61.15 64.77 61.38 57.70 62.00 62.82 62.13 63.76 67.05 60.65 65.97 64.30 72.47 67.41 69.46 68.74 62.84 71.88 64.86 64.28 66.78 74.59 67.35 70.66 69.19 62.69 68.10 71.19 60.07 64.95 61.42 57.83 62.16 63.18 63.92 67.20 60.99 66.28 64.49 72.80 67.50 69.55 68.76 65.94 65.01 64.67 75.06 67.58 62.71 68.08]';
dLdt3 = [0.0000  0.0143  0.0143  0.0000  0.0000  0.0286  0.0143  0.0143  0.0000  0.0143  0.0143  0.0143  0.0286  0.0143  0.0000  0.0000  0.0143  0.0000  0.0143  0.0143  0.0143  0.0000  0.0143  0.0429  0.0000  0.0286  0.0143  0.0143  0.0143  0.0286  0.0143  0.0286  0.0143  0.0143  0.0143 -0.0143  0.0058  0.0534 -0.0004  0.0108 -0.0011 -0.0035  0.0073  0.0057  0.0057  0.0084 -0.0005  0.0035  0.0014  0.0042  0.0059  0.0039  0.0104 -0.0012  0.0020  0.0018 -0.0009  0.0038  0.0054  0.0084  0.0166 -0.0051 -0.0036  0.0080  0.0068  0.0097  0.0008  0.0018  0.0054  0.0023 -0.0011  0.0539  0.0635  0.0064  0.0143  0.0018  0.0013  0.0029 -0.0009  0.0051  0.0051 -0.0009  0.0062  0.0009  0.0124  0.0007  0.0100  0.0136 -0.0027  0.0013  0.0038  0.0120  0.0029  0.0013  0.0027  0.0049  0.0033  0.0060 -0.0049  0.0013  0.0118  0.0049  0.0058  0.0004 -0.0024 -0.0002  0.0049  0.0009 -0.0046  0.0039  0.0002  0.0067 -0.0035  0.0039  0.0009  0.0028  0.0035  0.0078  0.0037  0.0035  0.0033  0.0074  0.0067  0.0041  0.0072  0.0020  0.0020  0.0004 -0.0004  0.0004  0.0033  0.0085  0.0004  0.0102  0.0050  0.0020  0.0024  0.0004 -0.0004 -0.0083  0.0000  0.0028  0.0012 -0.0030  0.0005 -0.0025 -0.0008 -0.0012  0.0008  0.0018 -0.0042  0.0060 -0.0043 -0.0057  0.0045  0.0125  0.0002 -0.0002  0.0010  0.0040 -0.0008 -0.0078]';
data.LdL_f3 = [... %length (mm diameter), growth in length(mm diameter per day)
L3/10 dLdt3/10   % convert mm to cm
];
units.LdL_f3   = {'cm', 'cm/d'};  label.LdL_f3 = {'diameter', 'change in diameter, exp1'};  
temp.LdL_f3   = C2K(18);  units.temp.LdL_f3 = 'K'; label.temp.LdL_f3 = 'temperature';
bibkey.LdL_f3 = 'ChenRagg2020'; comment.LdL_f3 = 'Treatment 3 (EXP1)'; 

% length-change in length: (treatment 3, EXPERIMENT2)
L3 = [68 64 67 65 66 60 66 62 61 74 63 61 58 58 68 65 62 63 67 65 64 66 66 65 67 64 63 65 60 65 61 78 63 69 71 78 67 71 68 73 70 70 64 68 66 67 62 62 75 63 61 58 59 69 66 63 64 68 66 65 67 67 66 67 64 64 67 61 65 63 79 64 70 72 80 67 70 69 73 72]';
dLdt3= [0.0286  0.0000  0.0143 -0.0143  0.0000  0.0143  0.0143  0.0000  0.0143  0.0143  0.0000  0.0000  0.0000  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0000  0.0000  0.0143  0.0286  0.0143  0.0000  0.0286  0.0143  0.0143  0.0143  0.0143  0.0286  0.0000 -0.0143  0.0143  0.0000  0.0286  0.0056  0.0006 -0.0061 -0.0012  0.0087  0.0052  0.0018 -0.0049  0.0077  0.0095  0.0078 -0.0043  0.0089  0.0070 -0.0031 -0.0071  0.0049  0.0090  0.0051  0.0065  0.0179  0.0073  0.0141  0.0122  0.0192  0.0020  0.0071  0.0023 -0.0089  0.0014  0.0137  0.0034 -0.0046  0.0016  0.0033  0.0073 -0.0043  0.0100  0.0068]';
data.LdL_f3_EXP2 = [... %length (mm diameter), growth in length(mm diameter per day)
L3/10 dLdt3/10   % convert mm to cm
];
units.LdL_f3_EXP2   = {'cm', 'cm/d'};  label.LdL_f3_EXP2 = {'diameter', 'change in diameter, exp2'};  
temp.LdL_f3_EXP2   = C2K(18);  units.temp.LdL_f3_EXP2 = 'K'; label.temp.LdL_f3_EXP2 = 'temperature';
bibkey.LdL_f3_EXP2 = 'ChenRagg2020'; comment.LdL_f3_EXP2 = 'Treatment 3 (EXP2)'; 


% time-total wet weight (treatment 3, EXPERIMENT1)
data.tWt_f3= [ ... % time (days), total wet weight (g)
792 862 936 981 1027 1087
21.41 22.19 22.78 22.77 23.02 22.93]';
data.tWt_f3(:,1) = data.tWt_f3(:,1) -  data.tWt_f3(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
units.tWt_f3 = {'d', 'g'};     label.tWt_f3= {'time', 'total wet weight, exp1'}; 
  temp.tWt_f3 = C2K(18);  units.temp.tWt_f3= 'K'; label.temp.tWt_f3= 'temperature';
  bibkey.tWt_f3= 'ChenRagg2020'; comment.tWt_f3= 'Treatment 3; mean of (complete) growth curves (6 time points) ';
  
% wet flesh weight- ingestion rate: WwJx  (treatment 4)
FleshW3=[6.40 4.60 4.75 4.17 4.77 3.43 3.13 7.00 4.40 5.00 2.78 3.60 5.91 4.17 3.92 3.79 4.78 4.83 4.40 6.54 5.87 6.16 7.00 5.54 5.31 3.92 3.18 2.87 3.33 8.53 5.55 7.04 9.06 3.37 3.76 5.74 7.40 6.66]';
%Length3 =[70.40 64.05 67.64 65.91 67.74 62.44 62.13 74.69 63.53 61.80 58.58 58.74 69.64 66.45 62.82 63.60 68.38 66.63 65.41 67.42 68.04 66.54 68.11 64.72 65.52 67.13 61.55 65.14 62.43 79.09 65.14 70.19 80.11 67.22 70.56 68.70 73.83 72.58]';
JX3=[216.3  43.3 150.8  91.2 145.0 181.6 157.7 176.5 103.7 370.0  68.1   5.8 271.5 312.2  68.4  26.3 113.3   8.7 157.9 335.1 119.5  64.0 191.9 114.3 116.2  66.2 263.0 148.2 359.2 316.6 169.1 113.9 250.3  31.3 103.1 244.5 134.2 173.9]';
data.WwJX_f3 = [... %wet flesh weight (g), ingestion rate (J of prey per day) 
FleshW3 JX3
% FleshW4 JX3 * 139/157   % 139J = poo+oxy+growth 157=ingestion
];
units.WwJX_f3   = {'g', 'J/d'};  label.WwJX_f3 = {'wet flesh weight', 'algae consumption'};  
temp.WwJX_f3    = C2K(18);  units.temp.WwJX_f3 = 'K'; label.temp.WwJX_f3 = 'temperature';
bibkey.WwJX_f3 = 'ChenRagg2020'; comment.WwJX_f3 = 'Treatment 3'; 

% length-oxygen consumption (treatment 3)
L3=[58.58 58.74 61.80 62.13 62.43 62.44 62.82 63.53 63.60 64.05 64.72 65.14 65.41 65.52 65.91 66.45 66.54 66.63 67.13 67.22 67.42 67.64 67.74 68.04 68.11 68.38 68.70 69.64 70.19 70.40 71.67 72.58 73.83 74.69 79.09 80.11]';
JO3=[1.428  5.244  5.036  2.988  3.510  3.539  2.675  6.248  1.829  6.138  4.259  3.735  6.080  5.882  4.588  2.924  2.516  4.987  3.348  2.288  6.379  2.054  5.148  5.396  5.795  5.896 10.204  7.157  4.030  1.909  7.041  4.107  8.127  5.281  4.622  9.279]';
data.LJO_f3 = [... % length (mm), O2 consumption (ug/min)
L3/10 JO3  % convert mm to cm
];
units.LJO_f3   = {'cm', 'mug/min'};  label.LJO_f3 = {'length', 'O_2 consumption'};  
temp.LJO_f3    = C2K(18);  units.temp.LJO_f3 = 'K'; label.temp.LJO_f3 = 'temperature';
bibkey.LJO_f3 = 'ChenRagg2020';  comment.LJO_f3 = 'Treatment 3'; 

%%   TREATMENT 2

% length-total wet weight (treatment 2, EXPERIMENT1)
L2=[59.00 60.00 60.66 60.28 60.78 60.75 62.00 63.00 62.28 70.00 71.00 71.09 70.93 71.20 62.00 63.00 63.49 63.77 63.42 63.00 63.00 63.59 63.55 67.00 68.00 67.44 68.27 68.31 64.00 64.00 64.94 65.06 65.04 58.00 59.00 58.87 59.13 59.08 65.00 65.00 65.41 65.67 65.67 72.00 73.00 72.09 71.65 72.12 64.00 65.00 64.72 64.90 64.95 64.71 64.00 65.00 64.84 67.00 68.00 67.05 67.67 67.71 60.00 60.00 59.48 59.68 59.77 56.00 56.00 56.00 55.96 56.35 56.12 69.00 70.00 69.61 69.42 69.53 61.00 61.00 61.01 61.38 61.67 59.00 61.00 60.29 60.00 60.18 63.00 64.00 64.94 64.00 64.00 63.66 63.95 70.00 71.00 70.97 70.31 71.34 71.06 66.00 66.00 66.57 66.79 67.03 64.00 65.00 65.62 65.60 65.78 65.10 64.00 64.00 65.02 65.44 65.37 65.37 64.00 66.00 66.49 66.65 66.47 66.86 73.00 74.00 73.80 73.75 69.00 70.00 69.66 70.23 70.47 70.50 65.00 65.00 66.00 65.66 66.03 66.19 67.00 68.00 67.68 68.06 67.83 61.00 62.00 62.94 62.32 63.03 75.00 77.00 76.50 76.86 76.88 74.00 77.00 76.24 76.12 76.27 56.00 58.00 58.37 58.49 58.48 72.00 72.00 72.15 72.30 72.00 73.00 72.92 72.85 73.02 72.00 73.00 72.37 69.00 70.00 69.77 69.65 69.60 69.00 71.00 70.49 69.83 68.00 68.00 68.41]';
Wt2=[16.20 16.55 17.02 16.85 17.09 17.08 18.58 18.84 19.14 28.44 28.95 29.25 29.13 29.50 21.30 21.90 22.40 22.47 22.61 19.89 20.00 20.49 20.55 23.01 23.89 24.23 24.24 24.45 19.45 19.93 20.67 20.71 20.97 15.95 16.20 16.46 16.41 16.48 20.07 21.00 21.45 21.51 21.74 27.75 28.45 28.64 28.77 28.73 19.13 19.45 19.83 19.83 19.90 20.05 19.30 19.55 20.15 22.25 22.54 23.00 22.84 23.09 16.63 16.70 16.83 16.86 17.07 13.66 14.05 14.45 14.32 14.46  9.54 26.30 26.50 26.71 26.62 27.27 20.02 20.24 20.47 20.40 20.48 17.38 17.95 18.50 18.59 18.68 22.93 23.15 23.52 20.97 21.39 21.65 21.63 25.85 26.65 27.51 27.45 27.67 27.69 22.62 23.20 23.78 23.47 23.52 20.56 21.80 22.43 22.16 22.31 22.27 20.89 21.10 22.28 22.25 22.33 22.40 23.42 24.35 25.42 25.28 25.36 16.09 29.42 30.00 30.35 28.88 25.81 26.54 26.89 26.93 27.14 27.24 22.53 33.35 23.97 23.69 23.90 24.01 23.09 23.70 24.71 24.46 24.60 18.80 19.80 20.37 20.27 20.43 35.09 36.95 36.92 37.06 37.21 33.87 35.25 36.08 35.58 35.54 16.50 17.30 17.80 17.71 17.84 30.86 31.00 31.36 31.31 29.77 30.66 31.22 31.37 31.50 29.23 29.39 29.63 27.55 27.80 28.19 28.08 28.21 29.53 30.50 30.62 30.58 27.14 28.05 28.37]';
data.LWt_f2 = [ ... % length (mm),  total wet weight (including shell) (g)
L2/10  Wt2  % convert mm to cm
];
units.LWt_f2   = {'cm', 'g'};  label.LWt_f2 = {'length', 'total wet weight, exp1'};  
bibkey.LWt_f2 = 'ChenRagg2020'; comment.LWt_f2 = 'Treatment 2'; 

% length-ash free dry weight (treatment 2, EXPERIMENT2)
L_f2=[64.08 69.39 73.58 64.96 61.43 55.56 65.25 62.04 60.90 66.22 63.89 67.18 65.88 66.78 76.70 64.14 68.52 68.02 67.15 73.78 63.91 63.65 59.26 61.15 73.49 65.84 70.93 70.81 66.93 71.94 72.34 70.33 77.73 75.74 68.45 63.25 68.66 75.28 66.93]';
AFDWFleshW2=[0.618 0.487 0.882 0.518 0.442 0.400 0.565 0.809 0.473 0.677 0.737 0.577 0.656 0.600 0.900 0.433 1.106 0.678 0.530 1.556 0.753 0.981 0.924 0.654 0.367 0.632 0.884 0.693 0.296 0.939 0.898 0.698 0.689 1.174 0.524 0.418 0.579 0.459 0.803]';
%
data.LWafd_f2_E2 = [ ... % length (cm),  ash free dry flesh weight (g)
L_f2/10  AFDWFleshW2  % convert mm to cm
];
units.LWafd_f2_E2   = {'cm', 'g'};  label.LWafd_f2_E2 = {'length', 'ash-free dry flesh weight, exp2'};  
bibkey.LWafd_f2_E2 = 'ChenRagg2020'; comment.LWafd_f2_E2 = 'Treatment 2'; 

% L-Wt-Ww-Wd (treatment 2)
Wt_f2 = [21.02 26.55 32.73 21.20 18.71 14.33 20.17 18.37 17.67 22.34 21.03 21.66 21.29 23.59 35.27 20.09 25.81 25.54 25.79 32.74 21.12 20.96 18.90 18.89 30.80 22.75 27.86 27.64 25.30 29.50 31.37 29.39 37.91 38.58 23.91 20.21 28.25 32.77 23.80]';
Ww_f2 = [4.85 4.23 6.99 3.04 3.45 2.93 4.47 4.71 3.64 5.04 4.79 5.08 4.49 4.66 7.14 2.25 6.06 4.71 4.64 8.56 5.52 6.54 5.23 4.46 4.19 5.14 6.23 5.87 3.35 7.53 6.79 5.69 7.51 7.58 4.55 3.51 4.81 4.91 5.71]';
Wd_f2 = [0.726 0.635 1.055 0.651 0.547 0.476 0.675 0.909 0.563 0.796 0.847 0.682 0.781 0.721 1.076 0.521 1.238 0.791 0.530 1.750 0.864 1.126 1.032 0.748 0.480 0.754 1.023 0.829 0.382 1.096 1.067 0.821 1.174 1.372 0.647 0.502 0.696 0.597 0.944]';

data.LWt_f2_E2 = [ ... % length (cm),  total wet weight (g)
L_f2/10  Wt_f2 % convert mm to cm
];
units.LWt_f2_E2   = {'cm', 'g'};  label.LWt_f2_E2 = {'length', 'total wet weight, exp2'};  
bibkey.LWt_f2_E2 = 'ChenRagg2020'; comment.LWt_f2_E2 = 'Treatment 2'; 

data.LWw_f2_E2 = [ ... % length (mm),  wet flesh weight (g)
L_f2/10  Ww_f2 % convert mm to cm
];
units.LWw_f2_E2   = {'cm', 'g'};  label.LWw_f2_E2 = {'length', 'wet flesh weight, exp2'};  
bibkey.LWw_f2_E2 = 'ChenRagg2020'; comment.LWw_f2_E2 = 'Treatment 2'; 

data.LWd_f2_E2 = [ ... % length (mm),  dry flesh weight (g)
L_f2/10  Wd_f2 % convert mm to cm
];
units.LWd_f2_E2   = {'cm', 'g'};  label.LWd_f2_E2 = {'length', 'dry flesh weight, exp2'};  
bibkey.LWd_f2_E2 = 'ChenRagg2020'; comment.LWd_f2_E2 = 'Treatment 2';

% length-energy
L_f2e = [64.08 69.39 73.58 64.96 61.43 55.56 65.25 60.90 66.22 63.89 67.18 65.88 66.78 76.70 64.14 68.52 68.02 67.15 73.78 63.91 63.65 59.26 61.15 73.49 65.84 70.93 70.81 66.93 71.94 72.34 70.33 77.73 75.74 68.45 63.25 68.66 75.28]';
En_f2 = [12.79  9.93 19.33 10.43  9.33  7.82 11.73  9.50 14.36 15.48 12.21 13.40 12.49 19.54  9.50 22.80 14.44  8.65 35.86 16.38 20.97 17.36 14.13  7.54 12.05 18.58 14.23  6.14 19.84 18.19 14.48 21.13 26.36 11.00  8.44 12.29  9.34]';

data.LEn_f2_E2 = [L_f2e/10 En_f2*1e3]; %length (cm), energy (J/mussel)
units.LEn_f2_E2 = {'cm', 'J'}; label.LEn_f2_E2 = {'length', 'energy per mussel'}; 
bibkey.LEn_f2_E2 = 'ChenRagg2020';

% time-length (treatment 2, EXPERIMENT1)
data.tL_f2 = [ ... % time (days), length (mm)
792 862 936 981 1027 1087
63.89 64.67 65.02 65.00 65.28 65.18]';
data.tL_f2(:,1) = data.tL_f2(:,1) -  data.tL_f2(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
data.tL_f2(:,2) = data.tL_f2(:,2) * 0.1;              % convert mm to cm
units.tL_f2 = {'d', 'cm'};     label.tL_f2 = {'time', 'length'}; 
  temp.tL_f2 = C2K(18);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
  L0.tL_f2 = data.tL_f2(1,2);  units.L0.tL_f2 = 'cm'; label.L0.tL_f2 = 'initial length';
  bibkey.tL_f2 = 'ChenRagg2020'; comment.tL_f2 = 'Treatment 2; mean of (complete) growth curves (6 time points) ';

% time-wet weight (treatment 2, EXPERIMENT1)
data.tWt_f2 = [ ... % time (days), total wet weight (including shell) (g)
792 862 936 981 1027 1087
20.89 22.65 22.20 22.08 22.24 20.71]';
data.tWt_f2(:,1) = data.tWt_f2(:,1) -  data.tWt_f2(1,1); % convert time to relative time (growth contitions before experiment are unknown) 
units.tWt_f2 = {'d', 'g'};     label.tWt_f2 = {'time', 'total wet weight, exp1'}; 
  temp.tWt_f2 = C2K(18);  units.temp.tWt_f2 = 'K'; label.temp.tW_f2 = 'temperature';
  bibkey.tWt_f2 = 'ChenRagg2020'; comment.tWt_f2 = 'Treatment 2; mean of (complete) growth curves (6 time points) ';

% wet weight, change in total wet (treatment 2, EXPERIMENT 1)
Wt2 = [16.20 18.58 28.44 21.30 19.89 23.01 19.45 15.95 20.07 27.75 19.13 19.30 22.25 16.63 13.66 26.30 20.02 17.38 22.93 20.97 25.85 22.62 20.56 20.89 23.42 29.42 25.81 23.09 18.80 35.09 33.87 16.50 30.86 29.77 29.23 27.55 29.53 27.14 16.55 18.84 28.95 21.90 20.00 23.89 19.93 16.20 21.00 28.45 19.45 19.55 22.54 16.70 14.05 26.50 20.24 17.95 23.15 21.39 26.65 23.20 21.80 21.10 24.35 30.00 26.54 23.70 19.80 36.95 35.25 17.30 31.00 30.66 29.39 27.80 30.50 28.05 17.02 29.25 22.40 20.49 24.23 20.67 16.46 21.45 28.64 19.83 23.00 16.83 14.45 26.71 20.47 18.50 21.65 27.51 23.78 22.43 22.28 25.42 26.89 23.97 24.71 20.37 36.92 36.08 17.80 31.36 31.22 28.19 30.62 16.85 29.13 22.47 24.24 20.71 16.41 21.51 28.77 19.83 22.84 16.86 14.32 26.62 20.40 18.59 27.45 23.47 22.16 22.25 25.28 26.93 23.69 24.46 20.27 37.06 35.58 17.71 31.37 28.08 17.09 19.90 27.67 22.31 22.33 27.14 23.90]';
dWdt2 = [0.0050  0.0037  0.0073  0.0086  0.0016  0.0126  0.0069  0.0036  0.0133  0.0100  0.0046  0.0036  0.0041  0.0010  0.0056  0.0029  0.0031  0.0081  0.0031  0.0060  0.0114  0.0083  0.0177  0.0030  0.0133  0.0083  0.0104  0.0087  0.0143  0.0266  0.0197  0.0114  0.0020  0.0127  0.0023  0.0036  0.0139  0.0130  0.0064  0.0041  0.0041  0.0068  0.0066  0.0046  0.0100  0.0035  0.0061  0.0026  0.0051  0.0081  0.0062  0.0018  0.0054  0.0028  0.0031  0.0074  0.0050  0.0035  0.0116  0.0078  0.0085  0.0159  0.0145  0.0047  0.0047  0.0136  0.0077 -0.0004  0.0112  0.0068  0.0049  0.0076  0.0032  0.0053  0.0016  0.0043 -0.0038 -0.0027  0.0016  0.0013  0.0002  0.0009 -0.0011  0.0013  0.0029  0.0000 -0.0036  0.0007 -0.0029 -0.0020 -0.0016  0.0020 -0.0004 -0.0013 -0.0069 -0.0060 -0.0007 -0.0031  0.0009 -0.0062 -0.0056 -0.0022  0.0031 -0.0111 -0.0020 -0.0011  0.0033 -0.0024 -0.0009  0.0052  0.0080  0.0030  0.0046  0.0057  0.0015  0.0050 -0.0009  0.0015  0.0054  0.0046  0.0030  0.0141  0.0017  0.0020  0.0048  0.0011  0.0033  0.0017  0.0017  0.0046  0.0046  0.0030  0.0035  0.0033 -0.0009  0.0028  0.0028  0.0028 -0.0002  0.0025  0.0003 -0.0007  0.0012  0.0017  0.0018]';
data.WtdWt_f2 = [... % total wet weight (including shell) (g), growth (g total wet weight per day) 
Wt2 dWdt2
];
units.WtdWt_f2   = {'g', 'g/d'};  label.WtdWt_f2 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f2   = C2K(18);  units.temp.WtdWt_f2 = 'K'; label.temp.WtdWt_f2 = 'temperature';
bibkey.WtdWt_f2 = 'ChenRagg2020'; comment.WtdWt_f2 = 'Treatment 2'; 

% total wet weight-change in total wet weight (treatment 2, EXPERIMENT 2)
Wt2 = [20.61 20.06 26.23 31.95 17.66 17.96 14.20 19.16 17.24 17.32 21.50 19.98 21.11 20.31 22.51 33.27 19.82 25.03 24.46 25.39 30.65 20.23 20.07 17.76 18.22 29.40 22.52 25.66 25.52 23.43 29.96 31.22 28.13 38.57 36.74 22.84 19.91 28.10 31.85 19.26 22.91 20.84 26.60 33.10 21.20 19.45 14.40 20.10 18.20 17.80 22.20 20.70 21.60 21.05 23.25 34.47 20.25 25.65 25.40 25.77 32.03 20.92 20.64 18.37 18.60 31.00 22.90 27.30 26.75 25.25 31.30 31.65 29.20 39.43 38.11 23.95 20.40 28.30 32.90]';
dWtdt2 = [0.0033  0.0020  0.0053  0.0164  0.0506  0.0213  0.0029  0.0134  0.0137  0.0069  0.0100  0.0103  0.0070  0.0106  0.0106  0.0171  0.0061  0.0089  0.0134  0.0054  0.0197  0.0099  0.0081  0.0087  0.0054  0.0229  0.0054  0.0234  0.0176  0.0260  0.0191  0.0061  0.0153  0.0123  0.0196  0.0159  0.0070  0.0029  0.0150  0.0149  0.0106  0.0022 -0.0007 -0.0059  0.0000 -0.0133 -0.0012  0.0009  0.0029 -0.0017  0.0018  0.0051  0.0008  0.0035  0.0049  0.0121 -0.0021  0.0027  0.0022  0.0002  0.0113  0.0027  0.0048  0.0066  0.0037 -0.0029 -0.0021  0.0093  0.0113  0.0007 -0.0212 -0.0048  0.0033 -0.0183  0.0061 -0.0006 -0.0023 -0.0006 -0.0020]';
data.WtdWt_f2_EXP2 = [... % total wet weight (g), growth (g total wet weight per day,including shell) 
Wt2 dWtdt2
];
units.WtdWt_f2_EXP2   = {'g', 'g/d'};  label.WtdWt_f2_EXP2 = {'total wet weight', 'change in total wet weight'};  
temp.WtdWt_f2_EXP2   = C2K(18);  units.temp.WtdWt_f2_EXP2 = 'K'; label.temp.WtdWt_f2_EXP2 = 'temperature';
bibkey.WtdWt_f2_EXP2 = 'ChenRagg2020'; comment.WtdWt_f2_EXP2 = 'Treatment 2'; 


% length-change in lenth (treatment 2, EXPERIMENT 1)
L2 = [59.00 62.00 70.00 62.00 63.00 67.00 64.00 58.00 65.00 72.00 64.00 64.00 67.00 60.00 56.00 69.00 61.00 59.00 63.00 64.00 70.00 66.00 64.00 64.00 64.00 73.00 69.00 65.00 67.00 61.00 75.00 74.00 56.00 72.00 72.00 72.00 69.00 69.00 68.00 60.00 63.00 71.00 63.00 63.00 68.00 64.00 59.00 65.00 73.00 65.00 65.00 68.00 60.00 56.00 70.00 61.00 61.00 64.00 64.00 71.00 66.00 65.00 64.00 66.00 74.00 70.00 65.00 68.00 62.00 77.00 77.00 58.00 72.00 73.00 73.00 70.00 71.00 68.00 60.66 71.09 63.49 63.59 67.44 64.94 58.87 65.41 72.09 64.72 67.05 59.48 56.00 69.61 61.01 60.29 63.66 70.97 66.57 65.62 65.02 66.49 73.80 69.66 66.00 67.68 62.94 76.50 76.24 58.37 72.15 72.92 69.77 70.49 60.28 70.93 63.77 68.27 65.06 59.13 65.67 71.65 64.90 67.67 59.68 55.96 69.42 61.38 60.00 70.31 66.79 65.60 65.44 66.65 70.23 65.66 68.06 62.32 76.86 76.12 58.49 72.85 69.65 60.78 64.95 56.35 71.34 65.78 65.37 66.47 70.47 66.03]';
dLdt2 = [0.0143  0.0143  0.0143  0.0143  0.0000  0.0143  0.0000  0.0143  0.0000  0.0143  0.0143  0.0143  0.0143  0.0000  0.0000  0.0143  0.0000  0.0286  0.0143  0.0000  0.0143  0.0000  0.0143  0.0000  0.0286  0.0143  0.0143  0.0000  0.0143  0.0143  0.0286  0.0429  0.0286  0.0000  0.0143  0.0143  0.0143  0.0286  0.0000  0.0089 -0.0097  0.0012  0.0066  0.0080 -0.0076  0.0127 -0.0018  0.0055 -0.0123 -0.0038 -0.0022 -0.0128 -0.0070  0.0000 -0.0053  0.0001 -0.0096  0.0127 -0.0046 -0.0004  0.0077  0.0084  0.0138  0.0066 -0.0027 -0.0046  0.0135 -0.0043  0.0127 -0.0068 -0.0103  0.0050  0.0020 -0.0011 -0.0085 -0.0031 -0.0069  0.0055 -0.0084 -0.0036  0.0062 -0.0009  0.0184  0.0027  0.0058  0.0058 -0.0098  0.0040  0.0138  0.0044 -0.0009 -0.0042  0.0082 -0.0064  0.0064 -0.0147  0.0049 -0.0004  0.0093  0.0036 -0.0011  0.0127 -0.0076  0.0084 -0.0138  0.0080 -0.0027  0.0027  0.0033 -0.0016 -0.0027 -0.0147  0.0109  0.0059 -0.0076  0.0009 -0.0004 -0.0011  0.0000  0.0102  0.0011  0.0009  0.0020  0.0085  0.0024  0.0063  0.0039  0.0224  0.0052  0.0039 -0.0015 -0.0039  0.0052  0.0080 -0.0050  0.0154  0.0004  0.0033 -0.0002  0.0037 -0.0011 -0.0005 -0.0040 -0.0038 -0.0047 -0.0113  0.0000  0.0065  0.0005  0.0027]';
data.LdL_f2 = [... %length (mm diameter), growth in length(mm diameter per day)
L2/10 dLdt2/10 % convert mm to cm   
];
units.LdL_f2   = {'cm', 'cm/d'};  label.LdL_f2 = {'diameter', 'change in diameter, exp1'};  
temp.LdL_f2   = C2K(18);  units.temp.LdL_f2 = 'K'; label.temp.LdL_f2 = 'temperature';
bibkey.LdL_f2 = 'ChenRagg2020'; comment.LdL_f2 = 'Treatment 2 (EXP1)'; 

% length-change in length: (treatment 2, EXPERIMENT2)
L2 = [63 64 69 72 65 61 55 64 61 61 66 62 66 65 66 75 64 68 67 67 72 63 63 58 59 72 66 69 69 65 71 72 70 77 75 67 64 68 74 64 66 63 70 74 65 61 55 66 62 61 67 64 67 66 67 76 64 69 68 67 74 64 63 59 61 74 66 70 70 67 72 73 71 78 76 68 64 69 76]';
dLdt2 = [0.0000  0.0000  0.0143  0.0286  0.0000  0.0000  0.0000  0.0286  0.0143  0.0000  0.0143  0.0286  0.0143  0.0143  0.0143  0.0143  0.0000  0.0143  0.0143  0.0000  0.0286  0.0143  0.0000  0.0143  0.0286  0.0286  0.0000  0.0143  0.0143  0.0286  0.0143  0.0143  0.0143  0.0143  0.0143  0.0143  0.0000  0.0143  0.0286  0.0000  0.0143  0.0130 -0.0085 -0.0067 -0.0007  0.0077  0.0095 -0.0097  0.0007 -0.0013 -0.0098 -0.0017  0.0024 -0.0017 -0.0031  0.0106  0.0018 -0.0080  0.0003  0.0018 -0.0035 -0.0012  0.0098  0.0032  0.0019 -0.0074 -0.0022  0.0155  0.0103 -0.0010 -0.0007 -0.0114 -0.0116 -0.0033 -0.0034  0.0070 -0.0089 -0.0040 -0.0112]';
data.LdL_f2_EXP2 = [... %length (mm diameter), growth in length(mm diameter per day)
L2/10 dLdt2/10  % convert mm to cm   
];
units.LdL_f2_EXP2   = {'cm', 'cm/d'};  label.LdL_f2_EXP2 = {'diameter', 'change in diameter, exp2'};  
temp.LdL_f2_EXP2   = C2K(18);  units.temp.LdL_f2_EXP2 = 'K'; label.temp.LdL_f2_EXP2 = 'temperature';
bibkey.LdL_f2_EXP2 = 'ChenRagg2020'; comment.LdL_f2_EXP2 = 'Treatment 2 (EXP2)'; 

% wet weight-ingestion rate (treatment 2)
FleshW2=[4.23 3.04 3.45 2.93 4.47 4.71 3.64 4.79 5.08 7.14 2.25 6.06 4.71 4.64 5.52 6.54 4.46 4.19 5.14 6.23 5.87 3.35 7.53 6.79 5.69 7.51 4.55 3.51 4.81]';
%Length2=[69.39 64.96 61.43 55.56 65.25 62.04 60.90 63.89 67.18 76.70 64.14 68.52 68.02 67.15 63.91 63.65 61.15 73.49 65.84 70.93 70.81 66.93 71.94 72.34 70.33 77.73 68.45 63.25 68.66]';
JX2=[119.3  67.5  26.6  89.1  22.5  64.1  36.5  86.9  15.0  54.8   0.1 167.9   6.9  83.7  41.4 110.7  17.3 228.0 112.9  62.4  93.7 374.4 105.3  52.4  20.9 100.5 287.0  19.4  69.8]';
data.WwJX_f2 = [... % wet flesh weight (g), ingestion rate (J of prey per day) 
FleshW2 JX2
%Length2*0.1 JX2
];
units.WwJX_f2   = {'g', 'J/d'};  label.WwJX_f2 = {'wet flesh weight', 'algae consumption'};  
temp.WwJX_f2    = C2K(18);  units.temp.WwJX_f2 = 'K'; label.temp.WwJX_f2 = 'temperature';
bibkey.WwJX_f2 = 'NIWA'; comment.WwJX_f2 = 'Treatment 2'; 

% length-oxygen consumption
L2 =[55.56 59.26 60.90 61.15 61.43 63.25 63.65 63.89 63.91 64.08 64.14 64.96 65.84 65.88 66.22 66.78 (66.93+66.93)/2 67.15 67.18 68.02 68.45 68.52 68.66 69.39 70.33 70.81 70.93 71.94 72.34 73.49 73.58 73.78 75.28 75.74 76.70 77.73]';
JO2=[2.520 6.180 4.254 4.050 0.865 4.585 3.570 4.281 2.570 5.454 4.031 3.563 4.458 7.212 4.726 3.892 (3.414+5.834)/2 5.997 1.358 5.267 3.977 5.922 5.008 3.503 3.861 6.267 6.819 8.140 6.663 6.162 6.501 8.021 5.604 1.552 4.538 8.003]';
data.LJO_f2 = [... % length (mm), O2 consumption (ug/min)
L2/10  JO2 % convert mm to cm
];
units.LJO_f2   = {'cm', 'mug/min'};  label.LJO_f2 = {'length', 'O_2 consumption'};  
temp.LJO_f2    = C2K(18);  units.temp.LJO_f2 = 'K'; label.temp.LJO_f2 = 'temperature';
bibkey.LJO_f2 = 'ChenRagg2020';  comment.LJO_f2 = 'Treatment 2'; 


%======================================================================================= 
%% set weights for all real data
% data with weights set to zero were used for validation
weights = setweights(data, []);
weights.tj = 5 * weights.tj;
weights.Lj = 5 * weights.Lj;
weights.tp = 0 * weights.tp;
weights.Lp = 5 * weights.Lp;

weights.tL0 = 5 * weights.tL0;

weights.tL1 = 2 * weights.tL1;
weights.tWd1 = 2 * weights.tWd1;
weights.tL2 = 2 * weights.tL2;
weights.tWd2 = 2 * weights.tWd2;

weights.LWt_f5 = 10 * weights.LWt_f5;
weights.LWt_f4 = 10 * weights.LWt_f4;
weights.LWt_f3 = 10 * weights.LWt_f3;
weights.LWt_f2 = 10 * weights.LWt_f2;

weights.LWafd_f5_E2 = 5 * weights.LWafd_f5_E2;
weights.LWafd_f4_E2 = 5 * weights.LWafd_f4_E2;
weights.LWafd_f3_E2 = 5 * weights.LWafd_f3_E2;
weights.LWafd_f2_E2 = 5 * weights.LWafd_f2_E2;

weights.E0 = 2 * weights.E0;
weights.LWt_18 = 0 * weights.LWt_18; 
weights.LWt_20 = 0 * weights.LWt_20;

weights.tL_f5 = 20 * weights.tL_f5;
weights.tL_f4 = 20 * weights.tL_f4;
weights.tL_f3 = 20 * weights.tL_f3;
weights.tL_f2 = 20 * weights.tL_f2;

weights.tWt_f5 = 20 * weights.tWt_f5;
weights.tWt_f4 = 20 * weights.tWt_f4;
weights.tWt_f3 = 20 * weights.tWt_f3;
weights.tWt_f2 = 20 * weights.tWt_f2;

weights.LdL_f5 = 0 * weights.LdL_f5;
weights.LdL_f4 = 0 * weights.LdL_f4;
weights.LdL_f3 = 0 * weights.LdL_f3;
weights.LdL_f2 = 0 * weights.LdL_f2;
weights.LdL_f5_EXP2 = 0 * weights.LdL_f5_EXP2;
weights.LdL_f4_EXP2 = 0 * weights.LdL_f4_EXP2;
weights.LdL_f3_EXP2 = 0 * weights.LdL_f3_EXP2;
weights.LdL_f2_EXP2 = 0 * weights.LdL_f2_EXP2;


weights.WtdWt_f5 = 0 * weights.WtdWt_f5;
weights.WtdWt_f4 = 0 * weights.WtdWt_f4;
weights.WtdWt_f3 = 0 * weights.WtdWt_f3;
weights.WtdWt_f2 = 0 * weights.WtdWt_f2;
weights.WtdWt_f5_EXP2 = 0 * weights.WtdWt_f5_EXP2;
weights.WtdWt_f4_EXP2 = 0 * weights.WtdWt_f4_EXP2;
weights.WtdWt_f3_EXP2 = 0 * weights.WtdWt_f3_EXP2;
weights.WtdWt_f2_EXP2 = 0 * weights.WtdWt_f2_EXP2;


weights.LJO_f2 = 1 * weights.LJO_f2;
weights.LJO_f3 = 1 * weights.LJO_f3;
weights.LJO_f4 = 1 * weights.LJO_f4;
weights.LJO_f5 = 1 * weights.LJO_f5;

weights.WwJX_f2 = 10 * weights.WwJX_f2;
weights.WwJX_f3 = 10 * weights.WwJX_f3;
weights.WwJX_f4 = 10 * weights.WwJX_f4;
weights.WwJX_f5 = 10 * weights.WwJX_f5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; auxData.L0 = L0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL2','tL1'}; subtitle1 = {'Growth at two culture sites'};
set2 = {'tWd2','tWd1'}; subtitle2 = {'Growth at two culture sites'};
set3 = {'LWt_20','LWt_18'}; subtitle3 = {'L-Wt at 20C and 18C, pre-spawn'};
set4 = {'LN_20','LN_18'}; subtitle4 = {'L-N at 20C and 18C'};
set5a = {'LWt_f5','LWt_f4','LWt_f3','LWt_f2'}; subtitle5a = {'L-Wt (EXPERIMENT 1)'};
set5b = {'LWafd_f5_E2','LWafd_f4_E2','LWafd_f3_E2','LWafd_f2_E2'}; subtitle5b = {'L-Wafd (EXPERIMENT 2)'};
set5c = {'LWt_f5_E2','LWt_f4_E2','LWt_f3_E2','LWt_f2_E2'}; subtitle5c = {'L-Wt (EXPERIMENT 2)'};
set5d = {'LWw_f5_E2','LWw_f4_E2','LWw_f3_E2','LWw_f2_E2'}; subtitle5d = {'L-Ww (EXPERIMENT 2)'};
set5e = {'LWd_f5_E2','LWd_f4_E2','LWd_f3_E2','LWd_f2_E2'}; subtitle5e = {'L-Wd (EXPERIMENT 2)'};
set5f = {'LEn_f5_E2','LEn_f4_E2','LEn_f3_E2','LEn_f2_E2'}; subtitle5f = {'L-Energy (EXPERIMENT 2)'};
set6a = {'tWt_f5','tWt_f4','tWt_f3','tWt_f2'}; subtitle6a = {'t-Wt (EXPERIMENT 1)'};
set6b = {'WtdWt_f5','WtdWt_f4','WtdWt_f3','WtdWt_f2'}; subtitle6b = {'Wt-dWt (EXPERIMENT 1)'};
set7 = {'tL_f5','tL_f4','tL_f3','tL_f2'}; subtitle7 = {'t-L (EXPERIMENT 1)'};
set8a = {'LdL_f5','LdL_f4','LdL_f3','LdL_f2'}; subtitle8a = {'L-dL (EXPERIMENT 1)'};
set8b = {'LdL_f5_EXP2','LdL_f4_EXP2','LdL_f3_EXP2','LdL_f2_EXP2'}; subtitle8b = {'L-dL (EXPERIMENT 2)'};
set9 = {'LJO_f5','LJO_f4','LJO_f3','LJO_f2'}; subtitle9 = {'O2 consumption'};
set10 = {'WwJX_f5','WwJX_f4','WwJX_f3','WwJX_f2'}; subtitle10 = {'Ingestion '};
set11 = {'WtdWt_f5_EXP2','WtdWt_f4_EXP2','WtdWt_f3_EXP2','WtdWt_f2_EXP2'}; subtitle11 = {'Wt-dWt (EXPERIMENT 2)'};
metaData.grp.sets = {set1,set2,set3,set4,set5a,set5b,set5c,set5d,set5e,set5f,set6a,set6b,set7,set8a,set8b,set9,set10,set11};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5a,subtitle5b,subtitle5c,subtitle5d,...
    subtitle5e,subtitle5f,subtitle6a,subtitle6b,subtitle7,subtitle8a,subtitle8b,subtitle9,subtitle10,subtitle11};

%% Discussion points
D1 = ['mod_1-DATA: replaced values for 0-variate data: ab, Lb, Wdb, Wdp, Wdi i Ri; ', ...
    'added 0-variate data:aj, Lj, Wdj, and 1-variate t-L for juveniles', ...
	'added 1-variate data: t-L_f, t-Wd_f, t-Ww_f, L-dL_f, L-Ww_f, L-Wd_f, Ww-dWw_f, L-JO_f, Ww-pX_f -- all of these at four food levels, L-N at two temperatures'];
D2 = 'mod_1-PARS: Parameters for the 5-par Arrhenius correction estimated on independent data with NelderMead (outside AmP routine); specific tissue densities calculated from data';
D3 = 'mod_1-PREDICT: different equation for EWd predictions in predict file; predictions for Site1 and Site2 (data from NIWA) calculating using initial values (as parameters) rather than calculate from metamorphosis onwards while assuming certain (actually unknown) environmental conditions';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Entry version 2024/03/08 is linked to a following publication: Cheng, M.C.F., Gecek, S., Marn, N.*, Giacoletti,A., Sara, G., King,N., Ragg, N.L.C. From Lab to Ocean: Leveraging targeted experiments for advancements in mussel aquaculture modeling, submitted to Aquaculture';
metaData.bibkey.F1 = 'ChenGece2024';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4F6T5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466851'; % Ency of Life
metaData.links.id_Wiki = 'Perna_canaliculus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4619774'; % Taxonomicon
metaData.links.id_WoRMS = '397169'; % WoRMS
metaData.links.id_molluscabase = '397169'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Perna_canaliculus}}';
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
bibkey = 'Alfa2001'; type = 'phdthesis'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Alfaro, A.C.}, ' ...
'year = {2001}, ' ...
'title  = {Ecological dynamics of the greenshell-lipped mussel, \emph{Perna canaliculus}, at {N}inety {M}ile {B}each, {N}orthern {N}ew {Z}ealand}, ' ...
'school = {University of Auckland}, ' ...
'pages = {238p}, ' ...
'howpublished = {\url{https://www.auckland.ac.nz}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buchann1998'; type = 'phdthesis'; bib = [ ...  
'author = {Buchann, S.}, ' ...
'year = {1998}, ' ...
'title  = {Spat production of the Greenshell mussel, \emph{Perna canaciliculus} in {N}ew {Z}ealand}, ' ...
'school = {Auckland University}, ' ...
'pages = {232p}, ' ...
'howpublished = {\url{https://www.auckland.ac.nz}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChenRagg2020'; type = 'misc'; bib = [ ...  
'author = {Cheng, M. and Ragg, N.}, ' ...
'year = {2020}, ' ...
'note  = {Unpublished data}, ' ...
'institution = {Cawthron Institute, Nelson 7071, New Zealand}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'ChenGece2024'; type = 'misc'; bib = [ ...   pseudodata
'author = {Cheng, M.C.F. and Ge\v{c}ek, S. and Marn, N.* and Giacoletti,A. and Sara, G. and King,N. and Ragg, N.L.C.}, ' ...
'year = {2024}, ' ...
'title  = {From Lab to Ocean: Leveraging targeted experiments for advancements in mussel aquaculture modeling}, ' ...
'note = {submitted to Aquaculture}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jenk1979'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Jenkins, Ronald James}, ' ...
'year = {1979}, ' ...
'title  = {Mussel cultivation in the {M}arlborough {S}ounds ({N}ew {Z}ealand)}, ' ...
'publisher = {N.Z. Fishing Industry Board, David F. Jones LTD, Wellington}, ' ...
'pages = {75pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NIWA'; type = 'misc'; bib = [ ...  
'author = {Ren, J}, ' ...
'year = {2018}, ' ...
'note  = {Unpublished data}, ' ...
'institution = {National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaggGale2019'; type = 'article'; bib = [ ... 
'author = {Ragg, Norman L. C. and Gale, Samantha L. and Le, Dung V. and Hawes, Nicola A. and Burritt, David J. and Young, Tim and Ericson, Jessica A. and Hilton, Zoe and Watts, Ellie and Berry, Jolene and King, Nick}, ' ...
'year = {2019}, ' ...
'title  = {The Effects of Aragonite Saturation State on HatcheryReared Larvae of the Greenshell Mussel \emph{Perna canaliculus}}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {38},' ...
'number = {3},'...
'pages = {779-793}, ' ...
'doi = {10.2983/035.038.0328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rusk2012'; type = 'phdthesis'; bib = [ ...  
'author = {Adam B. Rusk}, ' ...
'year = {2012}, ' ...
'title  = {Larval development of the {N}ew {Z}ealand mussel \emph{Perna canaliculus} and effects of cryopreservation}, ' ...
'school = {Auckland University of Technology}, ' ...
'pages = {180p}, ' ...
'howpublished = {\url{https://www.auckland.ac.nz}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RuskAlfa2017'; type = 'article'; bib = [ ... 
'author = {Adam B. Rusk and Andrea C. Alfaro and Tim Young and Ellie Watts and Serean L. Adams}, ' ...
'year = {2017}, ' ...
'title  = {Investigation of early mussel (\emph{Perna canaliculus}) development using histology, {SEM} imaging, immunochemistry and confocal microscopy}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {13},' ...
'number = {3},'...
'pages = {314 -- 329}, ' ...
'doi = {10.1080/17451000.2016.1257812}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
