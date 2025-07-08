function [data, auxData, metaData, txtData, weights] = mydata_Scarus_frenatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_frenatus'; 
metaData.species_en = 'Bridled parrotfish'; 

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

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 47;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.66 mm of Calotomus_japonicus: pi/6*0.066^3'; 
data.Wwp = 171.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01738*Lip^3.07, see F1';
data.Wwi = 2.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^3.07, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
data.tL_mid = [ ... % time since birth (yr), std length (cm)
0.887	19.214
0.920	20.257
0.923	17.909
0.998	10.604
1.895	21.644
1.930	20.426
1.960	23.470
1.967	17.383
2.004	13.991
2.938	22.161
2.940	19.987
2.966	26.944
2.973	20.770
3.007	21.117
3.911	25.548
3.942	27.635
4.016	21.548
4.042	28.504
4.046	24.504
4.952	27.631
4.953	26.587
5.023	24.674
5.897	25.453
5.928	28.061
5.934	22.583
5.935	22.061
5.999	25.017
6.939	27.448
6.971	28.491
6.977	23.274
7.948	28.226
7.952	25.096
7.986	24.487
8.957	28.918
9.969	27.348
9.974	23.087
10.947	26.213
11.858	24.557
11.859	23.948
11.955	28.296
11.961	22.296
12.935	24.465
12.936	24.118
13.941	28.200
15.018	28.456
15.995	28.626
16.942	24.622
17.010	23.839
17.980	29.400
18.996	24.439];
data.tL_mid(:,1) = 365*(0+data.tL_mid(:,1)); % convert yr to d
units.tL_mid   = {'d', 'cm'};  label.tL_mid = {'time since birth', 'std length', 'mid shelf'};  
temp.tL_mid    = C2K(28.2);  units.temp.tL_mid = 'K'; label.temp.tL_mid = 'temperature';
bibkey.tL_mid = 'GustChoa2002'; 
%
data.tL_out = [ ... % time since birth (yr), std length (cm)
0.929	12.344
0.957	17.039
0.960	14.605
0.961	13.909
0.962	13.474
0.963	13.126
0.990	17.474
0.991	16.430
0.992	15.735
0.993	15.561
0.995	12.952
1.868	15.905
1.898	18.774
1.936	14.600
1.964	19.991
1.966	17.904
1.967	17.209
1.968	16.774
1.969	16.339
2.003	15.296
2.877	16.596
2.878	15.901
2.908	17.987
2.909	17.553
2.910	17.118
3.852	17.809
3.919	18.331
3.947	23.548
3.951	19.722
3.952	19.374
3.953	17.548
3.982	22.244
4.960	20.848
4.961	20.413
4.962	19.631
4.990	24.152
4.995	19.109
4.996	18.239
4.997	17.630
5.027	21.109
5.870	19.974
5.936	21.365
5.970	20.583
6.914	19.448
6.947	20.231
6.979	21.187];
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01738*(TL in cm)^3.07';
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

