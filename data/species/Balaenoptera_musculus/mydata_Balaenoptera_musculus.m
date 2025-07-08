function [data, auxData, metaData, txtData, weights] = mydata_Balaenoptera_musculus

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Balaenoptera_musculus'; 
metaData.species_en = 'Blue whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Le'; 't-L'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2009 02 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2015 03 08];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_2  = {'Bas Kooijman'};          
metaData.date_mod_2    = [2016 11 13];                  
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_2 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_3  = {'Bas Kooijman','Starrlight Augustine'};          
metaData.date_mod_3    = [2018 07 24];                  
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_3 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 13];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman'};    
metaData.date_mod_5     = [2023 08 07];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 07];

%% set data
% zero-variate data
data.tg = 350;     units.tg = 'd';    label.tg = 'gestation time';                   bibkey.tg = 'Wiki';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  182;      units.tx = 'd';    label.tx = 'time since birth at weaning';bibkey.tx = 'Wiki';    
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Lock1981';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;    units.tpm = 'd';  label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Lock1981';
  temp.tpm = C2K(37); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 110*365;   units.am = 'd';    label.am = 'life span';                        bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 700;     units.Lb = 'cm';   label.Lb = 'total length at birth';            bibkey.Lb = 'Wiki';
data.Lx = 1400;    units.Lx = 'cm';   label.Lx = 'total length at weaning';             bibkey.Lx = 'Wiki';
data.Lp = 2393;    units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'Lock1981';
data.Lpm = 2274;    units.Lpm = 'cm';   label.Lpm = 'total length at puberty';          bibkey.Lpm = 'Lock1981';
data.Li = 2700;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'Wiki';

data.Wwb = 2.75e6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Wiki';
data.Wwx = 17e6;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';           bibkey.Wwx = 'AnAge';
data.Wwp = 69e6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'Wiki';
data.Wwi = 160e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Wiki';

data.Ri = 0.4/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';              bibkey.Ri = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.000	 700.000
0.374	1192.780
0.831	1645.667
1.007	1827.867
2.040	2072.121
3.275	2227.728
5.057	2393.467
7.555	2485.915
9.847	2526.388
12.139	2566.862
14.464	2591.692
16.755	2611.332
19.798	2630.580];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};
  temp.tL_f = C2K(37); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lock1981';
comment.tL_f = 'Data for females, reconstructed data from curve';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.000	 700.000
0.512	1208.334
0.827	1494.628
0.969	1682.054
1.315	1843.332
2.140	1988.736
3.101	2123.652
5.054	2273.677
7.175	2345.488
9.946	2411.753
12.956	2457.061
15.589	2481.731
17.538	2496.341
19.898	2505.529];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};
  temp.tL_m = C2K(37); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lock1981';
comment.tL_m = 'Data for males, reconstructed data from curve';

% time - weight
data.tW_f = [ ... % time since birth (yr), weight (ton)
0.007	2.800
0.510	20.486
0.844	31.371
1.400	43.331
2.211	55.941
3.118	68.129
3.900	78.393
4.908	87.814
7.704	97.525
9.707	103.365
11.807	108.783
13.655	112.059
15.504	114.482
17.387	115.842
19.940	117.656];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
data.tW_f(:,2) = 1e6 * data.tW_f(:,2); % convert ton to g
units.tW_f = {'d', 'g'};     label.tW_f = {'time since birth', 'weight', 'female'};
  temp.tW_f = C2K(37); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Lock1981';
comment.tW_f = 'Data for females, reconstructed data from curve';
%
data.tW_m = [ ... % time since birth (yr), length (cm)
0.070	2.800
0.759	24.973
1.280	38.423
2.375	53.177
3.666	64.955
5.154	73.331
6.901	80.013
8.490	85.196
10.718	90.619
12.917	94.124
15.436	96.789
17.542	98.797
19.936	100.178];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
data.tW_m(:,2) = 1e6 * data.tW_m(:,2); % convert ton to g
units.tW_m = {'d', 'g'};     label.tW_m = {'time since birth', 'weight', 'male'};
  temp.tW_m = C2K(37); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Lock1981';
comment.tW_m = 'Data for males reconstructed data from curve';

% time-length for foetus
data.tLe = [ ...
88.139	101.884
93.674	119.573
99.209	109.590
103.467	124.746
108.577	114.756
114.964	155.100
120.073	137.563
125.182	150.215
130.292	177.961
134.550	185.570
138.808	190.662
144.343	205.836
148.175	203.376
154.136	216.040
158.820	228.686
164.355	271.533
169.465	274.122
175.000	284.264
179.258	289.357
183.090	332.179
189.477	337.303
194.161	342.402
199.270	355.054
203.528	395.366
209.915	410.553
215.024	398.047
219.708	388.052
224.818	413.282
228.650	430.948
235.036	410.914
239.294	461.289
245.681	453.834
345.742	742.065];
units.tLe = {'d', 'cm'}; label.tLe = {'gestation time', 'total length'};  
temp.tLe = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'RostLick2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.tW_f = 0.2 * weights.tW_f;
weights.tW_m = 0.2 * weights.tW_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'neonates are longer for their weight than adults, so the shape coefficient is assumed to change linear in length till puberty';
D3 = 'mod_3: reconstructed tL and tW data, male/female, change in shape, different tp, Lp, am';
D4 = 'mod_4: males have equal state variables at b, compared to females';
D5 = 'mod_5: tLe data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'KF8T'; % Cat of Life
metaData.links.id_ITIS = '180528'; % ITIS
metaData.links.id_EoL = '46559433'; % Ency of Life
metaData.links.id_Wiki = 'Balaenoptera_musculus'; % Wikipedia
metaData.links.id_ADW = 'Balaenoptera_musculus'; % ADW
metaData.links.id_Taxo = '68889'; % Taxonomicon
metaData.links.id_WoRMS = '137090'; % WoRMS
metaData.links.id_MSW3 = '14300018'; % MSW3
metaData.links.id_AnAge = 'Balaenoptera_musculus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.Wikipedia.org/wiki/Balaenoptera_musculus}}';
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
bibkey = 'Smal1971'; type = 'Book'; bib = [ ...
'author = {Small, G. L.}, ' ...
'year = {1971}, ' ...
'title = {The blue whale}, ' ...
'publisher = {Columbia Univ Press, New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lock1981'; type = 'Incollection'; bib = [ ...
'author = {Lockyer, C.}, '...
'title = {Growth and energy budgets of large baleen whales from the southern hemisphere.}, '...
'booktitle = {Mammals in the Seas}, ' ...
'publisher = {FAO}, ' ...
'year = {1981}, ' ...
'volume = {III}, ' ...
'series = {FAO Fisheries series No 5}, ' ...
'address = {Rome}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=balaenoptera_musculus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RostLick2013'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ar.22678}, ' ...
'author = {Rachel A. Roston and David Lickorish and Emily A. Buchholtz}, ' ... 
'year = {2013}, ' ...
'title = {Anatomy and Age Estimation of anEarly Blue Whale (Balaenopteramusculus) Fetus}, ' ...
'journal = {The Aanatomical Record}, ' ...
'volume = {296}, ' ...
'pages = {709–722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

