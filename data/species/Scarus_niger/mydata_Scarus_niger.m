function [data, auxData, metaData, txtData, weights] = mydata_Scarus_niger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_niger'; 
metaData.species_en = 'Dusky  parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'GustChoa2002';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 44;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm of Calotomus_japonicus: pi/6*0.066^3'; 
data.Wwp = 119; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01549*Lp^3.04, see F1';
data.Wwi = 1.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.04, see F1; max published weight 2 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
% time-length
data.tL_mid = [ ... % time since birth (yr), std length (cm)
0.978	16.245
0.979	16.928
1.002	13.253
1.032	17.441
1.971	18.558
1.972	19.327
1.974	22.489
1.995	16.677
1.996	18.130
1.998	20.096
2.020	15.395
2.021	16.079
2.022	17.019
2.023	17.618
2.937	21.640
2.961	18.819
2.962	19.418
2.966	24.033
2.986	18.050
2.991	22.836
3.015	20.529
3.981	22.671
3.982	23.696
3.983	24.893
4.030	19.680
4.973	24.556
4.996	22.078
4.998	23.873
4.999	25.497
5.025	24.899
5.026	25.839
5.050	23.275
5.930	17.297
5.936	23.365
5.963	24.305
5.989	24.989
6.090	21.229
7.029	22.516
7.030	23.371
7.032	25.251
7.055	22.174
7.060	27.986
7.972	27.991
7.996	25.256
8.023	25.855
8.047	24.231
8.071	21.838
8.961	26.800
8.986	24.492
9.040	27.741
9.950	25.181
9.977	26.207
11.019	25.187
12.032	21.688
15.994	23.333];
data.tL_mid(:,1) = 365*(0+data.tL_mid(:,1)); % convert yr to d
units.tL_mid   = {'d', 'cm'};  label.tL_mid = {'time since birth', 'std length', 'mid shelf'};  
temp.tL_mid    = C2K(28.2);  units.temp.tL_mid = 'K'; label.temp.tL_mid = 'temperature';
bibkey.tL_mid = 'GustChoa2002'; 
%
data.tL_out = [ ... % time since birth (yr), std length (cm)
0.872	13.680
0.899	14.535
0.925	15.048
0.926	15.731
0.975	12.227
1.992	13.344
1.994	15.053
2.019	14.113
2.959	16.682
2.983	14.375
2.985	16.170
3.012	17.281
3.034	13.179
3.036	15.401
3.062	14.974
3.922	14.978
3.949	15.919
3.973	14.722
3.974	15.491
3.975	16.688
3.976	16.859
3.977	17.372
3.978	17.884
4.964	15.838
4.965	16.437
4.992	17.377
4.993	17.719
4.994	18.745
5.020	19.001
5.931	17.639
6.010	19.434
6.920	16.533
6.972	16.106
6.973	18.413
6.974	18.584
6.975	19.268
7.001	20.123
7.938	19.188
7.939	19.957
7.964	18.504
7.966	20.555
8.015	16.795
9.994	16.036
9.998	20.481
11.038	17.837
11.042	22.025
12.031	21.090];
data.tL_out(:,1) = 365*(0+data.tL_out(:,1)); % convert yr to d
units.tL_out   = {'d', 'cm'};  label.tL_out = {'time since birth', 'std length', 'outer shelf'};  
temp.tL_out    = C2K(28.2);  units.temp.tL_out = 'K'; label.temp.tL_out = 'temperature';
bibkey.tL_out = 'GustChoa2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_mid = 5 * weights.tL_mid;
weights.tL_out = 5 * weights.tL_out;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_mid','tL_out'}; subtitle1 = {'Data for mid, outer shelf'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01549*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V3JK'; % Cat of Life
metaData.links.id_ITIS = '614830'; % ITIS
metaData.links.id_EoL = '46572634'; % Ency of Life
metaData.links.id_Wiki = 'Scarus_frenatus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_frenatus'; % ADW
metaData.links.id_Taxo = '186685'; % Taxonomicon
metaData.links.id_WoRMS = '219113'; % WoRMS
metaData.links.id_fishbase = 'Scarus-frenatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished170927 = {\url{http://en.wikipedia.org/wiki/Scarus_frenatus}}';
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
bibkey = 'GustChoa2002'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-001-0773-6}, ' ...
'author = {Gust, N. and J.H. Choat and J.L. Ackerman}, ' ... 
'year = {2002}, ' ...
'title = {Demographic plasticity in tropical reef fishes}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {140}, ' ...
'pages = {1039-1051}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-frenatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

