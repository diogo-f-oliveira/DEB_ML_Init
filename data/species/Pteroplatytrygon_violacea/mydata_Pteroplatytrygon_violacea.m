function [data, auxData, metaData, txtData, weights] = mydata_Pteroplatytrygon_violacea
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Pteroplatytrygon_violacea'; 
metaData.species_en = 'Pelagic stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 08];

%% set data
% zero-variate data;
data.ab = 4*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(24.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'MollEzcu2002';   
  temp.am = C2K(24.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
  comment.Lb = '15-25 cmdisc width';
data.Lp  = 45;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females';   bibkey.Lp  = 'fishbase';
data.Li  = 96; units.Li  = 'cm';  label.Li  = 'disc width for females';   bibkey.Li  = 'MollEzcu2002';
data.Lim  = 68; units.Lim  = 'cm';  label.Lim  = 'disc width for males';   bibkey.Lim  = 'MollEzcu2002';

data.Wwi = 49e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'MollEzcu2002';
  comment.Wwi = 'disc width 96 cm';
data.Wwim = 12e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'MollEzcu2002';
  comment.Wwi = 'disc width 68 cm';

data.Ri  = 36/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.004	18.868
0.027	20.545
0.027	18.029
0.028	16.981
0.038	17.609
0.039	14.045
0.059	15.512
0.183	21.170
0.369	24.521
0.847	29.752
1.458	45.881
1.657	37.282
1.739	42.940
1.916	45.243
1.999	43.774
2.009	46.499
2.134	43.351
2.155	46.705
2.185	48.591
2.207	43.979
2.216	50.058
2.300	49.847
2.465	56.342
2.548	55.292
2.620	61.371
2.756	57.804
2.765	61.577
2.930	69.750
2.954	56.332
3.046	61.571
3.077	62.619
3.190	73.099
3.233	65.131
3.274	65.969
3.532	76.236
3.761	79.586
3.762	70.781
3.764	65.540
3.773	68.055
3.783	73.296
3.835	74.553
3.979	81.468
4.054	72.242
4.063	74.967
4.189	73.078
4.219	77.689
4.249	82.930
4.251	75.592
4.323	76.849
4.531	78.102
4.645	78.729
4.758	87.531
4.791	79.564
4.894	82.916
4.927	76.207
4.978	82.076
5.176	78.717
5.185	84.587
5.257	89.617
5.258	84.166
5.528	85.628
5.570	83.531
5.757	88.349
5.768	84.785
5.778	86.671
5.923	89.394
5.996	86.457
6.060	82.682
6.194	87.711
6.235	89.177
6.755	90.215
7.254	92.930
7.275	93.768
7.784	95.644
7.785	94.176
8.252	96.473
8.263	95.215
8.596	94.788
8.617	96.465];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width','female'};  
temp.tL_f = C2K(24.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MollEzcu2002'; 
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.017	20.125
0.027	17.609
0.028	16.352
0.038	19.077
0.049	14.884
0.111	18.446
0.172	21.170
0.328	24.102
0.857	30.171
1.688	37.910
1.947	43.775
1.978	42.935
2.103	43.771
2.135	40.626
2.155	44.190
2.238	44.188
2.311	45.654
2.519	47.536
2.528	51.939
2.601	50.050
2.611	54.033
2.778	53.191
2.788	51.514
2.800	46.901
2.891	56.334
2.934	52.769
2.996	54.025
2.997	49.623
3.059	52.137
3.131	56.538
3.142	52.974
3.153	51.087
3.163	49.200
3.182	59.472
3.225	55.069
3.307	57.163
3.308	56.325
3.504	63.868
3.535	64.077
3.546	61.771
3.547	57.368
3.607	65.752
3.732	65.540
3.734	57.364
3.743	62.395
3.796	59.669
3.826	64.909
3.920	61.763
3.992	66.164
4.015	59.874
4.108	59.872
4.139	62.177
4.140	58.194
4.159	66.789
4.211	64.272
4.222	61.756
4.263	65.529
4.327	60.287
4.491	70.136
4.514	61.750
4.595	69.925
4.763	64.680
4.773	63.003
4.783	67.195
4.784	60.906
4.897	68.451
5.136	68.865
5.272	67.814
5.294	63.201
5.771	72.206
5.783	63.191
5.844	68.221
6.271	68.422
6.293	62.971
6.605	62.755
6.614	67.786];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width','male'};  
temp.tL_m = C2K(24.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MollEzcu2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'aplacental viviparous';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4Q2NB'; % Cat of Life
metaData.links.id_ITIS = '621026'; % ITIS
metaData.links.id_EoL = '46560947'; % Ency of Life
metaData.links.id_Wiki = 'Pteroplatytrygon_violacea'; % Wikipedia
metaData.links.id_ADW = 'Pteroplatytrygon_violacea'; % ADW
metaData.links.id_Taxo = '42144'; % Taxonomicon
metaData.links.id_WoRMS = '158540'; % WoRMS
metaData.links.id_fishbase = 'Pteroplatytrygon_violacea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteroplatytrygon_violacea}}'; 
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
bibkey = 'MollEzcu2002'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF01074}, ' ...
'author = {H. F. Mollet and J. M. Ezcurra and J. B. O''Sullivan}, ' ...
'year = {2002}, ' ...
'title  = {Captive biology of the pelagic stingray, \emph{Dasyatis violacea} ({B}onaparte, 1832)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {53}, ' ...
'pages = {531–541}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Pteroplatytrygon-violacea.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

