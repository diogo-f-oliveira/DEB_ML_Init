  function [data, auxData, metaData, txtData, weights] = mydata_Austrelaps_superbus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Austrelaps_superbus'; 
metaData.species_en = 'Lowland copperhead'; 

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
data.am = 10*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 17.5;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1978';
data.Lp = 60;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Shin1978'; 
data.Lpm = 50;     units.Lpm = 'cm';     label.Lpm = 'SVL at puberty for males'; bibkey.Lpm = 'Shin1978'; 
data.Li = 97;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1978';
data.Lim = 110;     units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1978';

data.Wwb = 3.4;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'Rohr2001';
data.Wwi = 432;  units.Wwi = 'g';     label.Wwi = 'ultimate weight for females';  bibkey.Wwi = 'Rohr2001';
  comment.Wwi = 'based on 174.9 g for SVL 71.77 cm: 174.9*(97/71.77)^3)';

data.Ri = 11.9/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Rohr2001';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time - length
data.tL_f = [ ... % time since birth (d), snout-vent length (cm)
167.036	17.605
173.380	17.576
190.691	17.871
197.108	21.591
207.461	20.043
365+14.520	35.558
365+38.493	22.322
365+43.006	17.052
365+43.857	31.298
365+46.474	17.411
365+56.935	21.487
365+101.564	32.532
365+102.790	36.276
365+131.110	39.145
365+196.653	27.968
365+197.432	38.465
365+212.825	29.019
365+216.437	36.877
365+231.030	45.810
365+259.321	47.179
730+8.356	74.961
730+8.443	79.461
730+12.920	72.315
730+19.899	75.283
730+19.964	78.658
730+36.791	83.830
730+44.080	72.922
730+47.397	65.406
730+53.749	95.752
730+60.742	69.470
730+60.995	82.594
730+81.852	57.373
730+82.530	62.619
730+82.876	80.618
730+84.931	97.483
730+85.306	56.982
730+94.844	73.063
730+95.010	51.687
730+95.154	59.186
730+95.176	60.311
730+97.029	66.678
730+100.252	84.288
730+103.871	62.521
730+123.150	75.182
730+155.305	67.534
730+202.147	73.693
730+208.925	66.162
730+216.278	58.628
730+231.556	73.182
730+258.304	84.309
730+258.398	89.184];
data.tL_f(:,1) =  data.tL_f(:,1) - 167; % set origin to birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'snout-vent length', 'female'};  
temp.tL_f   = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Shin1978';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), snout-vent length (cm)
365+255.874	47.945
730+7.094	99.342
730+7.217	105.717
730+7.361	83.216
730+7.736	72.714
730+8.738	94.835
730+8.781	97.084
730+8.861	101.209
730+9.719	85.830
730+13.208	87.314
730+13.727	84.312
730+15.883	106.427
730+18.688	102.289
730+33.576	66.595
730+41.261	106.310
730+41.442	55.684
730+43.576	76.674
730+68.125	63.436
730+92.977	95.946
730+98.305	73.047
730+102.220	96.654
730+103.056	80.150
730+134.851	53.753
730+137.382	95.367
730+141.621	75.847
730+142.119	71.720
730+145.774	81.828
730+149.934	88.184
730+158.211	98.646
730+164.217	80.993
730+166.812	95.981
730+168.254	80.974
730+169.191	69.720
730+169.545	88.093
730+172.530	93.329
730+174.022	80.948
730+176.315	110.187
730+177.872	71.180
730+178.780	88.426
730+185.356	70.395
730+188.550	56.506
730+188.593	88.755
730+191.347	81.993
730+192.054	88.739
730+192.277	70.363
730+195.075	95.851
730+195.190	71.850
730+209.458	93.909
730+209.472	64.659
730+210.244	104.781
730+210.431	54.530
730+211.506	80.400
730+211.585	84.524
730+212.003	76.272
730+219.826	93.111
730+224.483	95.340
730+240.979	83.264];
data.tL_m(:,1) =  data.tL_m(:,1) - 167; % set origin to birth
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JVHL'; % Cat of Life
metaData.links.id_ITIS = '700451'; % ITIS
metaData.links.id_EoL = '795625'; % Ency of Life
metaData.links.id_Wiki = 'Austrelaps_superbus'; % Wikipedia
metaData.links.id_ADW = 'Austrelaps_superbus'; % ADW
metaData.links.id_Taxo = '90726'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Austrelaps&species=superbus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Austrelaps_superbus}}';
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
bibkey = 'Rohr2001'; type = 'Article'; bib = [ ...  
'doi = {10.1139/cjz-79-6-1030}, ' ...
'author = {Rohr, D. H.}, ' ...
'year = {2001}, ' ...
'title = {Reproductive trade-offs in the elapid snakes \emph{Austrelaps superbus} and \emph{Austrelaps ramsayi}}, ' ... 
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {79(6)}, '...
'pages = {1030-1037}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 


