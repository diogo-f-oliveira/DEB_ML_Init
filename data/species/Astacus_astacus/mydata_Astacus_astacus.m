function [data, auxData, metaData, txtData, weights] = mydata_Astacus_astacus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Astacidae';
metaData.species    = 'Astacus_astacus'; 
metaData.species_en = 'European crayfish'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah', 'ab', 'ap', 'am', 'Lh', 'Lb', 'Lp', 'Li', 'L_t', 'Wwb', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-L_f', 't-Ww_f', 'L-N', 'L-Ww'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; % curator: Starrlight Augustine
metaData.date_subm = [2017 08 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1    = {'Nina Marn', 'Ana Dobrovic', 'Sandra Hudina'};    
metaData.date_mod_1 = [2020 08 05];              
metaData.email_mod_1     = {'nina.marn@gmail.com'};            
metaData.address_mod_1   = {'Rudjer Boskovic Institute, Zagreb, Croatia'};

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2020 08 05]; 

%% set data
% zero-variate data

data.ah = 154;  units.ah = 'd'; label.ah = 'age at hatching'; bibkey.ah = 'PoliSimo2004';   
  temp.ah = C2K(10.45); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = ['Controlled temp: 154 days to hatch. Temp was 5.5 C during first 45 days, and 12.5C for remaining 109 days (gives a total of 154 days at the [weighted] average temp of 10.45C); 240 days in nature and there temps always lower)',...
      ' Eggs do not require a cold diapause (<5-6C) to develop but that increases their survival; 7-9 mnth under natural conditions'];
data.ab = data.ah + 7;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'HessTaug1987';   
  temp.ab = C2K(10.45); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'First moult takes place one week after hatching';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Abra1971';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Abra1971';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = {'HoldMalc2002', 'SoutHold2006'};   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Apparently 20 yrs in SoutHold2006, but Holdich 2002 has only >10 indicated';

data.Lh  = 0.9;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching'; bibkey.Lh  = 'HoldMalc2002';
  comment.Lh = '8.5 to 9 mm total length';
data.Lb  = 1.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth (stage 2)'; bibkey.Lb  = 'HoldMalc2002';
  comment.Lb = 'Second stage crayfish, similar to the adult crayfish except for the lack of the tail fan. Then they molt again after 3 weeks when they are 13-15 mm length, look like adults';
data.Lp  = 7.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Abra1971';
  comment.Lp = 'smallest value in LN data, HoldMalc2002 gives a range 6.2 cm to 8.5 cm total length';
data.Li  = 12;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'HoldMalc2002';
  comment.Li = 'Even though 15 cm listed as maximum size, it says that under favorable conditions, 90mm can be reached in 4 summers = probably 15cm is very rare';
data.Lim  = 16;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'HoldMalc2002';
  comment.Li = 'Wiki lists 16cm, HoldMalc2002 18 cm, but probably 18cm is very rare';
data.L2 = 4.7;    units.L2  = 'cm';  label.L2  = 'total length at 2yr for females'; bibkey.L2  = 'Abra1971';
  temp.L2 = C2K(10); units.temp.L2 = 'K'; label.temp.L2 = 'temperature'; 
data.L2m = 4.9;    units.L2m  = 'cm';  label.L2m  = 'total length at 2yr for males'; bibkey.L2m  = 'Abra1971';
  temp.L2m = C2K(10); units.temp.L2m = 'K'; label.temp.L2m = 'temperature'; 

data.Wwb = 1.4e-2; units.Wwb = 'g';   label.Wwb = 'dry weight at birth';       bibkey.Wwb = 'Abra1971';
  comment.Wwb = 'Based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwp = 18;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'Abra1971';
  comment.Wwp = 'Computed from 60 * (Lp/11.5)^3, (see F2), also fits data in MaguHudi2004';
data.Wwi = 68.2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';         bibkey.Wwi = 'MaguHudi2004';
  comment.Wwi = 'Computed from 60 * (Li/11.5)^3, (see F2), also fits data in MaguHudi2004';
data.Wwim = 161.5;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';         bibkey.Wwim = 'MaguHudi2004';
  comment.Wwim = 'Computed from 60 * (Lim/11.5)^3 , (see F2), also fits data in MaguHudi2004';

data.Ri = 200/365; units.Ri  = '#/d';    label.Ri = 'max reprod rate'; bibkey.Ri  = 'HoldMalc2002';
    temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'Number of attached eggs ranges from 80 -200, repro once per year, egg diameter 2.8 to 3.1 mm. At 90 mm total length, number of attached eggs can vary from 87 to 154 eggs';
  
%% univariate data
%  OTOCAC, Croatia, unpublished data; water avg temp 12.2C, for age, hatching on 1st July assumed (June/July)
% individuals kept at two diet types and two densities - some measurements are a mean of triplicates; 
% Set1: vegetables (V), low density (LD) (V-LD); Set 2: V, high density (HD) (V-HD),
% Set3: meet based (M), low density (M-LD); Set4: M-HD
% For the second part (age>715 days) same type of food but food quantity and temp unknown --> separate f introduced
% females
Females=[ %	Age	TL1	W1	TL2	W2	TL3	W3	TL4	W4
    339	28.71875	0.7165625	29.47368421	0.682280702		31.61764706	0.895588235	28.49253731	0.658059701
    379	31.04	0.8548	29.37078652	0.82494382		31.48837209	1.090930233	30.37974684	0.874303797
    407	34.33333333	1.0175	32.75824176	0.847912088		36.625	1.27275	34.98461538	0.981846154
    435	35.0952381	1.078809524	33.01111111	0.896333333		38.475	1.442	36.62857143	1.208285714
    486	37.35135135	1.394054054	34.86363636	1.082159091		38.89583333	1.66625	36.83098592	1.347323944
    
    715	42.08695652	2.037826087	40.1025641	1.695897436		40.95238095	1.80952381	41.92857143	1.977857143
    746	43.70833333	2.110416667	41.54054054	1.786756757		42	1.888181818	42.42307692	2.712307692
    785	47.28571429	2.707619048	42.67647059	2.064705882		44.4	2.1155	44.96428571	2.362857143
    809	45.9	2.932	43	2.238529412		44.27777778	   2.455	44.32142857	2.3925
    843	47.5	3.05	43.83333333	2.394666667		44.71428571	2.911428571	44.95652174	2.555652174
    ];
data.tL_VLDf = Females(:,[1,2]); data.tL_VLDf(:,2) = data.tL_VLDf(:,2)/10; %mm to cm 
 units.tL_VLDf   = {'d', 'cm'};  label.tL_VLDf = {'age', 'total length'};  
temp.tL_VLDf    = C2K(11);  units.temp.tL_VLDf = 'K'; label.temp.tL_VLDf = 'temperature';
bibkey.tL_VLDf = 'Bast2014'; 
comment.tL_VLDf = 'Otocac females; Vegetable diet, low density'; 									

data.tL_VHDf = Females(:,[1,4]); data.tL_VHDf(:,2) = data.tL_VHDf(:,2)/10; %mm to cm 
 units.tL_VHDf   = {'d', 'cm'};  label.tL_VHDf = {'age', 'total length'};  
bibkey.tL_VHDf = 'Bast2014'; 
comment.tL_VHDf = 'Otocac females; Vegetable diet, high density'; 									

data.tL_MLDf = Females(:,[1,6]); data.tL_MLDf(:,2) = data.tL_MLDf(:,2)/10; %mm to cm 
 units.tL_MLDf   = {'d', 'cm'};  label.tL_MLDf = {'age', 'total length'};  
bibkey.tL_MLDf = 'Bast2014'; 
comment.tL_MLDf = 'Otocac females; Meat diet, low density'; 									

data.tL_MHDf = Females(:,[1,8]); data.tL_MHDf(:,2) = data.tL_MHDf(:,2)/10; %mm to cm 
 units.tL_MHDf   = {'d', 'cm'};  label.tL_MHDf = {'age', 'total length'};  
bibkey.tL_MHDf = 'Bast2014'; 
comment.tL_MHDf = 'Otocac females; Meat diet, high density'; 									


data.tWw_VLDf = Females(:,[1,3]); units.tWw_VLDf   = {'d', 'g'};  label.tWw_VLDf = {'age', 'wet weight'};  
temp.tWw_VLDf    = C2K(11);  units.temp.tWw_VLDf = 'K'; label.temp.tWw_VLDf = 'temperature';
bibkey.tWw_VLDf = 'Bast2014'; 
comment.tWw_VLDf = 'Otocac females; Vegetable diet, low density'; 

data.tWw_VHDf = Females(:,[1,5]); units.tWw_VHDf   = {'d', 'g'};  label.tWw_VHDf = {'age', 'wet weight'};  
bibkey.tWw_VHDf = 'Bast2014'; 
comment.tWw_VHDf = 'Otocac females; Vegetable diet, high density'; 

data.tWw_MLDf = Females(:,[1,7]); units.tWw_MLDf   = {'d', 'g'};  label.tWw_MLDf = {'age', 'wet weight'};  
bibkey.tWw_MLDf = 'Bast2014'; 
comment.tWw_MLDf = 'Otocac females; Meat diet, low density'; 

data.tWw_MHDf = Females(:,[1,9]); units.tWw_MHDf   = {'d', 'g'};  label.tWw_MHDf = {'age', 'wet weight'};  
bibkey.tWw_MHDf = 'Bast2014'; 
comment.tWw_MHDf = 'Otocac females; Meat diet, high density'; 

Males=[ %	Age	TL1	W1	TL2	W2	TL3	W3	TL4	W4
    339	29.375	0.760625	29.35294118	0.693921569		32.72727273	1.001363636	28.85964912	0.690350877
    379	32.5	0.967692308	29.32653061	0.786122449		34.26666667	1.331333333	31.35294118	0.938823529
    407	35.2962963	1.077407407	34.02439024	0.914390244		38.19354839	1.425806452	36.80821918	1.186849315
    435	36.03030303	1.208484848	34.27118644	1.012711864		40.13513514	1.626216216	37.56	1.347066667
    486	37.05714286	1.320285714	35.3220339	1.118813559		41.25	1.940555556	38.73809524	1.612857143
    
    715	42.53846154	2.04	43	2.265277778		43.2	2.178466667	45.57446809	2.577446809
    746	43.66666667	2.140833333	43.71052632	2.21		45.30769231	2.533846154	46.08510638	2.615744681
    785	47.91666667	3.095	44.47368421	2.522368421		47.93333333	3.151333333	49.17777778	3.354666667
    809	45.5	2.971	45.97222222	2.873333333		49.07692308	3.535384615	48.70454545	3.489772727
    843	47.61904762	3.285238095	46.75	3.081666667		50.91666667	4.156666667	50.87179487	4.067948718
    ];
data.tL_VLDm = Males(:,[1,2]); data.tL_VLDm(:,2) = data.tL_VLDm(:,2)/10; %mm to cm 
 units.tL_VLDm   = {'d', 'cm'};  label.tL_VLDm = {'age', 'total length'};  
temp.tL_VLDm    = C2K(11);  units.temp.tL_VLDm = 'K'; label.temp.tL_VLDm = 'temperature';
bibkey.tL_VLDm = 'Bast2014'; 
comment.tL_VLDm = 'Otocac males; Vegetable diet, low density'; 									

data.tL_VHDm = Males(:,[1,4]); data.tL_VHDm(:,2) = data.tL_VHDm(:,2)/10; %mm to cm 
 units.tL_VHDm   = {'d', 'cm'};  label.tL_VHDm = {'age', 'total length'};  
bibkey.tL_VHDm = 'Bast2014'; 
comment.tL_VHDm = 'Otocac males; Vegetable diet, high density'; 									

data.tL_MLDm = Males(:,[1,6]); data.tL_MLDm(:,2) = data.tL_MLDm(:,2)/10; %mm to cm 
 units.tL_MLDm   = {'d', 'cm'};  label.tL_MLDm = {'age', 'total length'};  
bibkey.tL_MLDm = 'Bast2014'; comment.tL_MLDm = 'Otocac males; Meat diet, low density'; 									

data.tL_MHDm = Males(:,[1,8]); data.tL_MHDm(:,2) = data.tL_MHDm(:,2)/10; %mm to cm 
 units.tL_MHDm   = {'d', 'cm'};  label.tL_MHDm = {'age', 'total length'};  
bibkey.tL_MHDm = 'Bast2014'; comment.tL_MHDm = 'Otocac males; Meat diet, high density'; 									

% age - wet weight Otocac males
data.tWw_VLDm = Males(:,[1,3]); units.tWw_VLDm   = {'d', 'g'};  label.tWw_VLDm = {'age', 'wet weight'};  
temp.tWw_VLDm    = C2K(11);  units.temp.tWw_VLDm = 'K'; label.temp.tWw_VLDm = 'temperature';
bibkey.tWw_VLDm = 'Bast2014'; comment.tWw_VLDm = 'Otocac females; Vegetable diet, low density'; 

data.tWw_VHDm = Males(:,[1,5]); units.tWw_VHDm   = {'d', 'g'};  label.tWw_VHDm = {'age', 'wet weight'};  
bibkey.tWw_VHDm = 'Bast2014'; comment.tWw_VHDm = 'Otocac females; Vegetable diet, high density'; 

data.tWw_MLDm = Males(:,[1,7]); units.tWw_MLDm   = {'d', 'g'};  label.tWw_MLDm = {'age', 'wet weight'};  
bibkey.tWw_MLDm = 'Bast2014'; comment.tWw_MLDm = 'Otocac females; Meat diet, low density'; 

data.tWw_MHDm = Males(:,[1,9]); units.tWw_MHDm   = {'d', 'g'};  label.tWw_MHDm = {'age', 'wet weight'};  
bibkey.tWw_MHDm = 'Bast2014'; comment.tWw_MHDm = 'Otocac females; Meat diet, high density'; 


% Fig.3.	WestPurs1982 								
% population from river  Raudanjoki (Loppi, 600 40'N, 240 10'E), T unknown									
% females	
tL_fem = [ % summer	age (months) 	TL (mm)
1	2	16.942
2	14	32.941
3	26	48.96 % matches zero-variate data for 2yr (24mth) female TL = 4.7cm
4	38	62.856
5	50	73.057
6	62	79.009
7	74	84.819
]; tL_fem(:,2) = tL_fem(:,2)*30; tL_fem(:,3) = tL_fem(:,3)/10 ; % monhts to days, mm to cm
data.tL_Westf = tL_fem(:,[2,3]); units.tL_Westf   = {'d', 'cm'};  label.tL_Westf = {'age', 'total length'};  
temp.tL_Westf    = C2K(10);  units.temp.tL_Westf = 'K'; label.temp.tL_Westf = 'temperature';
bibkey.tL_Westf = 'WestPurs1982'; comment.tL_Westf = 'Females'; 


% males								
tL_m = [ % summer	age (months) 	TL (mm)
1	2	17.328
2	14	33.218
3	26	49.198 % matches zero-variate data for 2yr (24mth) male TL = 4.9cm
4	38	57.017 
5	50	73.049 
6	62	79.215
7	74	85.075
];  tL_m(:,2) = tL_m(:,2)*30; tL_m(:,3) = tL_m(:,3)/10 ; % mnth to days, mm to cm

data.tL_Westm = tL_m(:,[2,3]); units.tL_Westm   = {'d', 'cm'};  label.tL_Westm = {'age', 'total length'};  
temp.tL_Westm    = C2K(10);  units.temp.tL_Westm = 'K'; label.temp.tL_Westm = 'temperature';
bibkey.tL_Westm = 'WestPurs1982'; comment.tL_Westm = 'Males'; 


%--- age - wet weight----
% PoliSimo2004 - 2 groups of crayfish, one incubated in controlled conditions (termed "advanced") and the other incubated in nature
% isolated at stage 2 (=onset of feeding) and then reared in lab at T = 20.5C and daily ad libitum food (zooplankton); 
% first measurements 30 days after this isolation, and then every 30 days

data.tWw_Poli1 = [  % age (d), % wet wight (g) ; advanced
30	0.059
60	0.134
90	0.207
120	0.328
150	0.412
180	0.583]; 
units.tWw_Poli1   = {'d', 'g'};  label.tWw_Poli1 = {'age', 'wet weight'};  
temp.tWw_Poli1    = C2K(20.5);  units.temp.tWw_Poli1 = 'K'; label.temp.tWw_Poli1 = 'temperature';
bibkey.tWw_Poli1 = 'PoliSimo2004'; comment.tWw_Poli1 = 'eggs were incubated under controlled conditions (''advanced'')'; 

data.tWw_Poli2 = [  % age (d), % wet wight (g) ; advanced
30	0.051
60	0.13
90	0.307]; 
units.tWw_Poli2   = {'d', 'g'};  label.tWw_Poli2 = {'age', 'wet weight'};  
temp.tWw_Poli2    = C2K(20.5);  units.temp.tWw_Poli2 = 'K'; label.temp.tWw_Poli2 = 'temperature';
bibkey.tWw_Poli2 = 'PoliSimo2004'; comment.tWw_Poli2 = 'eggs were incubated under naturally'; 

% length-# of eggs
data.LN = [ ... % total length (cm), number of eggs (#)
7.711	61.674
7.812	60.465
8.004	57.643
8.008	70.140
8.008	45.550
8.101	97.550
8.199	69.736
8.203	39.504
8.210	132.620
8.211	74.171
8.293	49.178
8.304	91.504
8.305	72.155
8.305	68.124
8.305	61.674
8.402	81.023
8.410	73.364
8.411	56.837
8.495	117.705
8.500	79.411
8.500	46.760
8.528	117.302
8.605	132.217
8.606	54.016
8.610	91.101
8.610	62.078
8.707	129.798
8.708	77.395
8.708	74.574
8.708	53.612
8.712	31.845
8.802	42.326
8.804	134.233
8.805	83.039
8.805	77.798
8.805	60.465
8.806	56.434
8.809	121.333
8.809	73.364
8.809	69.333
8.903	81.023
8.903	53.612
8.905	180.589
9.004	106.419
9.004	92.713
9.004	89.488
9.005	58.450
9.009	79.411
9.099	10.078
9.106	122.140
9.107	12.899
9.205	26.202
9.207	158.822
9.208	91.907
9.208	89.085
9.213	55.628
9.220	125.364
9.306	92.310
9.313	164.868
9.407	105.612
9.407	101.581
9.407	93.519
9.407	88.682
9.420	67.721
9.505	97.953
9.505	92.310
9.603	100.372
9.610	110.047
9.699	169.705
9.705	81.023
9.705	73.767
9.709	85.054
9.709	60.868
9.717	64.899
9.798	97.147
9.904	102.791
9.997	104.806
10.096	50.388
10.103	110.047
10.301	172.930
10.302	129.395
10.305	195.101
10.501	156.806
10.603	122.140
10.807	141.488
11.001	168.899];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'number of eggs'};  
temp.LN    = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Abra1971';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
6.662	11.151
7.199	12.288
7.665	14.974
8.184	18.364
8.685	24.008
9.187	26.835
9.670	33.605
10.171	40.517
10.673	48.837
11.210	56.453
11.621	64.208
12.194	74.220];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Abra1971';

% length (CL (mm) - TL(mm))  - wet weight, Hudina 2011 (Medjimurje region, Croatia)
CLTLWw_m = [43.59	47.67	43.58	47.13	54.19	55.87	54.26	47.61	39.88	29.43	44.05	53.42	62.30	42.41	44.83	53.71	67.07	61.15	59.89	55.51	53.96	60.27	53.96	46.57	67.46	54.22	44.92	30.30	50.80	53.65	47.75	46.95	46.52	59.14	48.01	46.74	49.57	46.94	53.00	45.76	59.64	62.33	65.14	49.61	61.94	51.46	49.56	38.37	48.30	47.59	55.20	60.08	54.99	61.43	38.09	61.30	38.01	45.79
	100.42	109.95	101.27	106.93	127.8	120.94	122.5	109.14	97.66	77.01	102.79	123.14	140	98.21	105.51	123.26	142.56	133.66	131.35	123.34	123.16	132.22	125.74	112.1	146.13	121.98	102.37	75.89	115.89	120.37	113.16	106.12	106.74	132.71	110.09	106.08	111.56	111.65	121.39	106	129.3	137.5	140.31	116.29	126.76	111.93	112.46	91.86	108.49	106.36	122.9	127.77	122.35	130.47	89.39	132.76	89.9	105.61
	39	53	41	52	88	74	81	55	34	15	42	81	119	31	42	73	147	105	115	82	75	106	65	50	148	85	38	14	66	77	50	50	45	97	49	46	54	50	70	41	95	104	144	59	95	56	65	27	51	46	78	100	82	106	21	103	24	37
	]'; CLTLWw_m(:,1:2) = CLTLWw_m(:,1:2)/10; %mm to cm

CLTLWw_fem = [56.37	40.32	42.07	47.08	51.30	45.24	39.71	42.38	43.00	50.39	48.45	52.55	42.37	36.75	46.09	52.26	41.11	44.70	47.69	52.98	46.98	37.29	42.57	51.59	44.78	42.13	50.20	45.77	36.34	47.48	50.15	51.64	52.19	51.81	53.56																							
	125.06	95.42	101.22	114.09	117.92	111	97.99	102.49	103.74	115.55	120.51	125.87	106.29	90.2	109.91	118.55	99.33	107.32	114.8	122.27	113.33	90.01	103.1	119.07	109.6	104.24	119.78	108.29	89.15	112.77	115.78	119.52	122.33	120.26	124.06																							
	67	25	33	47	60	43	28	34	37	55	53	68	36	23	45	59	29	38	44	61	46	22	35	45	40	31	51	41	21	43	52	61	65	56	69																							
    ]'; CLTLWw_fem(:,1:2) = CLTLWw_fem(:,1:2)/10; %mm to cm
data.cLW_Hud_fem = CLTLWw_fem(:,[1,3]) ; units.cLW_Hud_fem   = {'cm', 'g'};  label.cLW_Hud_fem = {'carapace length', 'wet weight'};  
bibkey.cLW_Hud_fem = 'HudiJank2011';

data.cLW_Hud_m = CLTLWw_m(:,[1,3]); units.cLW_Hud_m   = {'cm', 'g'};  label.cLW_Hud_m = {'carapace length', 'wet weight'};  
bibkey.cLW_Hud_m = 'HudiJank2011';


% wet weight - TL(cm)) - length (CL (cm) -  Maguire 2004 ,Paklenica,
WwTLCL_fem	= [16	11	15.2	25.1	81.5	28	25	24	20.000	15.000	3.150	2.800	3.000	2.950	3.300	2.250	2.500	1.400	1.600	13.000	4.500	1.800	1.700	21.000	14.900	28.000	2.500	33.000	11.000	2.600	3.200	2.150	17.000	2.900	2.500	21.000	3.550	3.750	2.950	3.100	22.000	12.000	27.000	28.000	24.000	20.000	25.000	20.000	30.000	32.000	22.000	17.500	21.500	15.000	15.000	12.000	2.450	17.000	37.000	31.000	27.000	24.000	17.000	11.000	2.800	2.100	2.200	20.000	44.000	24.000	40.000	23.000	35.000	23.000	20.000	3.200	70.000	25.000	12.000	21.000	30.000	14.000	14.000	16.000	3.100	2.600	2.300	35.000	29.000	12.000	62.000	95.000	24.000	19.000	15.000	23.000	25.000	29.000	15.000	5.000	4.000	4.000	3.000	15.000	15.000	28.000	16.000	10.300	14.000	24.000	4.100	15.000	15.000	26.000	34.000	16.000	18.000	17.000	23	25	16.000	22.000	20.000	16.000	34.000	32.000	13.000	10.000	3.500	44.000	27.000	29.000	10.000	17.000	7.000	19.000	18.000	27.000	15.000	32.000	23.000	21.000	20.000	20.000	26.000	17.000	17.000	7.000	21.000	33.000	28.000	16.000	29.000	31.000	23	22.000	52.5	44	10.26	62	57.5	40	34	38	24	50	147	79	55	44	45	33	30	20	13	25	19	47	33	54	54	25	20	34	32
7.82	7.38	7.65	9.41	12.54	9.1	9.18	8.64	8.435	7.540	4.000	3.840	3.830	3.830	4.155	3.200	3.960	3.090	3.490	7.880	5.390	3.500	3.270	8.750	7.320	8.860	3.100	9.000	6.590	4.160	3.905	2.900	8.100	3.370	3.330	8.570	4.070	4.360	3.675	3.840	8.610	7.455	9.630	9.380	8.900	8.440	8.480	8.585	9.670	9.395	8.580	7.610	8.970	7.700	7.630	7.185	3.600	8.080	10.050	9.355	9.690	9.070	8.335	6.910	3.830	3.450	3.630	8.430	10.440	8.880	10.330	8.700	10.580	8.330	8.300	3.980	12.700	9.470	7.670	8.640	9.850	7.650	7.630	8.310	4.000	3.450	3.260	10.050	9.490	7.910	10.940	12.470	8.330	8.365	7.500	8.900	9.370	8.275	7.280	4.510	4.350	4.200	3.980	7.720	8.195	9.210	8.095	7.850	8.030	8.755	4.180	8.200	7.735	9.280	10.250	7.985	8.100	8.140	9.5	9.2	8.080	8.270	7.545	8.320	10.125	9.620	7.275	7.310	3.755	10.830	9.070	9.360	7.080	7.770	6.880	7.630	7.550	9.105	7.710	9.185	8.720	8.370	8.525	8.800	8.990	7.960	7.910	7.520	8.210	10.050	9.085	7.960	9.600	9.350	8.56	8.775	11.68	10.82	9.13	12.37	11.83	10.22	9.92	10.07	8.54	11.4	15.5	12.71	11.55	10.64	10.43	10.71	9.46	8.27	7.3	9	8.54	10.1	10.22	11.5	11.27	9.1	8.1	9.5	9.5
3.12	2.96	3	3.77	5.6	3.8	3.83	3.6	3.260	2.805	1.340	1.400	1.550	1.490	1.480	1.100	1.450	1.000	1.050	3.100	2.010	1.270	1.230	3.260	2.670	3.440	1.105	3.635	2.300	1.420	1.280	1.000	3.270	1.220	1.220	3.305	1.430	1.490	1.330	1.350	3.340	2.920	3.535	3.460	3.340	3.050	3.460	3.300	3.630	3.650	3.290	2.920	3.300	2.910	2.830	2.565	1.265	3.060	3.950	3.585	3.570	3.330	3.200	2.500	1.310	1.200	1.210	3.030	4.135	3.430	4.070	3.240	3.980	3.330	3.245	1.360	4.920	3.245	2.680	3.180	3.710	2.845	2.805	3.250	1.390	1.160	1.130	3.890	3.540	2.800	4.280	5.125	3.220	3.060	2.720	3.075	3.390	2.970	2.670	1.510	1.530	1.44	1.260	2.830	2.930	3.400	2.920	2.700	2.955	3.310	1.525	2.940	2.920	3.480	3.810	2.870	3.030	3.120	3.455	3.305	2.890	3.080	2.700	3.050	3.720	3.550	2.635	2.660	1.260	4.360	3.370	3.550	2.560	2.720	2.510	2.870	2.720	3.480	3.000	3.515	3.270	3.250	3.175	3.060	3.435	3.000	2.800	2.700	3.020	3.920	3.425	2.965	3.450	3.590	3.08	3.210	4.88	4.66	3.78	5.35	5.42	4.34	4.14	4.27	3.67	5	6.94	5.54	4.88	4.54	4.27	4.13	3.9	3.43	NaN	3.67	2	4.33	4.33	5.06	4.77	3.8	3.4	4.27	4
]';%WwTLCL_fem(:,2:3) = WwTLCL_fem(:,2:3)/10; %mm to cm

WwTLCL_m = [	50	120	71	85	114	61	108	91	131	30	60	22	24	20.05	110.2	51.5	29.5	40	100	38	28	20	18	27.000	30.000	20.000	58.000	18.000	22.000	42.000	64.000	25.000	32.500	3.200	1.800	52.000	45.000	4.200	3.500	3.000	2.200	2.505	32.000	90.000	92.000	62.000	26.000	40.000	44.000	23.000	1.800	1.700	2.500	70.000	18.000	3.700	2.800	1.900	2.000	2.000	68.000	30.200	17.500	12.000	80.000	54.000	50.000	57.000	10.000	2.300	3.800	43.000	3.150	2.200	2.100	99.000	142.000	28.000	114.000	37.000	63.000	14.000	35.000	40.000	23.000	10.000	3.100	2.650	3.800	30.000	41.000	13.000	80.000	28.000	3.500	3.550	3.000	2.800	18.000	20.000	19.000	40.000	20.000	16.000	23.000	33.000	20.000	24.000	27.000	14.000	28.000	18.000	20.000	31.000	14.000	4.800	2.500	3.800	3.000	3.000	2.500	20.000	33.000	49.000	42.000	30.000	17.000	68.000	7.000	14.000	31.000	35.000	16.000	24.000	17.000	40.000	40.000	24.000	16.000	26.000	21.000	10.160	2.500	3.900	16.000	52.000	14.000	2.700	3.200	3.350	2.150	24.000	23.000	15.000	30.000	12.000	3.000	4.000	12.000	30.000	17.000	12.000	14.000	33.000	20.000	28.000	25.000	55.000	16.000	32.000	18.000	21.000	22.000	25.000	30.000	21.000	35.000	28.000	16.000	14.000	142.000	88.000	100.000	13.000	58.000	28.000	98.000	154.000	30.000	31.000	55.000	57.000	10.000	34.000	18.000	42.000	22.000	102.000	21.000	20.000	23.000	77.000	73.000	13.000	16.000	25.000	20.000	22.000	14.000	13.000	17.000	52.000	22.000	23.000	94.000	25.000	65.000	20.000	25.000	18.000	30.000	31.000	130	92	31	113	48
		10.58	12.91	11.38	11.93	12.91	11.85	13.655	11.57	13.2	9.65	12.28	8.63	8.35	8.24	12.895	10.61	9.42	10.4	13.8	10.1	9.03	8.1	8.17	9.100	9.325	8.340	11.440	8.000	8.250	10.050	11.810	8.830	9.475	3.975	3.200	10.650	12.135	4.645	3.540	3.730	3.500	3.575	9.680	12.690	12.560	11.340	7.800	10.000	10.350	8.960	3.510	3.330	4.150	12.620	8.490	4.180	4.340	3.390	3.640	3.700	11.575	9.435	8.325	7.690	12.670	11.850	10.340	11.202	6.130	3.200	3.890	10.080	3.695	3.360	3.000	12.270	14.570	8.690	13.760	9.720	11.760	7.380	9.570	10.010	8.700	6.475	3.660	2.860	3.670	9.305	10.230	7.370	12.655	8.805	4.220	4.190	3.595	3.740	8.110	8.250	8.190	10.195	8.190	7.940	8.505	9.700	7.970	8.690	9.020	7.370	7.820	7.985	7.990	10.000	7.170	4.265	3.990	3.750	3.525	3.510	3.320	8.190	9.890	10.840	10.180	9.440	8.070	12.180	5.905	7.320	8.870	10.105	8.190	8.520	8.000	10.230	10.200	8.500	8.090	8.840	8.070	8.330	4.900	3.880	7.830	10.920	7.930	3.890	4.000	3.810	3.102	9.140	9.110	7.650	9.140	7.570	4.230	4.410	7.040	9.660	8.050	7.250	8.390	10.260	8.570	8.840	9.300	11.220	7.580	9.455	7.900	8.370	8.600	8.825	2.320	8.360	10.135	9.200	8.075	7.880	14.115	12.475	13.630	7.260	11.550	9.060	12.870	14.810	9.370	9.335	11.350	11.240	6.700	10.200	8.085	10.140	8.240	13.400	8.530	8.240	8.315	11.390	12.320	7.480	7.670	8.730	8.150	7.130	7.450	7.850	7.670	11.330	8.575	8.310	12.330	8.830	10.880	8.510	8.640	8.345	9.175	9.745	13.5	12.25	9.13	14.05	10.11
		4.11	6.82	4.195	4.96	5.34	4.23	5.3	5.55	6.68	3.49	6.05	3.54	2.74	3.135	5.57	4.77	3.97	4.55	6.54	4.07	3.8	3.47	3.34	3.520	3.740	3.140	4.200	3.110	3.210	4.045	4.750	3.630	3.930	1.540	1.140	4.410	5.070	1.610	1.240	1.400	1.240	1.270	3.660	5.550	5.230	4.820	3.060	4.190	4.350	3.430	1.200	1.195	1.250	4.235	3.340	1.700	1.660	1.270	1.000	1.300	5.660	3.565	3.150	2.740	5.425	5.100	4.450	4.540	2.250	1.130	1.450	3.900	1.201	1.160	0.990	5.240	6.350	3.480	6.000	4.065	4.300	2.620	3.930	3.855	3.365	2.370	1.305	1.030	1.260	3.975	4.145	2.650	5.270	3.345	1.420	1.430	1.325	1.300	3.200	3.210	3.090	3.950	2.980	2.760	3.300	3.540	3.000	3.400	3.330	2.850	3.170	2.990	3.190	3.840	2.700	1.465	1.340	1.210	1.200	1.240	1.060	3.140	3.920	4.250	4.040	3.790	2.890	5.000	2.210	2.715	3.540	4.170	2.910	3.440	3.030	3.990	3.870	3.360	3.040	3.435	3.240	3.010	1.680	1.355	2.830	4.360	3.000	1.485	1.270	1.390	1.050	3.600	3.420	2.790	3.630	2.720	1.57	1.450	2.550	3.730	2.965	2.610	3.075	4.125	3.330	3.260	3.565	4.405	2.660	3.765	2.800	2.990	3.300	3.410	3.200	2.950	3.860	3.350	2.880	2.720	5.940	5.000	5.385	2.690	4.740	3.470	5.320	6.410	3.650	3.640	4.255	4.500	2.500	3.920	3.030	4.070	3.165	5.730	3.180	2.870	3.200	4.790	5.820	2.700	2.850	3.220	3.020	2.700	2.650	2.850	3.000	4.600	3.200	3.185	5.020	3.320	2.610	3.140	3.400	3.000	3.390	3.685	6.08	5.44	4.06	6.4	4.35
        ]';%WwTLCL_m(:,2:3) = WwTLCL_m(:,2:3)/10; %mm to cm
data.LWw_Mag_fem = WwTLCL_fem(:,[2,1]) ; units.LWw_Mag_fem   = {'cm', 'g'};  label.LWw_Mag_fem = {'total length', 'wet weight'};  
bibkey.LWw_Mag_fem = 'MaguHudi2004'; 

data.LWw_Mag_m = WwTLCL_m(:,[2,1]); units.LWw_Mag_m   = {'cm', 'g'};  label.LWw_Mag_m = {'total length', 'wet weight'};  
bibkey.LWw_Mag_m = 'MaguHudi2004'; 


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_VLDf','tL_VHDf', 'tL_MLDf', 'tL_MHDf'}; subtitle1 = {'Females with veg, meat diet at low & high density'};
set2 = {'tL_VLDm','tL_VHDm', 'tL_MLDm', 'tL_MHDm'}; subtitle2 = {'Males with veg, meat diet at low & high density'};
set3 = {'tWw_VLDf','tWw_VHDf', 'tWw_MLDf', 'tWw_MHDf'}; subtitle3 = {'Females with veg, meat diet at low & high density'};
set4 = {'tWw_VLDm','tWw_VHDm', 'tWw_MLDm', 'tWw_MHDm'}; subtitle4 = {'Males with veg, meat diet at low & high density'};
set5 = {'tL_Westf','tL_Westm'}; subtitle5 = {'Data for females and males, WestPurs1982'};
set6 = {'tWw_Poli1','tWw_Poli2'}; subtitle6= {'Data after two incubation types, PoliSimo2004'};
set7 = {'cLW_Hud_fem','cLW_Hud_m'}; subtitle7 = {'Data for females and males, HudiJank2011'};
set8 = {'LWw_Mag_fem', 'LWw_Mag_m'};  subtitle8 = {'Data for females and males, Magu2004 '};
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5, subtitle6, subtitle7, subtitle8};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only.';
D2 = ['mod_1: Added zerovariate data: ah, Lh, Lb, Ri; and datasets for growth - tL_f, tWw_f for males and females, and ', ...
    'datasets for carapaca and total length vs wet weight for males and females. (COMPLETE level bumped from 2.5 up to 3.2). Added facts F3, F4'];
D3 = 'mod_1: Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3', D3);  

%% Facts
F1 = 'Eggs are glued to hairs under the abdome; after hatching the young continue to cling to the hairs, moult 2 or 3 times and a miniature crayfish walks off';
metaData.bibkey.F1 = 'KoesSoes2011'; 
F2 = 'TL 11.5 cm  weighs 60 g';
metaData.bibkey.F2 = 'Mull1973'; 
F3 = ['mod_1: Incubation in nature is relatively long, as for other Astacidae: lasts 160 to 270 days (1500 to 2200 thermal units) and includes a cold diapause (Table 13.1 in Holdich 2002).', ...
    'Skipping the diapause by warmer temperatures shortens the incubation but can reduce later survival and growth.'];
metaData.bibkey.F3 = 'HoldMalc2002';
F4 = 'mod_1: Adaptations to freshwater habitat includes relatively few yolk-rich eggs combined with the loss of free larvae (direct development), and brood care pattern.';
metaData.bibkey.F4 = 'HoldMalc2002';
metaData.facts = struct('F1',F1,'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '7R7BP'; % Cat of Life
metaData.links.id_ITIS = '97333'; % ITIS
metaData.links.id_EoL = '46774284'; % Ency of Life
metaData.links.id_Wiki = 'Astacus_astacus'; % Wikipedia
metaData.links.id_ADW = 'Astacus_astacus'; % ADW
metaData.links.id_Taxo = '33912'; % Taxonomicon
metaData.links.id_WoRMS = '877649'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Astacus_astacus}}';
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
bibkey = 'Abra1971'; type = 'Article'; bib = [ ... 
'author = {S. A. A. Abrahamsson}, ' ... 
'year = {1971}, ' ...
'title = {Density, growth and reproduction in populations of \emph{Astacus astacus} and \emph{Pacifastacus leniusculus} in an isolated pond}, ' ...
'journal = {Oikos}, ' ...
'volume = {2}, ' ...
'pages = {373--380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bast2014'; type = 'mastersthesis'; bib = [...
'title = {Utvrdjivanje optimalnih uvjeta za rast juvenilnih rije\v{c}nih rakova (Identification of optimal conditions for juvenile noble crayfish growth)}, '...
'author = {Jelena Basta},' ...
'school = {University of Zagreb, Faculty of Science, Division of Biology},'...
'year = {2014},'...
'address = {Zagreb},'...
'howpublished = {Diplomski rad // Master thesis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HessTaug1987'; type = 'Article'; bib = [ ... 
'author = {D. O. Hessen and T. Taugb{\o}l and E. Fjeld and J. Skurdal}, ' ... 
'year = {1987}, ' ...
'title = {Egg Development and Lifecycle Timing in the Noble Crayfish (\emph{Astacus astacus})}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {64}, ' ...
'pages = {77--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoldMalc2002'; type = 'Book'; bib = [ ...  
'author = {Holdich, David Malcolm and others}, ' ...
'year = {2002}, ' ...
'editor = {David M Holdich }, '...
'title  = {Biology of freshwater crayfish}, ' ...
'isbn = {978-0-632-05431-2}, '...
'publisher = {Blackwell Science Oxford}, ' ...
'pages = {720 Pages}, ' ...
'howpublished = {\url{https://www.wiley.com/en-us/Biology+of+Freshwater+Crayfish-p-9780632054312}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HudiJank2011'; type = 'Article'; bib = [ ... 
'author = {Hudina, Sandra and Jankovic, Sara and Lucic, Andreja and Zganec, Kresimir}, ' ... 
'year = {2011}, ' ...
'title = {The status of \textit{Astacus astacus} in the northernmost part of {C}roatia ({M}edjimurje County) in the face of invasion by \textit{Pacifastacus leniusculus} ({C}rustacea: {A}stacidae)}, ' ...
'journal = {Lauterbornia}, ' ...
'volume = {72}, ' ...
'pages = {31 -- 44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoesSoes2011'; type = 'Book'; bib = [ ... 
'author = {Koese, B. and Soes. M.}, ' ...
'year = {2011}, ' ...
'title  = {De {N}ederlandse rivierkreeften ({A}stacoidea \& {P}arastacoidea)}, ' ...
'series = {Entomologische tabellen}, ' ...
'publisher = {Ned. Entomol. Vereniging}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaguHudi2004'; type = 'Article'; bib = [ ... 
'author = {Maguire, Ivana and Hudina, Sandra and Erben, Radovan}, ' ... 
'year = {2004}, ' ...
'title = {Estimation of noble crayfish (\textit{Astacus astacus} L.) population size in the {V}elika {P}aklenica Stream ({C}roatia)}, ' ...
'journal = {Bulletin Francais de la Peche et de la Pisciculture}, ' ...
'volume = {372-373}, ' ...
'note = {unpublished data linked to the study},'...
'pages = {353--366}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mull1973'; type = 'Book'; bib = [ ...  
'author = {M\"{u}ller, H.}, ' ...
'year = {1973}, ' ...
'title  = {Die {F}lusskrebse; die langschw\"{a}nzigen {D}ecapoda {M}itteleuropas und ihre wirtschaftliche {B}edeutung}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'volume = {121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoliSimo2004'; type = 'Article'; bib = [ ... 
'author = {Policar, T and Simon, V and Kozak, P}, ' ... 
'year = {2004}, ' ...
'title = {Egg incubation in the noble crayfish (\textit{Astacus astacus} {L}.): The effect of controlled laboratory and outdoor ambient condition on hatching success, growth and survival rate of juveniles}, ' ...
'journal = {Bulletin Francais de la Peche et de la Pisciculture}, ' ...
'volume = {372-373}, ' ...
'pages = {411--423}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SoutHold2006'; type = 'Book'; bib = [ ... 
'author = {Souty-Grosset, C. and Holdich, D. M. and No\"{e}l, P. Y. and Reynolds, J. D. and Haffner, P.}, ' ...
'year = {2006}, ' ...
'title  = {Atlas of crayfish in Europe}, ' ...
'series = {Entomologische tabellen}, ' ...
'publisher = {Publications Scientifiques du MNHN}, ' ...
'address = {Paris}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WestPurs1982'; type = 'Incollection'; bib = [ ... 
'author = {Westman, K and Pursiainen, M}, ' ... 
'year = {1982}, ' ...
'title = {Size and structure of crayfish (\textit{Astacus astacus}) populations on different habitats in {F}inland}, ' ...
'booktitle = {Lakes and Water Management. Developments in Hydrobiology 7, vol 7.}, ' ...
'publisher = {Springer}, ' ...
'editor = {Ilmavirta, V. and Jones, R.I. and Persson, P.E.}, ' ...
'isbn = {978-94-009-8005-1}, ' ...
'doi = {10.1007/978-94-009-8003-7_9}, ' ...
'pages = {67--72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
