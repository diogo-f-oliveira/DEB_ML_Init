function [data, auxData, metaData, txtData, weights] = mydata_Caretta_caretta_MED
      
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Caretta_caretta_MED'; 
metaData.species_en = 'loggerhead turtle, Mediterranean population'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; % tags for different types of zero-variate data
metaData.data_1     = {'T-ah'; 't-L_fT'; 't-Ww_T';'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Nina Marn'};    
metaData.date_subm = [2017 04 18];              
metaData.email    = {'nina.marn@gmail.com'};            
metaData.address  = {'Rudjer Boskovic Institute, 10000, Croatia'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Nina Marn'};    
metaData.date_mod_2     = [2018 04 17];              
metaData.email_mod_2    = {'nina.marn@gmail.com'};            
metaData.address_mod_2  = {'Rudjer Boskovic Institute, 10000, Croatia'};    

metaData.author_mod_3   = {'Nina Marn'};    
metaData.date_mod_3     = [2018 05 25];              
metaData.email_mod_3    = {'nina.marn@gmail.com'};            
metaData.address_mod_3  = {'Rudjer Boskovic Institute, 10000, Croatia'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 05 26]; 

%% set data
% zero-variate data (typically depend on scaled functional response f. *The value of f is specified in pars_init_my_pet.)

% wild populations of Mediterranean sea (MED) - assumed f_NA = Li/Lm = 90/130 = 0.69;
% (Lm = 130 cm SCL, reported as largest nesting female in North Carolina <FrazScwa1984>) 
% avg repro Ri_NA = 4 clutches*100 eggs/2yrs

data.ah = 49.08; units.ah = 'd'; label.ah = 'age at hatch';    bibkey.ah = 'ReidMarg2009';   
  temp.ah = C2K(30);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = data.ah +4.1+2; units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = {'GodfMros1997','Stok2014'};   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
   comment.ab = 'age at birth = hatch + emerge (4.1d for 30C, GodfMros1997) + relying on yolksac (2-3d, Stok2014)';
data.tp = 18;   units.tp = 'yr';    label.tp = 'age at puberty';      bibkey.tp = {'CasaCont2011','PiovClus2011'};
    % reported in years to get a better idea for the data vs. prediction, but calculations are done in predict file in days and then converted to years
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'range between 16-28 by Casale; 24 yrs in PiovClus; temp taken as average SST in eastern Med, Nykj2009';
data.am = 67;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'Wiki';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 4.04;   units.Lb  = 'cm';  label.Lb  = 'SCL at birth';       bibkey.Lb  = {'MargArga2003','ReidMarg2009'};  
data.Lp_SCL  = 62.5;        units.Lp_SCL  = 'cm';  label.Lp_SCL  = 'SCL at puberty';     bibkey.Lp_SCL  = {'MargArga2003','Groom1990', 'TiwaBjor2000'}; 
  comment.Lp_SCL = 'SCL, mean of mins of reproducing females in Mediter';
data.Lp_CCL  = 69;        units.Lp_CCL  = 'cm';  label.Lp_CCL  = 'CCL at puberty';     bibkey.Lp_CCL  = {'MargArga2003','Groom1990', 'TiwaBjor2000'}; 
  comment.Lp_CCL = 'CCL, mean of mins of reproducing females in Mediter';
data.Li_SCL  = 87;     units.Li_SCL  = 'cm';  label.Li_SCL  = 'ultimate SCL';       bibkey.Li_SCL  = {'MargArga2003','Groom1990'};
  comment.Li_SCL = 'SCL, mean of max in <MargArga2003> and <Groom1990>); largest nesting female in Greece is 95cm SCL <MargArga2003>, mostly smaller';
  % used for first guestimation of f as 87/130cmSCL (same as NA loggs) =0.67
data.Li_CCL  = 91;     units.Li_CCL  = 'cm';  label.Li_CCL  = 'ultimate CCL';       bibkey.Li_CCL  = {'MargArga2003','Groom1990'};
  comment.Li_CCL = 'CCL, mean of max in <MargArga2003> and <Groom1990>); largest nesting female in Greece is 99cm CCL <MargArga2003>, mostly smaller';

  
data.Wwb = 15.59;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'MargArga2003','ReidMarg2009'};
    comment.Wwb = 'calculated from refs in <MargArga2003>';
data.Wwp = 52e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Groom1990';
  comment.Wwp = 'varying data,  from <Grooom1990> (range 52.5-87kg, for Greece - larger females there)';
data.Wwi = 87e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Groom1990';
  
data.E0 = 170e3; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = 'HaysSpea1991';   
  comment.E0 = 'range 165-260kJ'; 

data.Ri  = 2.2 * 160/ (2 * 365); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'BrodGlen2003', 'TiwaBjor2000'};   
  % MAX repro at *ultimate* size; calculations for LF (uni-var data) have AVERAGE repro
   temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    % temp for reproduction should maybe be higher because they spend more time in the
    % warmer waters
  comment.Ri = ['calculated as number of nests per nesting season (2.2,{BrodGlen2003})',...
      'multiplied by number of eggs per clutch (160,{MargArga2003,Groom1990,TiwaBjor2000})',...
      'and divided by the interval between two nesting seasons (2 yr,{BrodGlen2003})', ...
      'varying data; seems like clutches >150 eggs are more frequent than in NA, but fewer clutches per nesting season']; 
  
 %%%%%%%%%%%%%% UNI-VARIATE data %%%%%%%%%%%%%%%%%%
% === INCUBATION DATA ===   
% incub_temp(C), %incub_dur(d)(hatching), 
Tt_incub = [27.6  62.53  
    30    49.08 
    31.8  44.87
    ];
data.Tah_Reid = Tt_incub; units.Tah_Reid  = {'C', 'd'};
label.Tah_Reid = {'temperature', 'age at hatching'}; bibkey.Tah_Reid = 'ReidMarg2009';

Tt_incub = [ % Zbinden+2006
28.46	29.18   29.5	29.57   29.63   29.75   29.96   29.27   30.19   30.33   30.22   30.69   30.85   30.62   30.67   30.8    30.1    31.05   31.1
55.02	55.02   55.02	55.02	51.98	48.01	50.01	53   	48.99	50.02	51  50.99	50.01	48.01	48   	46.98	51  	50.99	50.01
  ]';
data.Tah_Zbin = Tt_incub; units.Tah_Zbin  = {'C', 'd'}; 
label.Tah_Zbin = {'temperature', 'age at hatching'}; bibkey.Tah_Zbin = 'ZbinMarg2006';

% === HATCHLINGS & JUVENILES, captive === 
%%%%%%%% ALL data from Sidonie Catteau, from Mediteran (Marineland Antibes aq.)
% food and temp known, except for some turtles (marked as T_unkn here).

% ----- TIME - WET WEIGHT--------- %%%%%%  
% time(age, d), % weight (turtle T3) %weight (turtle T4)
tWt_T3T4 = [0.001	41	55	102	109	116	130	137	151	158	165	172	179	186	193	200	207	214	221	235	242	249	256	263	305	313	327	348	361	375	389	396	402	975	1105	1313	1452
    23.1	67.9	109.7	178.3	185.3	211.5	179.5	202	258.4	282.9	296.3	328.6	365.1	393.1	418.8	439.1	482.6	508.1	556.4	663	712.1	745.6	813.6	905.2	1228.8	1330	1530	1720	2134.8	2145.6	2220.9	2014.5	1960	NaN 	22400	37500	47000
    23.5	71.7	104	158.7	167.3	203	207.5	223	264	283.5	288.9	298	326.5	345.1	372.5	380.4	407	435.9	465.1	542.5	568.7	581.2	623.1	687.9	1006.4	1111.1	1260	1508.8	1596.4	1687.3	1689.9	1735	1700	12660	13900	21300	30000
    ]';
% exclude NaN values
ok = find(~isnan(tWt_T3T4(:,2)));
tW_T3 = [tWt_T3T4(ok,1), tWt_T3T4(ok,2)]; tW_T4 = [tWt_T3T4(:,1)+.01, tWt_T3T4(:,3)];  
data.tW_T3T4 = sortrows([tW_T3;tW_T4]);bibkey.tW_T3T4 = 'Cate2014'; 
  units.tW_T3T4 = {'d', 'g'};     label.tW_T3T4 = {'time since birth', 'total wet weight'}; 
  temp.tW_T3T4 = C2K(23.5); units.temp.tW_T3T4 = 'K'; label.temp.tW_T3T4 = 'temperature';
%%% %%%%%%  
%%%% 6 turtles, kept at  f = 1, T = 23.5 C: 2206, 2211, 2220, 2221, 2222, 2224
%%%%%%  
tWt_2206 = [0.001	17	24	31	38	45	52	59	66	73	80	87	94	101	108	115	124	129	135	178	186	192	195	199	216	229	256	285	342	630	731	968	1095
    18.2	22.2	28.4	42.7	54.8	68.6	81.8	100.2	125.4	143.2	157.3	173.4	190.1	213.8	233.6	271.3	292.3	300.7	327.7	344.2	367.7	373.1	385.5	391	418.5	448	522.4	647.1	838.5	3453	5020	9400	11120
    ]';
tWt_2211 = [0.001	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	122	127	133	176	184	190	193	197	214	227	254	283	340	517	628	729	852	1093
    19	32.6	46.7	62.5	83.2	100.4	120	142	178.9	205.7	225.5	255.3	277.9	306.6	320	359.2	370	378.4	408	533.5	549.7	563.9	596.5	638.5	678	764	895.1	1056.7	1431.6	2050	4440	6008	9800	18800
    ]'; tWt_2211(:,1) = tWt_2211(:,1) + .01; % to ensure different t entries
tWt_2220 = [0.001	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	122	127	133	176	184	190	197	214	227	254	283	340	729	966	1093
    18.4	28.1	40.1	53.3	69.8	91.2	110.6	128.4	166.1	177.5	191.2	222.9	247	272.7	295.7	335.8	364	379.8	397.4	525.4	533.2	552.5	613.2	681	690.9	776.7	889.2	1132.4	4800	10610	14800
    ]'; tWt_2220(:,1) = tWt_2220(:,1) + .02; % to ensure different t entries
tWt_2221 = [0.001	14	21	28	35	42	49	56	63	70	77	84	91	98	105	112	121	126	132	175	183	189	196	213	226	253	282	339	627	728	851	1018	1106
    18.9	28.7	40.6	53.5	69.2	86.1	101.3	121.9	156.6	188.4	206.8	233.2	255.6	282.7	308.8	352.4	377.5	395	415.6	543	579.3	571.9	631	686	746.2	845.5	943.4	1242.5	4600	6000	9400	13890	16350
    ]';  tWt_2221(:,1) = tWt_2221(:,1) + .03; % to ensure different t entries
tWt_2222 = [0.001	14	21	28	35	42	49	56	63	70	77	84	91	98	105	112	121	126	132	175	183	189	196	213	226	253	282	339	627	728	882	1092
    18.8	28	37.2	50.8	62.2	78.5	92.2	105.9	134.3	154.8	167.1	185.3	210.1	230.6	253.8	283.5	305.2	313.8	334.6	427.9	461.9	473.6	521.4	590.8	611.4	691.4	813.1	1057	4680	6200	9160	15040
    ]';  tWt_2222(:,1) = tWt_2222(:,1) + .04; % to ensure different t entries
tWt_2224 = [0.001	13	20	27	34	41	48	55	62	69	76	83	90	97	104	111	120	125	131	174	188	191	195	212	225	252	281	338	626	727	850	881	964
    37.2	47.9	61.2	73.3	87.4	100.9	128.6	142.8	156.6	180	195.6	215.1	233.5	259.1	280.1	281.1	305.6	381.8	404.3	412	441.4	492.5	485.3	567.3	678.5	567.3	678.5	870.6	2730	3940	6900	7500	9250
    ]';  tWt_2224(:,1) = tWt_2224(:,1) + .05; % to ensure different t entries
data.tW_Cate23 = sortrows([tWt_2206; tWt_2211; tWt_2220; tWt_2221; tWt_2222; tWt_2224]); % at 23.5 C
bibkey.tW_Cate23 = 'Cate2014';units.tW_Cate23 = {'d', 'g'}; label.tW_Cate23 = {'time since birth', 'total wet weight'};  
temp.tW_Cate23 = C2K(23.5); units.temp.tW_Cate23 = 'K'; label.temp.tW_Cate23 = 'temperature';
 
%%%%%% 2 turtles, transferred to Oceanopolis (T=25C): 2202, 2213
  temp1 = C2K(23.5); temp2 = C2K(25); 
tWt_2202 =[0.001	18	25	32	39	46	53	60	67	74	81	88	95	102	109	116	125	130	136	179	187	193	196	200	217	230	257	286	343	519
    17.6	21.9	27	36.1	47.5	57.1	70.5	79.6	100.5	118.3	123.6	137.4	154.8	167.3	186	216.7	229.8	239.9	258.9	357.4	377.8	379.5	392.1	406	446.6	493.5	576.6	724.8	874.5	1618   ]';
tWt_2202b = [ 522   530   546    589    614    645    673    710    737    764    799    827    855    1010
    1680  1578   1851   2456   2990   3580   4140   5250   6820   7390   9180  10800  12700  22500
    ]';% this is one of the fastest growing turtles in the bunch
tWt_2213 = [0.001	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	122	127	133	176	184	190	197	214	227	254	283	340	517
    19	27.1	38.5	52.1	68.4	84.4	103.1	121.9	157.7	177.8	197.3	217.5	243.1	269.7	300.8	342.9	369.3	373.2	413.9	540	570.4	589.3	656	691.5	750.1	859.1	1028.6	1380.6	2224  
    ]'; tWt_2213(:,1) = tWt_2213(:,1) + .01; % to ensure different t entries
tWt_2213b = [519	527	543	586	611	642	670	707	734	761	796	824	852	1007
    2580	2760	3116	3865	4750	5500	5970	7080	9280	9650	11400	12800	15000	23100
    ]'; tWt_2213b(:,1) = tWt_2213b(:,1) + .01; % to ensure different t entries

data.tW_Cate23_25 = [ sortrows([tWt_2202; tWt_2213]); sortrows([tWt_2202b; tWt_2213b]) ]; % at 23+25 degrees
bibkey.tW_Cate23_25 = 'Cate2014'; units.tW_Cate23_25 = {'d', 'g'}; label.tW_Cate23_25 = {'time since birth', 'total wet weight'}; 
temp.tW_Cate23_25 = [data.tW_Cate23_25(:,1) , ... % pack time and temperatures
    [ones(length(tWt_2202)+length(tWt_2213),1)* temp1; ones(length(tWt_2202b)+length(tWt_2213b),1)* temp2 ] ];
units.temp.tW_Cate23_25 = 'K'; label.temp.tW_Cate23_25 = 'temperature';
treat.tW_Cate23_25 = {0}; units.treat.tW_Cate23_25 = ''; label.treat.tW_Cate23_25 = '';

%%%%%% 2 turtles, transferred to Le Croisic (T=22C): 2207, 2215
temp2 = C2K(22);
tWt_2207 = [0.001	16	23	30	37	44	51	58	65	72	79	86	93	100	107	114	123	128	134	177	185	191	194	198	215	228	255	284	341
    17	23.2	30.6	36.1	47.2	58	71.6	81.2	101.4	116.6	124.5	138.6	147.3	163.2	172.9	202.6	222.2	231.3	253.2	443.4	475.3	484.9	501.9	543	579.4	632.2	708	852.2	1155.3   ]';
tWt_2207b = [811   940   973 1003    1020    1064
    6340  8900  9524  10700  11440  11680   ]'; 
tWt_2215 = [0.001	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	122	127	133	176	184	190	197	214	227	254	283	340
    19.1	29.1	38.9	51	67.6	72.7	89.6	107.3	142.8	166.7	178	189.6	199.7	220.7	254.9	301.6	330.3	346.5	377.1	532	560.5	563	637.8	708.5	765	913.4	1077.2	1320
    ]'; tWt_2215(:,1) = tWt_2215(:,1) + .01; % to ensure different t entries
tWt_2215b = [628    729	810	939	972	1002	1019	1063
    4195	5180	6320	8160	8764	9920	10120	10240
    ]'; tWt_2215b(:,1) = tWt_2215b(:,1) + .01; % to ensure different t entries
data.tW_Cate23_22 = [ sortrows([tWt_2207; tWt_2215]); sortrows([tWt_2207b; tWt_2215b]) ]; % at 23+22 degrees
bibkey.tW_Cate23_22 = 'Cate2014'; units.tW_Cate23_22 = {'d', 'g'}; label.tW_Cate23_22 = {'time since birth', 'total wet weight'}; 
temp.tW_Cate23_22 = [data.tW_Cate23_22(:,1) , ... % pack time and temperatures
    [ones(length(tWt_2207)+length(tWt_2215),1)* temp1; ones(length(tWt_2207b)+length(tWt_2215b),1)* temp2 ] ];
units.temp.tW_Cate23_22 = 'K'; label.temp.tW_Cate23_22 = 'temperature';
treat.tW_Cate23_22 = {0}; units.treat.tW_Cate23_22 = ''; label.treat.tW_Cate23_22 = '';

%%% 4 turtles, transferred but new temp unknown : 2208, 2209, 2210, 2223
temp2 = C2K(23.5); % assumed!
tWt_2208 = [0.001	16	23	30	37	44	51	58	65	72	79	86	93	100	107	114	123	128	134	177	185	191	194	198	215	228	255	284	341
    19.1	28.2	39.4	51.8	70.1	88	106.2	126.2	153.4	179	197	223.7	243.9	263.8	293.2	330.6	353.6	362	389.4	529.2	556.8	556.2	595.5	632.4	676.4	743.8	814.8	920.2	1168    ]'; 
tWt_2208b = [629.00   730.00   811.00
  3530.00  4560.00   5760.00]'; % temp unknown
tWt_2209 = [0.001	16	23	30	37	44	51	58	65	72	79	86	93	100	107	114	123	128	134	177	185	191	194	198	215	228	255	284	341
    16.7	26.6	31.2	44.9	55.6	67.5	80	94.9	114.1	130	136.8	148.6	165	176.6	190.8	209.6	224.2	231.1	251.8	336	361.9	364.8	373.1	385.5	411	443	537.7	684.9	884.8
    ]'; tWt_2209(:,1) = tWt_2209(:,1) + .01; % to ensure different t entries
tWt_2209b = [629.00    730.00	 811.00	
    2900.00  4520.00 5620.00 
    ]'; tWt_2209b(:,1) = tWt_2209b(:,1) + .01; % to ensure different t entries
tWt_2210 = [0.001	16	23	30	37	44	51	58	65	72	79	86	93	100	107	114	123	128	134	177	185	191	194	198	215	228	255	284	341
    18.6	26.5	34.7	46.1	59.8	72.5	89.1	103.8	128.1	146.3	168.3	180.8	202.2	230.1	251.3	286.6	312.8	328.6	356	475	511.3	525.6	525.7	559.4	601	625	734.7	870.3	1202.5
    ]'; tWt_2210(:,1) = tWt_2210(:,1) + .02; % to ensure different t entries 
tWt_2210b = [ 629	730	884	1014	1076
    3360	4500	7340	9800	11460
    ]'; tWt_2210b(:,1) = tWt_2210b(:,1) + .02; % to ensure different t entries
tWt_2223 = [0.001	13	20	27	34	41	48	55	62	69	76	83	90	97	104	111	120	125	131	174	182	188	195	212	225	252	281	338
    19.6	29.4	41.9	53.4	71.3	83.1	99.9	119.5	157.8	177	196	209.1	224.4	246.1	284.4	317.2	336.5	353.2	386	466.7	521.6	515.1	569.2	640.6	660.4	769.1	895	1127
    ]'; tWt_2223(:,1) = tWt_2223(:,1) + .03; % to ensure different t entries
tWt_2223b = [626.00  727.00  881.00  1073.00 
     3873.00    4760.00   9500.00     14100.00 
     ]'; tWt_2223b(:,1) = tWt_2223b(:,1) + .03; % to ensure different t entries

data.tW_Cate23_X = [ sortrows([tWt_2208; tWt_2209; tWt_2210; tWt_2223]); ...
     sortrows([tWt_2208b; tWt_2209b; tWt_2210b; tWt_2223b]) ]; % at 23+X degrees
bibkey.tW_Cate23_X = 'Cate2014'; units.tW_Cate23_X = {'d', 'g'}; label.tW_Cate23_X = {'time since birth', 'total wet weight'}; 
temp.tW_Cate23_X = [data.tW_Cate23_X(:,1) , ... % pack time and temperatures
    [ones(length(tWt_2208)+length(tWt_2209)+length(tWt_2210)+length(tWt_2223),1)* temp1; ...
    ones(length(tWt_2208b)+length(tWt_2209b)+length(tWt_2210b)+length(tWt_2223b),1)* temp2 ] ];
units.temp.tW_Cate23_X = 'K'; label.temp.tW_Cate23_X = 'temperature';
treat.tW_Cate23_X = {0}; units.treat.tW_Cate23_X = ''; label.treat.tW_Cate23_X = '';

%%% 2 turtles, transferred to Nausicaa (T=26): 2217, 2218, 
% + 2 to La Rochelle (T=26C): 2226, 2302
temp2 = C2K(26);
 tWt_2217 = [0.001	14	21	28	35	42	49	56	63	70	77	84	91	98	105	112	121	126	132	175	183	189	196	213	226	253	282	339	516
    19.2	23.2	30.7	40.5	50.1	62.4	74.8	89.5	110.7	126.8	135.4	152.4	167.2	184	206.2	232.6	261.6	262.7	287.5	405.3	428.6	434.2	489	523.8	547.2	733	895.4	1167	1648   ]';
tWt_2217b = [542	570	602	631	676	706	723	756	779	803	849	901	932	968	983	1018	1050	1074	1096	1106
    2300	2950	4550	5140	6540	7100	7900	8500	9200	10300	11020	12600	13400	14200	15300	16100	18200	20500	21400	22100    ]';
tWt_2218 = [0.001	14	21	28	35	42	49	56	63	70	77	84	91	98	105	112	121	126	132	175	183	189	196	213	226	253	282	339	516
    17.1	23.5	31.6	43.5	57.8	84.2	104.8	125.8	157.7	182.2	200.2	230.2	252.2	272.5	304.6	338.4	367.1	378.8	421	553.8	577.9	590.4	645.5	697.3	757.4	852.5	964.3	1259	1918
    ]'; tWt_2217(:,1) = tWt_2217(:,1) + .01; % to ensure different t entries
tWt_2218b = [542	570	602	631	649	691	723	756	779	803	849	901	932	968	983	1018	1050	1074	1096	1106
    2550	3250	5000	6060	5740	6920	7310	8150	9230	10400	11750	13600	14500	15300	16440	17900	19600	21440	23000	23300
    ]'; tWt_2217b(:,1) = tWt_2217b(:,1) + .01; % to ensure different t entries
% turtle 2226
% in Antibes until 18-Nov-2012, T=23.5C, then transferred to 26C (La Rochelle)
t_226 = [0.1,18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88, 95, 102, 109, 116, 125, 130, 136, 179, 193,...
    196, 200, 217, 230, 257, 286, 343, 520]';
wt_226= [37.5	48.2	63.7	74.1	89	100.2	126	136.7	148.1	163.6	177.1	190	205.5 223.2 236.7...
    234.1	255	325.8	344.7	341.3	365.7	410.9	403.2	458	547.7	458.0	547.7	684.6 1085.0]';
age = 524; % age at date of transfer from 23.5 to the present of 26C
dates = {'11/22/2012'	'11/29/2012'	'12/06/2012'	'12/11/2012'	'12/14/2012'	'12/17/2012'	'12/27/2012'...
    '01/08/2013'	'01/18/2013'	'02/07/2013'	'02/14/2013'	'02/28/2013'	'03/14/2013'	'04/03/2013'	'04/18/2013'...
    '05/16/2013'	'06/18/2013'	'07/17/2013'	'08/14/2013'	'09/12/2013'	'10/14/2013'	'10/29/2013'...
    '11/13/2013'	'12/13/2013'  '01/13/2014'	'02/17/2014'	'03/12/2014'	'04/11/2014'	'04/12/2014'	...
    '05/23/2014'	'06/11/2014'	'07/10/2014'}';
t2_226 = cumsum([age; diff(datenum(dates, 'mm/dd/yyyy'))]);
wt2_226 = [1102.0	1196.0	1316.0	1288.0	1250.0	1210.0	1234.0	1218.0	1268.0	1480.0	1516.0	1640.0	1756.0 ...
    1966.0	2056.0	2100.0	2306.0	2528.0	2858.0	3040.0	3260.0	3666.0	3680.0	3816.0	4242.0	4588.0 ...
    5162.0	5434.0	5846.0	5962.0	6306.0	6914.0]'; 
tWt_2226 = [t_226+.02 , wt_226]; tWt_2226b = [t2_226+.02 , wt2_226];
% turtle 2302
t_302 = [0.1,18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88, 95, 102, 109, 116, 125, 130, 136, 179, 193, 196,...
    200, 217, 230, 257, 286, 343, 520]'; 
wt_302 = [24.6	32.8	45	54.4	70.2	80.6	106.7	126.9	136.5	159.5	177	200.5	219.4  260 ...
    282	283.3	301.8	414.2	437	432.8	480	541.4	605.8	602.5	754.6	602.5	754.8	1032.0	2218.0]';
dates = {'11/22/2012'	'11/29/2012'	'12/06/2012'	'12/11/2012'	'12/27/2012'	'01/08/2013'	'01/18/2013'...
    '02/14/2013'	'02/18/2013'	'03/14/2013'	'04/03/2013'	'04/18/2013'	'05/16/2013'	'06/18/2013'...
    '07/17/2013'	'08/14/2013'	'09/12/2013'	'10/14/2013'	'11/13/2013'	'11/28/2013'	'01/13/2014'...
    '02/18/2014'	'03/12/2014'}';
t2_302 = cumsum([age; diff(datenum(dates, 'mm/dd/yyyy'))]);
wt2_302 =[2504.0	2720.0	2930.0	2946.0	3450.0	3544.0	3822.0	4780.0	5300.0	5876.0	6790.0	7400.0	...
    7970.0	8976.0	10374.0	12256.0	13020.0	13930.0	15214.0	16038.0	17842.0	18860.0	20140.0]';
tWt_2302 = [t_302+.03 , wt_302]; tWt_2302b = [t2_302+.03 , wt2_302];

data.tW_Cate23_26 = [ sortrows([tWt_2217; tWt_2218; tWt_2226; tWt_2302]); ...
     sortrows([tWt_2217b; tWt_2218b; tWt_2226b; tWt_2302b]) ]; % at 23+26 degrees
bibkey.tW_Cate23_26 = 'Cate2014'; units.tW_Cate23_26 = {'d', 'g'}; label.tW_Cate23_26 = {'time since birth', 'total wet weight'}; 
temp.tW_Cate23_26 = [data.tW_Cate23_26(:,1) , ... % pack time and temperatures
    [ones(length(tWt_2217)+length(tWt_2218)+length(tWt_2226)+length(tWt_2302),1)* temp1; ...
    ones(length(tWt_2217b)+length(tWt_2218b)+length(tWt_2226b)+length(tWt_2302b),1)* temp2 ] ];
units.temp.tW_Cate23_26 = 'K'; label.temp.tW_Cate23_26 = 'temperature';
treat.tW_Cate23_26 = {0}; units.treat.tW_Cate23_26 = ''; label.treat.tW_Cate23_26 = '';
   
% ----------------------------------------------
%% length vs time  (vs weight later)
% ----------------------------------------------
%%% SCL ! 2 turtles, transferred to La Rochelle (T=26C): 2226, 2302
temp2 = C2K(26);
SCL2_226 = [18.7	19	19.4	19.7	NaN	NaN	19.8	19.8	20.1	20.5	20.8	21.3	21.8	22.5	23.1...
    24.3	24.3	24.9	25.8	26.5	27.4	27.7	28.2	28.9	29.7	30.4	31	32	32.8	33.2 ...
    33.7	34.8]';
ok = find(~isnan(SCL2_226)); % exclude NaN values
tL_2226 = [ t_226(end) ,  SCL2_226(1)-0.01 ]; % prepend last measurmements from Antibes
tL_2226b = [ t2_226(ok) ,SCL2_226(ok)];
     sLW_2226 = [SCL2_226(ok) , wt2_226(ok)];  % length-weight
   
SCL2_302 = [24.9	25.4	25.6	25.9	26.7	27.6	28.2	30.5	31.5	32.7	34.4	35.3	...
    36.5	38.8	40.8	42.5	44.4	45.9	47	47.7	49.2	50.2	50.7]';
ok = find(~isnan(SCL2_302));
tL_2302 = [ t_302(end)+.01 ,  SCL2_302(1)-0.01 ]; % prepend last measurmements from Antibes
tL_2302b = [ t2_302(ok)+.01 ,SCL2_302(ok)];
    sLW_2302 = [ SCL2_302(ok), wt2_302(ok) ];% length-weight
        
data.tL_Cate23_26s = [ sortrows([tL_2226; tL_2302]); sortrows([tL_2226b; tL_2302b]) ]; % at 23+26 degrees
bibkey.tL_Cate23_26s = 'Cate2014'; 
units.tL_Cate23_26s = {'d', 'cm SCL'}; label.tL_Cate23_26s = {'time since birth', 'straight carapace length'}; 
temp.tL_Cate23_26s = [data.tL_Cate23_26s(:,1) , ... % pack time and temperatures
    [ones(size(tL_2226,1)+size(tL_2302,1),1)* temp1; ...
    ones(length(tL_2226b)+length(tL_2302b),1)* temp2 ] ];
units.temp.tL_Cate23_26s = 'K'; label.temp.tL_Cate23_26s = 'temperature';
treat.tL_Cate23_26s = {0}; units.treat.tL_Cate23_26s = ''; label.treat.tL_Cate23_26s = '';

%%% CCL ! 
%%%%% 7 turtles, kept at  f = 1, T = 23.5 C: 2206, 2211, 2220, 2221, 2222, 2223, 2224
tL_2206 = [630.00 726.00 968.00  1095.00
  31.00  35.00  41.00  46.00]';
tL_2211 = [518+111 , 518+212,	518+449 , 518+576 ;
   34	37.5  49    53.5]'; tL_2211(:,1) = tL_2211(:,1) + .01; % to ensure different t entries
tL_2220 = [723.00 965.00  1092.00
  34.20  43.00  50.00]';  tL_2220(:,1) = tL_2220(:,1) + .02; % to ensure different t entries
tL_2221 = [ 627.00 723.00 965.00  1106.00
  34.00  37.50  47.00  52.00]';  tL_2221(:,1) = tL_2221(:,1) + .03; % to ensure different t entries
tL_2222 = [516+111, 516+212, 516+366, 516+449, 516+576 ;
   33.5	36.7	41		37 48]';  tL_2222(:,1) = tL_2222(:,1) + .04; % to ensure different t entries
tL_2224 = [626.00 722.00 881.00 964.00
  27.50  31.20  37.75  40.00]';tL_2224(:,1) = tL_2224(:,1) + .05; % to ensure different t entries

data.tL_Cate23 = sortrows([tL_2206; tL_2211; tL_2220; tL_2221; tL_2222; tL_2224]); % at 23.5 C
bibkey.tL_Cate23 = 'Cate2014';units.tL_Cate23 = {'d', 'cm CCL'}; label.tL_Cate23 = {'time since birth', 'curved carapace length'};  
temp.tL_Cate23 = C2K(23.5); units.temp.tL_Cate23 = 'K'; label.temp.tL_Cate23 = 'temperature';

%%%%%% 2 turtles, transferred to Le Croisic (T=22C): 2207, 2215
temp2 = C2K(22);
% for time spent in Antibes until 10-Sep-2013, prepend a measurement for 23.5:
tL_2207b = [518+422, 518+455, 518+485,	518+502,	518+546 ;  
    36		37.5	40	40.5	42]';
tL_2215 =[628.00 724.00 % ** CCL ** but AFTER transfer
  34.00  36.00 ]'; tL_2215(:,1) = tL_2215(:,1) + .01; % to ensure different t entries
 tL_2215b =[ 939.00 972.00  1002.00  1021.00  1063.00 % ** SCL **
     35.40  36.50  39.00  39.00  39.00]'; tL_2215b(:,1) = tL_2215b(:,1) + .01; % to ensure different t entries

data.tL_Cate22 =  sortrows([tL_2207b ; tL_2215]); % at 22 degrees
bibkey.tL_Cate22 = 'Cate2014'; units.tL_Cate22 = {'d', 'cm CCL'}; label.tL_Cate22 = {'time since birth', 'curved carapace length'}; 
temp.tL_Cate22 =  temp2 ; units.temp.tL_Cate22 = 'K'; label.temp.tL_Cate22 = 'temperature'; 
% **** pack SCL as other SCL ****
data.tL_Cate22s = tL_2215b ; bibkey.tL_Cate22s = 'Cate2014'; 
units.tL_Cate22s = {'d', 'cm SCL'}; label.tL_Cate22s = {'time since birth', 'straight carapace length'}; 
temp.tL_Cate22s = temp2; units.temp.tL_Cate22s = 'K'; label.temp.tL_Cate22s = 'temperature';


%%% 4 turtles, transferred but new temp unknown : 2208, 2209, 2210, 2223
temp2 = C2K(23.5); % assumed! - for simplicity packed as constant
tL_2208 = [629.00 725.00 ;  31.50  33.50]';
tL_2209 = [629.00 725.00 ;  28.50  33.50]'; tL_2209(:,1) = tL_2209(:,1) + .01; % to ensure different t entries
tL_2210 = [518+111 , 518+212, 518+366	518+449 , 518+558 ;
    30	33	39.8	40	45 ]'; tL_2210(:,1) = tL_2210(:,1) + .02; % to ensure different t entries
tL_2223 = [626.00 722.00 881.00     970.00  1091.00
   31.00  33.50   41.5 44.00  46.00]'; tL_2223(:,1) = tL_2223(:,1) + .03; % to ensure different t entries

data.tL_CateX = sortrows([tL_2208; tL_2209; tL_2210; tL_2223]); % at 23.5 C
bibkey.tL_CateX = 'Cate2014';units.tL_CateX = {'d', 'cm CCL'}; label.tL_CateX = {'time since birth', 'curved carapace length'};  
temp.tL_CateX = temp2; units.temp.tL_CateX = 'K'; label.temp.tL_CateX = 'temperature';

%%% 2 turtles, transferred to Nausicaa (T=26): 2217, 2218, 
temp2 = C2K(26);
tL_2217 = [518.00  21.69]; % first CCL point calculated from the known mass at time and the scaling L-W equation!!
tL_2217b = [627.00 900.00 ; 31.00  46.00]';
tL_2218 = [518.00  22.77  ]; % first CCL point calculated from the known mass at time and the scaling L-W equation!!
    tL_2218(:,1) = tL_2218(:,1) + .01; % to ensure different t entries
tL_2218b = [ 627.00 900.00 ; 31.00  46.00]';
    tL_2218b(:,1) = tL_2218b(:,1) + .01; % to ensure different t entries

data.tL_Cate23_26 = [ sortrows([tL_2217; tL_2218]); sortrows([tL_2217b; tL_2218b]) ]; % at 23+26 degrees
bibkey.tL_Cate23_26 = 'Cate2014'; units.tL_Cate23_26 = {'d', 'cm CCL'}; label.tL_Cate23_26 = {'time since birth', 'curved carapace length'}; 
temp.tL_Cate23_26 = [data.tL_Cate23_26(:,1) , ... % pack time and temperatures
    [ones(size(tL_2217,1)+size(tL_2218,1),1)* temp1; ones(length(tL_2217b)+length(tL_2218b),1)* temp2 ] ];
units.temp.tL_Cate23_26 = 'K'; label.temp.tL_Cate23_26 = 'temperature'; 
treat.tL_Cate23_26 = {0}; units.treat.tL_Cate23_26 = ''; label.treat.tL_Cate23_26 = '';
% ----------------------------------------------
%%% length -- weight
% ----------------------------------------------
%[tL_2215b(:,1) tWt_2215b(4:end,1)] %kontrola
sLW_2215 = [tL_2215b(:,2) tWt_2215b(4:end,2)];
data.sLW_Cate = [sLW_2215 ; sLW_2226; sLW_2302]; % pack all SL-W together
    bibkey.sLW_Cate = 'Cate2014';  units.sLW_Cate = {'cm SCL', 'g'};     
    label.sLW_Cate = {'straight carapace length', 'wet weight'}; 
% *CCL** 
% [tL_2206(:,1) tWt_2206([end-3:end],1)] % kontrola
cLW_2206 = [tL_2206(:,2) tWt_2206(end-3:end,2)];  
% [tL_2211([1 2 end],1) tWt_2211([end-length(tL_2211)+1 end-length(tL_2211)+2 end],1)] % kontrola
cLW_2211 = [tL_2211([1 2 end],2) tWt_2211([end-length(tL_2211)+1 end-length(tL_2211)+2 end],2)];
% [tL_2220(:,1) tWt_2220([end-2:end],1)] % kontrola
cLW_2220 = [tL_2220(:,2) tWt_2220(end-2:end,2)];
% [tL_2221([1:2, end],1) tWt_2221([end-4:end-3, end],1)] % kontrola
cLW_2221 = [tL_2221([1:2, end],2) tWt_2221([end-4:end-3, end],2)];
% [tL_2222([1 2 3 end],1) tWt_2222(end-length(tL_2222)+2: end,1)]
cLW_2222 = [tL_2222([1 2 3 end],2) tWt_2222(end-length(tL_2222)+2:end,2)];
% [tL_2224(:,1) tWt_2224([end-4:end-3,end-1:end],1)] % kontrola
cLW_2224 = [tL_2224(:,2) tWt_2224([end-4:end-3,end-1:end],2)];

cLW_2207 = [tL_2207b(:,2) tWt_2207b(2:end,2)]; 
% [tL_2215(:,1) tWt_2215b(1:2,1)] % kontrola
cLW_2215 = [tL_2215(:,2) tWt_2215b(1:2,2)];

cLW_2208 = [tL_2208(:,2) tWt_2208b(end-2:end-1,2)];
cLW_2209 = [tL_2209(:,2) tWt_2209b(end-2:end-1,2)];
cLW_2210 = [tL_2210([1:3,end],2) tWt_2210b([end-4:end-2, end],2)];
% [tL_2223(1:3,1) tWt_2223b(end-3:end-1,1)] % kontrola
cLW_2223 = [tL_2223(1:3,2) tWt_2223b(end-3:end-1,2)];

% [tL_2217b(:,1) tWt_2217b([4 ,12 ],1)] % kontrola
cLW_2217 = [tL_2217b(:,2) tWt_2217b([4,12],2)];
% [tL_2218b(:,1) tWt_2218b([4,12],1)] % kontrola
cLW_2218 = [tL_2218b(:,2) tWt_2218b([4,12],2)];

%%%%% pack all together
data.LW_Cate = [cLW_2206; cLW_2211; cLW_2220; cLW_2221; cLW_2222; cLW_2224; ...
    cLW_2207; cLW_2215; cLW_2208; cLW_2209; cLW_2210; cLW_2223; cLW_2217; cLW_2218]; 
bibkey.LW_Cate = 'Cate2014'; % no NaN values in wt2
    units.LW_Cate = {'cm CCL', 'g'};     label.LW_Cate = {'CCL total length', 'wet weight'}; 
%%%
    
%% DATA FROM THE WILD
% repro output (fecundity), from TiwaBjor2000, fig.1
% SCL (cm), % eggs per nest (#); on average 4 nests per female can be assumed
LN_Med = [
    74.308	150.117
    75.137	103.915
    76.232	130.112
    79.525	100.938
    79.886	144.951
    81.042	123.037
    81.733	136.012
    82.614	92.695
    84.366	168.192
    ];
data.LN = LN_Med; units.LN  = {'cm', '#/clutch'};  label.LN = {'SCL', 'eggs per clutch'};
uniNests = linspace(2,2,length(LN_Med)); % nests per season as average from Brod2002
uniRemi = linspace(2,2,length(LN_Med)); % remigration intervals as average from Brod2002
fecund.LN = uniNests./uniRemi; units.fecund.LN = 'clutches/year'; label.fecund.LN = 'clutches per nesting season/years between nesting seasons';
treat.LN = {0}; units.treat.LN = ''; labal.treat.LN = '';
comment.LN = 'for fecundity, used an average # nests per season per female with nesting seasons 2 yrs apart';  
bibkey.LN = {'TiwaBjor2000'};

% skeletochronology, from CasaPino2009 (text), and from CasaCont2011; plotReader, 
% age (yrs), CCL (cm)
tL_CasaPino = [0 4.10 
0.5 10.00
1 20.08 
2.5 24.28 
3.5 27.92];

tL_CasaConte = [
    3.73	3.78	6.85	6.94	6.94	7.18	7.89	8.22	8.5	8.64	8.83	8.97	9.02	9.35	10.44	10.53	10.72	10.72	10.81	11.05	11.1	11.19	11.24	11.29	11.52	12.04	12.18	13.27	14.4	15.21	16.91	18.37	35.75
    26.44	24.09	34.12	30.06	41.58	38.59	34.12	42	43.28	41.79	41.15	44.35	47.97	47.97	53.94	52.03	53.52	58.21	51.39	55.44	47.12	59.06	55.22	53.73	52.88	57.36	60.77	62.69	62.26	63.54	76.76	79.1	86.57
    ]';

tL_CasaPino(:,1) = 365 * tL_CasaPino(:,1); % convert yr to d
data.tL_CasaPino2009 = tL_CasaPino; units.tL_CasaPino2009  = {'d', 'cm'};  label.tL_CasaPino2009 = {'age', 'CCL'};
    comment.tL_CasaConte2011 = 'skeletochronology, they fitted the curve only to <30cm CCL data'; 
    temp.tL_CasaPino2009 = temp.am;  units.temp.tL_CasaPino2009 = 'K'; label.temp.tL_CasaPino2009 = 'temperature';
    bibkey.tL_CasaPino2009 = {'CasaPino2009'};
tL_CasaConte(:,1) = 365 * tL_CasaConte(:,1); % convert yr to d
data.tL_CasaConte2011 = tL_CasaConte; units.tL_CasaConte2011  = {'d', 'cm'};  label.tL_CasaConte2011 = {'age', 'CCL'};
    comment.tL_CasaConte2011 = 'skeletochronology, they fitted the curve only to >25cm CCL data'; 
    temp.tL_CasaConte2011 = temp.am;  units.temp.tL_CasaConte2011 = 'K'; label.temp.tL_CasaConte2011 = 'temperature';
    bibkey.tL_CasaConte2011 = {'CasaCont2011'};
    
        
%% set weights for all real data
weights = setweights(data, []);
% overwriting weights 
% zero-variate data:
weights.ab =  weights.ab/2;  % give ab data less weight (will correct later with t_0)
 weights.tp =  weights.tp/2;  % give tp data less weight (only estimates available; large range reported)
%  weights.am = 10* weights.am;
%  weights.Lb = 10 * weights.Lb;   % more weight to Lb --> zero-var data with more certainty (than ap) get extra weights
 weights.Wwb = 10 * weights.Wwb;   % more weight to Wb --> EH_b
 weights.Wwp = 10 * weights.Wwp;   % more weight to Wp --> EH_p
 weights.Lp_SCL = 50 * weights.Lp_SCL;    % more weight to Lp
 weights.Lp_CCL = 50 * weights.Lp_CCL;    % more weight to Lp
 weights.Li_SCL = 10 * weights.Li_SCL;      % more weight to Li
 weights.Li_CCL = 10 * weights.Li_CCL;      % more weight to Li
 weights.E0 = 10 * weights.E0;    % more weight to E_0 
%  weights.Ri = 10 * weights.Ri;    % more weight to R_i 
 weights.Tah_Reid = weights.Tah_Reid/10;
 weights.LN = 10* weights.LN;
 % for estimating del_MC
 weights.LW_Cate = 10 * weights.LW_Cate;
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0.1; weights.psd.k = 0.5;
data.psd.k = 0.75; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; % VALUE FOR K SAME AS FOR OTHER TURTLES 
%%% add some pseudodata just to see values
data.psd.p_Am = 1000; units.psd.p_Am  = 'J/cm^3.d'; label.psd.p_Am  = 'max surf area assimilation';
weights.psd.p_Am = 0;
data.psd.w = 1.5; units.psd.w  = '-'; label.psd.w  = 'omega'; weights.psd.w = 0;
data.psd.E_m = 1e+04; units.psd.E_m  = 'J/cm^3'; label.psd.E_m  = 'max reserve density';
weights.psd.E_m = 0; 

%% pack temp and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.fecund = fecund;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% save data for table 
 save('data_Caretta_caretta_MED', 'data', 'txtData', 'weights')

%% Group plots
set2 = {'tW_T3T4', 'tW_Cate23','tW_Cate23_X'};
subtitle2 = {'mass, 8 turtles at constant T=23.5C', '4 moved to assumed T=23.5C'};
set3 = {'tW_Cate23_25','tW_Cate23_26', 'tW_Cate23_22'};
subtitle3 = {'mass, 6 turtles: 2 moved to T=25C, 4 to T=26C, 2 to T=22C'};
%
set5 = {'tL_Cate23', 'tL_CateX','tL_Cate23_26', 'tL_Cate22'}; 
subtitle5 = {'length; 6@constant T=23.5C,4@guessed T=23.5C', ...
    '2 moved to T=26, 2 moved to T=22C'};      
set6 = {'tL_Cate23_26s', 'tL_Cate22s'}; 
subtitle6 = {'length; 2 moved to T=26, 1 moved to T=22C'};      
%
set9 = {'tL_CasaPino2009', 'tL_CasaConte2011'}; 
subtitle9 = {'merge growth curves from two publications'};
%
set10 = {'Tah_Reid', 'Tah_Zbin'}; 
subtitle10 = {'Incubation duration vs temperature'};

metaData.grp.sets = {set2,set3,set5,set6,set9,set10};
metaData.grp.subtitle = {subtitle2,subtitle3,subtitle5,subtitle6,subtitle9,subtitle10};


%% Discussion points
D1 = ['Based on entry for NA population, with tissue density (d_V, E_G; kap_G = 0.8) assumed same, and z constrained to not be larger than', ...
    'that of NA. T_A estiamated independently.',...
    'f for zero-variate is set to 0.6923 as Li/Lm=90/130 where Li is the max length of the Med population', ...
    ' and Lm is the largest NA female ever observed.'];
D2 = 'Same as in NA: Parameters estimated with t_0 = 0 (!) and only after that t_0=15 introduced and fine-tuned with estimation while other pars fixed';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is accompanied by pseudodata k = 0.75 --> value in other sea turtles';
D4 = ['Age at puberty reported in literature is mostly deduced from size at first nesting + bone growth marks;',...
    'onset of investement into reproduction may be sooner - 10 years from start of puberty to first nesting [Limp1990]'];
D5 = ['Ontogenetic habitat shift is occuring mostly during the juvenile stage and it generally means food ',...
    'of better quality, and higher temperature -> For data from wild, a biphasic growth curve can be chosen in predict file, ', ...
    'with CCL 30 cm as L_switch. ']; 

metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3,'D4',D4,'D5',D5);

%% Facts 
F1 = 'For the Mediterranean population, based on NA population, part of phd research; SCL = Straight Caparace Length (preferred)--> del_MS, CCL - Curved Carapace length --> del_MC';
metaData.bibkey.F1 = {'Marn2016','MarnKooy2017', 'MarnJusu2018'}; 
F2 = 'Long lived species. Life stages: hatchling, pelagic juvenile, benthic juvenile, adult; switch from pelagic to benthic stage(recruitment) happens at a certain size, probably smaller than in NA, between 30-35cm CCL';
metaData.bibkey.F2 = {'Bjor2000','CasaCont2011'}; 
F3 = 'Compared to the North Atlantic population, they are smaller, possibly reach maturity younger, have more eggs per clutch but less clutches per year';
metaData.bibkey.F3 = {'MargArga2003', 'Groom1990', 'BrodGlen2003' };
F4 = 'Mean temperature experienced: SST of Mediterranean 19C in the west, 20C in the east basin';
metaData.bibkey.F4 = 'Nykj2009';
 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

 
  %% Links
metaData.links.id_CoL = '69BHK'; % Cat of Life
metaData.links.id_ITIS = '173830'; % ITIS
metaData.links.id_EoL = '46559466'; % Ency of Life
metaData.links.id_Wiki = 'Caretta_caretta'; % Wikipedia
metaData.links.id_ADW = 'Caretta_caretta'; % ADW
metaData.links.id_Taxo = '48469'; % Taxonomicon
metaData.links.id_WoRMS = '137205'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Caretta&species=caretta'; % ReptileDB
metaData.links.id_AnAge = 'Caretta_caretta'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
    'note = {Accessed : 2018-05-17},' ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Caretta_caretta}}'];
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
bibkey = 'Bjor2000'; type = 'Article'; bib = [ ... 
'author = {K. A. Bjorndal and A. B. Bolten and H. R. Martins}, ' ... 
'year = {2000}, ' ...
'title = {Somatic growth model of juvenile loggerhead sea turtles \textit{Caretta caretta}: duration of pelagic stage.}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {202}, ' ...
'pages = {265--272}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrodGlen2003'; type = 'Article'; bib = [ ... 
'author = {Annette C. Broderick and Fiona Glen and Brendan J. Godley and Graeme C. Hays},'...
'title = {Variation in reproductive output of marine turtles},'...
'journal = {Journal of Experimental Marine Biology and Ecology},'...
'year = {2003},'...
'volume = {288},'...
'pages = {95--109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cate2014'; type = 'Misc'; bib = [...
'author = {Cateau, Sidonie},'...
'year = {2014},'...
'howpublished = {personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];    
%
bibkey = 'CasaCont2011'; type = 'Article'; bib = [ ... 
'author = {Paolo Casale and Nicoletta Conte and Daniela Freggi and Carla Cioni and Roberto Argano},'...
'title = {Age and growth determination by skeletochronology in loggerhead sea	turtles (\textit{Caretta caretta}) from the {M}editerranean Sea},'...
'journal = {Scientia Marina},'...
'year = {2011},'...
'volume = {75},'...
'pages = {197--203},'...
'number = {1},'...
'doi = {10.3893/scimar.2011.75n1197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CasaPino2009'; type = 'Article'; bib = [ ... 
'author = {P. Casale and P. Pino dAstore and R. Argano},'...
'title = {Age at size and growth rates of early juvenile loggerhead sea turtles (\textit{Caretta caretta}) in the {M}editerranean based on length frequency analysis},'...
'journal = {Herpetological Journal},'...
'year = {2009},'...
'volume = {19},'...
'pages = {29--33}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GodfMros1997'; type = 'Article'; bib = [ ... 
'author = {Godfrey, M. H. and Mrosovsky, N.}, ' ... 
'year = {1997}, ' ...
'title = {Estimating the time between hatching of sea turtles and their emergence from the nest.}, ' ...
'journal = {Chelonian Conservation and Biology}, ' ...
'volume = {2}, ' ...
'pages = {581--585}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Groom1990'; type = 'Techreport'; bib = [ ... 
'author = {Groombridge, B.},'...
'title = {Marine turtles in the {M}editerranean: distribution, population status, and conservation},'...
'institution = {{Report to the Council of Europe, Environmental Conservation and Management Division}},'...
'year = {1990},'...
'series = {Nature and Environment},' ...
'number = {48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaysSpea1991'; type = 'Article'; bib = [ ...
'author = {Graeme C. Hays and John R. Speakman},'...
'title = {Reproductive Investment and Optimum Clutch Size of Loggerhead Sea Turtles (\textit{Caretta caretta})},'...
'journal = {Journal of Animal Ecology},'...
'year = {1991},'...
'volume = {60},'...
'pages = {455--462},'...
'number = {2},'...
'month = {Jun},'...
'publisher = {British Ecological Society},'...
'howpublished = {\url{http://www.jstor.org/stable/5290}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MargArga2003'; type = 'Incollection'; bib = [ ... 
'author = {Margaritoulis, D. and R. Argano and I. Baran and F. Bentivegna and M.N. Bradai and J.A. Caminas and P. Casale and G. De Metrio and A.Demetropoulos and G. Gerosa and B.J. Godley and D.A. Haddoud and J. Houghton and L. Laurent and B. Lazar},'...  
'title = { Loggerhead Turtles in the {M}editerranean Sea: Present Knowledge and Conservation Perspectives},'...
'booktitle = {Loggerhead Sea Turtles},'...
'pages = {175-198},'...
'publisher = {Smithsonian Books, Washington D.C.},'...
'year = {2003},'...
'editor = {Bolten, A.B. and B.E. Witherington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Marn2016'; type = 'phdthesis'; bib = [ ...
    'author = {Nina Marn}, ' ...
    'year = {2016}, ' ...
    'title = {Life cycle and ecology of the loggerhead turtle (\textit{Caretta caretta}, Linnaeus, 1758): Development and application of the Dynamic Energy Budget model}, ' ...
    'school={Faculty of Science, University of Zagreb (HR) \& Faculty of Earth and Life Sciences,  Vrije Universiteit Amsterdam (NL)}' ...
    ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarnKooy2017'; type = 'Article'; bib = [ ...
    'author = {Nina Marn and S.A.L.M. Kooijman and Marko Jusup and Tarzan Legovi\''{c} and Tin Klanjs\v{c}ek}, ' ...
    'year = {2017}, ' ...
    'title = {Inferring physiological energetics of loggerhead turtle (\textit{Caretta caretta}) from existing data using a general metabolic theory }, ' ...
    'journal = {Marine Environmental Research}, ' ...
    'volume = {126}, ' ...
    'issn = {0141-1136}, ' ...
    'doi = {10.1016/j.marenvres.2017.01.003}, ' ...
    'pages = {14 - 25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarnJusu2018'; type = 'Article'; bib = [ ...
    'author = {Nina Marn and Marko Jusup and Sidonie Cateau and S.A.L.M. Kooijman and Tin Klanjs\v{c}ek}, ' ...
    'year = {2018}, ' ...
    'title = {Comparative physiological energetics of {M}editerranean and {N}orth {A}tlantic loggerhead turtles}, ' ...
    'journal = {Journal of Sea Research}, ' ...
    'note = {in revision for special issue},'....
    'volume = {-}, ' ...
    'pages = {-}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nykj2009'; type = 'Article'; bib = [ ... 
'author = {Leo Nykjaer},'...  
'title = { Loggerhead Turtles in the {M}editerranean Sea: Present Knowledge and Conservation Perspectives},'...
'journal = {Climate Research},'...
'year = {2009},'...
'volume = {39},'...
'pages = {11--17},'...
'number = {9},'...
'doi = {10.3book354/cr00794},'...
'howpublished = {\url{http://www.int-res.com/articles/cr\_oa/c039p011.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PiovClus2011'; type = 'Article'; bib = [ ...
'author = {Piovano, Susanna and Clusa, Marcel and Carreras, Carlos and Giacoma, Cristina and Pascual, Marta and Cardona, Luis},'...
'title = {Different growth rates between loggerhead sea turtles (\textit{Caretta caretta})of {M}editerranean and {A}tlantic origin in the {M}editerranean Sea},'...
'journal = {Marine Biology}, '...
'year = {2011}, '...
'volume = {158}, '...
'pages = {2577--2587}, '...
'number = {11},'...
'doi = {10.1007/s00227-011-1759-7}, '...
'issn = {0025-3162}, '...
'publisher = {Springer-Verlag}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReidMarg2009'; type = 'Article'; bib = [ ...
'author = {K. A. Reid and D. Margaritoulis and J. R. Speakman},'...
'title = {Incubation temperature and energy expenditure during development in loggerhead sea turtle embryos},'...
'journal = {Journal of Experimental Marine Biology and Ecology},'...
'year = {2009},'...
'volume = {378},'...
'pages = {62--68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stok2014'; type = 'Misc'; bib = [...
'author = {Stokes, L.},'...
'year = {2014},'...
'howpublished = {personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];    
%
bibkey = 'TiwaBjor2000'; type = 'Article'; bib = [ ...
'author = {M. Tiwari and K. A. Bjorndal},'...
'title = {Variation in morphology and reproduction in loggerheads, \textit{Caretta caretta}, nesting in the {U}nited {S}tates, {B}razil, and {G}reece},'...
'journal = {Herpetologica},'...
'year = {2000},'...
'pages = {343--356},'...
'volume = {56},'...
'number ={3}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZbinMarg2006'; type = 'Article'; bib = [ ...
'author = {Judith A. Zbinden and Dimitris Margaritoulis and Rapha\"{e}l Arlettaz},'...
'title = {Metabolic heating in {M}editerranean loggerhead sea turtle clutches},'...
'journal = {Journal of Experimental Marine Biology and Ecology},'...
'year = {2006},'...
'pages = {151--157},'...
'volume = {334}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

