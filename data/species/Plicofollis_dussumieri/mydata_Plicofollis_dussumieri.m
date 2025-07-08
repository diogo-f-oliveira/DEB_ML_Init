function [data, auxData, metaData, txtData, weights] = mydata_Plicofollis_dussumieri
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Plicofollis_dussumieri'; 
metaData.species_en = 'Blacktip sea catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 04];

%% set data
% zero-variate data;

data.am = 15*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AlHuAlBa2021';
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 42;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
data.Li  = 85;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 0.7; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AlHuAlBa2021'; 
  comment.Wwb = 'based on egg diameter of 11 mm: pi/6*1.1^3';
data.Wwp  = 695; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'guess'; 
  comment.Wwp = 'based on 0.00871*Lp^3.02, see F1';
data.Wwi  = 5.8e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00871*Li^3.02, see F1';
 
data.Ri = 274/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate at 70 cm';     bibkey.Ri = 'AlHuAlBa2021';
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.391	50.907
2.392	47.954
2.408	40.656
2.436	45.000
2.437	43.089
2.451	46.564
2.480	49.865
2.480	48.822
2.789	46.737
2.803	52.297
2.817	55.946
2.848	49.865
2.863	48.301
2.950	55.251
3.023	56.467
3.172	48.301
3.243	62.027
3.407	48.475
3.611	66.371
3.847	60.985
3.848	55.772
3.862	56.988
3.877	58.726
3.877	58.031
3.878	53.861
3.922	53.514
3.951	56.293
4.009	59.595
4.009	59.073
4.010	54.382
4.112	58.726
4.347	62.201
4.362	59.595
4.391	63.243
4.392	60.985
4.392	57.683
4.436	63.069
4.805	55.077
4.817	71.409
4.834	56.988
4.862	65.154
4.863	60.116
4.908	53.340
4.979	67.587
5.009	65.502
5.040	58.726
5.215	68.629
5.215	67.413
5.878	65.676
5.891	71.757
5.981	63.764
6.333	74.537
6.862	80.965
6.878	69.324
6.922	70.714
6.965	75.927
7.084	73.494
7.157	72.973
7.202	71.236
7.217	65.154
7.246	68.977
7.305	71.236
7.849	72.625
7.878	74.884
8.039	80.965
8.055	72.799
8.218	65.502
8.261	76.274
8.880	72.104
8.880	69.151
8.909	74.189
10.072	75.579];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % conver yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AlHuAlBa2021';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.658	33.185
2.128	39.093
2.172	43.089
2.231	39.266
2.246	40.135
2.318	48.127
2.318	46.042
2.347	51.950
2.362	49.517
2.378	43.958
2.378	43.784
2.407	42.568
2.421	47.432
2.466	45.174
2.642	47.780
2.833	50.039
2.846	59.073
2.950	51.776
3.096	60.811
3.126	56.815
3.156	58.205
3.158	43.089
3.186	50.734
3.230	52.297
3.231	46.216
3.244	59.942
3.288	56.293
3.289	54.903
3.348	51.255
3.392	53.687
3.406	57.162
3.435	58.031
3.569	49.344
3.790	49.517
3.805	48.649
3.806	44.131
3.818	58.205
3.818	56.641
3.834	51.255
3.835	45.869
3.847	63.417
3.848	55.946
3.863	53.861
3.876	64.112
3.906	60.290
3.949	65.328
3.980	59.073
3.994	62.896
4.024	56.641
4.038	61.506
4.083	58.031
4.125	70.367
4.141	65.154
4.155	67.587
4.156	63.069
4.216	55.251
4.232	48.301
4.259	59.768
4.274	59.073
4.288	64.112
4.333	61.332
4.405	66.544
4.421	59.768
4.818	63.764
4.819	60.290
4.864	56.293
4.907	60.290
5.053	66.023
5.155	71.583
5.245	63.764
5.289	65.502
5.392	67.761
5.393	60.637
5.981	66.197
6.025	68.456
6.112	72.452
6.142	71.409
6.158	64.981
6.202	62.722
6.290	64.112
6.377	70.888
7.113	76.622
7.158	67.934
7.217	67.239
7.218	63.069
7.262	62.027
7.275	74.537
7.276	66.023
7.290	72.799
7.291	67.761
8.085	73.494
8.233	66.892
8.364	74.710
8.379	75.753
9.321	73.842
10.189	76.100
11.176	72.799
12.147	76.100
12.221	74.710
12.486	78.012];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % conver yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AlHuAlBa2021';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4KG23'; % Cat of Life
metaData.links.id_ITIS = '680772'; % ITIS
metaData.links.id_EoL = '219269'; % Ency of Life
metaData.links.id_Wiki = 'Plicofollis_layardi'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5600610'; % Taxonomicon
metaData.links.id_WoRMS = '1043427'; % WoRMS
metaData.links.id_fishbase = 'Plicofollis-layardi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Plicofollis_layardi}}';
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
bibkey = 'AlHuAlBa2021'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.rsma.2021.101885}, ' ...
'author = {M. Al-Husaini and A. Al-Baz and T. Dashti and S. Rajab;H. Husain},'...
'title = {Age, growth, and reproductive parameters of four species of sea catfish ({S}iluriformes: {A}riidae) from {K}uwaiti waters },'...
'journal = {Regional Studies in Marine Science}, '...
'volume = {46}, '...
'year = {2021}, '...
'pages = {101885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Plicofollis-layardi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

