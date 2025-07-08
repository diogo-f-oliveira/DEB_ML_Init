function [data, auxData, metaData, txtData, weights] = mydata_Rhizoprionodon_acutus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Rhizoprionodon_acutus'; 
metaData.species_en = 'Milk shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(31); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Le'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data;
data.ab = 310;     units.ab = 'd';      label.ab = 'age at birth'; bibkey.ab = 'Whit2003';    
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed';
data.am = 9*365;   units.am = 'd';      label.am = 'life span';    bibkey.am = 'Whit2003';   
  temp.am = C2K(31); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 34;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';            bibkey.Lb  = 'Whit2003';
data.Lp_f  = 70;   units.Lp_f  = 'cm';  label.Lp_f  = 'total length at puberty (female)'; bibkey.Lp_f  = 'fishbase';
data.Lp_m  = 68;   units.Lp_m  = 'cm';  label.Lp_m  = 'total length at puberty (male)'; bibkey.Lp_m  = 'fishbase';
data.Li_f  = 133;  units.Li_f  = 'cm';  label.Li_f  = 'ultimate total length (female)'; bibkey.Li_f  = 'Whit2003';
data.Li_m  = 111;  units.Li_m  = 'cm';  label.Li_m  = 'ultimate total length (male)';   bibkey.Li_m  = 'Whit2003';

data.Wwi_f = 2750; units.Wwi_f = 'g';   label.Wwi_f = 'ultimate wet weight (female)';   bibkey.Wwi_f = 'AnAge';
data.Ri  = 4.2/365;units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'Whit2003';   
  temp.Ri = C2K(31); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length for embryo
data.tL_e = [ ... fork length (cm), weight (g)
45.434	1.569
75.552	5.839
136.301	16.732
166.930	22.919
227.168	27.887
258.308	31.895
319.056	31.024
348.664	33.377];
units.tL_e = {'d', 'cm'};     label.tL_e = {'age', 'total length'};
temp.tL_e = C2K(31); units.temp.tL_e = 'K'; label.temp.tL_e = 'temperature';
comment.tL_e = 'temperature: 29.4-33.5 C';
bibkey.tL_e = 'Whit2003';
% females
data.tL_f = [ ... % time since birth (yr), length (cm)
0.120	41.818
0.120	43.636
0.120	45.455
0.179	49.697
0.239	38.788
0.239	52.727
0.538	48.485
0.538	55.758
1.076	67.273
1.076	76.970
1.136	70.909
1.196	63.636
1.375	66.061
1.495	64.848
1.555	67.273
2.033	74.545
2.033	81.818
2.033	83.636
2.093	73.939
2.153	80.000
2.213	68.485
2.392	77.576
2.392	81.818
2.452	72.727
2.631	88.485
2.751	76.364
2.990	81.818
3.050	84.848
3.110	88.485
3.110	90.909
3.229	83.636
3.229	92.121
3.229	100.606
3.409	92.727
3.468	80.606
3.468	87.273
3.528	89.697
3.648	86.061
3.648	88.485
3.827	84.242
3.947	80.606
3.947	86.061
3.947	87.273
3.947	90.909
4.066	93.333
4.186	86.667
4.186	89.091
4.186	107.273
4.246	76.970
4.246	88.485
4.246	96.970
4.425	77.576
4.485	81.212
4.485	92.121
4.545	95.152
4.545	96.970
4.904	90.909
4.963	78.182
5.023	93.939
5.083	96.364
5.203	88.485
5.203	91.515
5.262	98.182
5.382	100.000
5.442	95.758
5.442	96.970
5.442	106.667
5.741	100.000
5.980	92.727
6.040	97.576
6.100	99.394
6.159	106.061
6.159	109.091
6.219	89.091
6.279	103.030
6.458	103.636
6.638	98.182
6.997	98.788
7.116	100.606
7.116	104.848
7.116	106.667
7.116	109.697
7.176	90.303
7.296	95.758
7.296	98.788
7.355	105.455
7.475	107.879
8.073	101.818
8.193	106.061
8.193	115.758
8.372	116.364
8.432	108.485
8.611	100.606
8.910	111.515
9.030	104.848
9.209	112.727
9.329	122.424
9.389	110.909
9.568	102.424
9.688	117.576
10.047	115.758
10.166	107.273
10.166	121.818
10.226	110.909
10.226	113.939
10.226	118.788
10.405	120.000
10.465	117.576
10.525	114.545
10.884	111.515
10.944	108.485
11.302	109.091
11.362	116.364
11.362	119.394
11.661	113.939
11.841	112.727
12.020	112.727
12.080	109.697
12.379	116.364
12.379	127.273
12.558	112.727
12.618	118.788
13.156	131.515
13.216	109.697
13.395	117.576
13.934	124.242
14.233	120.606
14.711	126.667
15.070	124.242
15.130	126.061
16.146	115.152
16.385	133.939];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(31); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Whit2003';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.120	456.790
0.180	438.667
0.240	402.440
0.240	492.957
1.140	565.069
1.140	631.448
1.320	649.492
1.380	679.644
1.500	631.328
1.560	673.549
1.680	733.854
1.680	751.957
1.920	727.739
2.100	685.437
2.220	631.086
2.400	806.026
2.460	745.661
2.940	805.845
3.000	823.928
3.180	769.558
3.180	932.489
3.240	823.848
3.420	787.581
3.780	823.667
4.080	823.566
4.140	944.236
4.560	895.819
5.040	1034.451
5.100	883.569
5.220	968.012
6.000	913.440
6.060	949.627
6.720	1033.888
6.900	1003.655
7.140	1057.885
7.680	967.187
7.980	1039.500
8.040	1003.273
8.220	1039.420
9.960	1075.043
9.960	1099.181
10.020	948.299
10.080	1111.210
10.380	1062.834
12.060	1086.408];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/10; % convert mm to cm
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};
temp.tL_m = C2K(31); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Whit2003';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li_f = 5 * weights.Li_f;
weights.Li_m = 5 * weights.Li_m;
weights.Ri = 2 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '4SDDD'; % Cat of Life
metaData.links.id_ITIS = '160211'; % ITIS
metaData.links.id_EoL = '46559818'; % Ency of Life
metaData.links.id_Wiki = 'Rhizoprionodon_acutus'; % Wikipedia
metaData.links.id_ADW = 'Rhizoprionodon_acutus'; % ADW
metaData.links.id_Taxo = '41999'; % Taxonomicon
metaData.links.id_WoRMS = '105802'; % WoRMS
metaData.links.id_fishbase = 'Rhizoprionodon-acutus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhizoprionodon_acutus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Whit2003'; type = 'PhDthesis'; bib = [ ...  
'author = {W. T. White}, ' ...
'year = {2003}, ' ...
'title  = {Aspects of the biology of elasmobranchs in a subtropical embayment in {W}estern {A}ustralia and of chondrichthyan fisheries in {I}ndonesia}, ' ...
'school = {Murdoch Univ, Western Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhizoprionodon_acutus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.us/Reproduction/MaturityList.php?id=899&genusname=Rhizoprionodon&speciesname=acutus&fc=11&lang=swedish}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

