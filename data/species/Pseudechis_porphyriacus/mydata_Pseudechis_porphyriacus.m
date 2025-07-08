  function [data, auxData, metaData, txtData, weights] = mydata_Pseudechis_porphyriacus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Pseudechis_porphyriacus'; 
metaData.species_en = 'Red-bellied black snake'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data
data.am = 11.6*365;    units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 24;     units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1978';
  comment.Lb = 'Wiki ives 12.2 cm total length';
data.Lp = 88;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = {'Shin1978','Wiki'}; 
data.Lpm = 78;    units.Lpm = 'cm';     label.Lpm = 'SVL at puberty for males'; bibkey.Lpm = {'Shin1978','Wiki'}; 
data.Li = 120;    units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 150;   units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 5;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Notechis_scutatus';
data.Wwi = 1e3;     units.Wwi = 'g';     label.Wwi = 'weight at birth';  bibkey.Wwi = 'Wiki';

data.Ri = 20/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-40 young per clutch covered in a membrane, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL_f = [ ... % time since birth (d), snout-vent length (cm)
197.756	26.280
214.760	24.734
256.451	37.488
257.021	33.237
257.061	44.058
258.768	29.758
365+25.939	37.101
365+28.898	44.058
365+31.805	37.101
365+44.115	35.169
365+51.135	30.145
365+132.181	58.357
365+144.475	52.174
365+145.035	44.831
365+177.941	61.063
365+190.881	71.111
365+200.242	64.541
365+201.983	59.517
365+205.528	66.473
365+213.133	61.063
365+227.257	73.816
365+234.326	82.319
365+237.846	82.319
365+242.521	77.681
365+252.509	82.319
365+253.062	73.043
365+254.801	67.633
365+255.442	82.319
365+256.004	75.749
365+257.163	71.884
365+257.193	80.000
365+259.549	82.705
730+4.953	72.271
730+23.143	74.203
730+47.195	75.362
730+65.962	74.589
730+72.404	71.884
730+72.428	78.454
730+81.206	73.043
730+105.275	78.841
730+114.675	83.092
730+116.473	93.527
730+131.137	93.527
730+142.236	81.159
730+144.545	71.111
730+146.972	93.140
730+148.757	100.097
730+156.939	91.981
730+189.755	83.865
730+195.635	87.729
730+210.309	90.821
730+229.696	99.324
730+232.037	97.778
730+234.989	103.188
730+240.274	104.734
1095+9.787	110.918
1095+10.396	117.101
1095+12.171	121.353
1095+18.551	101.643
1095+19.675	88.116
1095+21.457	94.300
1095+22.070	101.643
1095+33.839	112.077
1095+34.359	93.913
1095+39.111	110.145
1095+43.803	110.145
1095+53.793	115.169
1095+57.284	107.440
1095+61.398	109.758
1095+66.059	101.256
1095+67.259	108.599
1095+70.821	120.193
1095+70.865	132.174
1095+76.022	98.937
1095+80.129	99.324
1095+83.066	100.483
1095+88.356	103.575
1095+90.148	112.464
1095+90.773	122.899
1095+98.901	100.097
1095+108.362	120.966
1095+108.912	110.918
1095+111.227	102.415
1095+112.416	106.667
1095+122.971	105.894
1095+142.349	112.077
1095+149.413	119.034
1095+150.569	114.396
1095+159.359	112.077
1095+159.377	117.101
1095+171.655	106.280
1095+171.669	110.145
1095+197.465	107.053
1095+209.775	105.121
1095+218.592	110.145
1095+242.062	112.464];
data.tL_f(:,1) =  data.tL_f(:,1) - 197; % set origin to birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), snout-vent length (cm)
730+1.471	82.319
730+22.575	79.227
730+39.573	76.135
730+55.997	76.522
730+60.112	78.841
730+61.298	82.319
730+81.227	78.841
730+87.094	79.227
730+90.044	83.865
730+95.308	80.000
730+100.594	81.932
730+104.123	84.638
730+111.187	91.594
730+132.263	80.773
730+136.383	84.638
730+142.277	92.367
730+147.546	89.662
730+154.017	95.072
730+176.279	87.729
730+182.126	82.705
730+198.849	98.937
730+200.368	98.937
730+202.670	86.957
730+206.191	87.343
730+212.656	90.821
730+222.076	100.483
730+225.574	94.686
730+238.459	89.662
1095+7.383	95.072
1095+9.757	102.802
1095+13.361	125.990
1095+15.006	94.686
1095+16.901	131.401
1095+18.023	117.488
1095+20.359	114.783
1095+21.512	109.372
1095+23.304	118.261
1095+24.490	121.739
1095+24.513	127.923
1095+26.799	111.691
1095+27.930	100.097
1095+28.538	105.894
1095+30.387	130.242
1095+32.685	117.101
1095+36.292	141.063
1095+37.441	134.493
1095+37.914	103.575
1095+40.806	92.367
1095+41.017	149.952
1095+41.418	99.324
1095+43.827	116.715
1095+45.111	146.860
1095+49.135	124.444
1095+49.149	128.309
1095+50.257	110.531
1095+55.568	119.420
1095+57.981	137.585
1095+61.409	112.850
1095+62.634	126.763
1095+70.166	101.643
1095+73.164	119.420
1095+77.310	130.242
1095+81.468	144.541
1095+83.158	125.604
1095+83.177	130.628
1095+86.063	117.874
1095+86.084	123.671
1095+90.762	119.807
1095+91.905	111.691
1095+93.057	105.894
1095+97.312	146.473
1095+103.048	111.304
1095+103.618	106.667
1095+109.545	123.671
1095+113.006	107.826
1095+114.784	112.850
1095+115.984	120.193
1095+126.512	112.077
1095+127.729	124.058
1095+140.578	108.986
1095+140.595	113.623
1095+143.586	129.469
1095+144.740	124.444
1095+147.033	109.758
1095+148.305	136.812
1095+150.599	122.512
1095+150.631	131.401
1095+152.902	110.918
1095+161.128	114.783
1095+162.929	125.990
1095+169.314	107.826
1095+175.243	125.217
1095+178.218	136.812
1095+178.692	105.894
1095+178.755	123.285
1095+182.888	130.628
1095+198.067	111.304
1095+199.881	125.990
1095+201.031	119.807
1095+201.649	128.309
1095+209.294	133.720
1095+224.555	136.812
1095+233.275	115.556
1095+239.180	126.377
1095+256.156	117.101
1095+256.708	107.826];
data.tL_m(:,1) =  data.tL_m(:,1) - 197; % set origin to birth
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'snout-vent length', 'male'};  
temp.tL_m   = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Shin1978';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NM3Y'; % Cat of Life
metaData.links.id_ITIS = '700658'; % ITIS
metaData.links.id_EoL = '1055554'; % Ency of Life
metaData.links.id_Wiki = 'Pseudechis_porphyriacus'; % Wikipedia
metaData.links.id_ADW = 'Pseudechis_porphyriacus'; % ADW
metaData.links.id_Taxo = '90762'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudechis&species=porphyriacus'; % ReptileDB
metaData.links.id_AnAge = 'Pseudechis_porphyriacus'; % AnAg2

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudechis_porphyriacus}}';
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
bibkey = 'Shin1978'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1978}, ' ...
'title = {Growth Rates and Sexual Maturation in Six Species of {A}ustralian {E}lapid Snakes}, ' ... 
'journal = {Herpetologica}, ' ...
'volume = {34(1)}, '...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pseudechis_porphyriacus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


