function [data, auxData, metaData, txtData, weights] = mydata_Acanthurus_nigricans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Acanthurus_nigricans'; 
metaData.species_en = 'Whitecheek surgeonfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 05];

%% set data
% zero-variate data

data.am = 34*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 36;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.7 mm: 4/3*pi*0.035^3'; 
data.Wwp = 125; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02630*Lp^2.93, see F1';
data.Wwi = 955; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02630*Li^2.93, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(27.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL_P = [ ... % time since hatch (yr), std length (cm)
0.752	6.307
1.179	6.731
1.855	8.928
3.079	11.407
3.198	10.626
3.201	11.761
5.087	11.685
5.275	13.528
5.332	12.252
6.011	15.583
6.368	12.816
6.983	15.297
7.098	12.814
7.337	11.466
8.008	12.244
8.201	15.648
9.163	11.815
9.233	14.936
10.008	9.685
10.077	12.309
10.207	15.146
11.110	12.093
11.175	13.583
11.233	12.519
11.241	15.214
11.242	15.639
11.975	16.488
12.034	15.921
12.093	15.211
13.312	15.988
13.921	16.270
13.980	15.702
14.951	15.132
15.136	15.699
15.866	15.981
15.929	16.690
17.082	15.552
18.176	15.265];
data.tL_P(:,1) = (0 + data.tL_P(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-8;end;end
units.tL_P = {'d', 'cm'};  label.tL_P = {'time since birth', 'std length','Palmyra'};  
temp.tL_P = C2K(27.4);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'RuttHami2011';
comment.tL_P = 'Data from Palmyra'; 
%
data.tL_K = [ ... % time since hatch (yr), std length (cm)
0.944	9.498
1.986	12.119
2.166	11.410
2.231	12.828
2.972	16.230
3.143	12.683
3.208	13.889
4.116	12.326
4.116	12.610
4.248	15.730
4.303	13.815
4.307	15.233
4.365	14.382
5.032	13.671
5.218	14.805
6.008	14.732
6.130	14.590
6.244	12.320
7.221	13.381
7.234	17.565
9.113	15.503
9.898	13.444
10.153	17.557
10.199	12.734
10.996	14.789
12.949	16.769
13.074	17.903
14.152	12.227
14.214	12.652
15.070	14.139
15.251	13.642
15.797	13.286
16.044	14.349
16.053	17.469
16.954	13.637
17.207	16.828
18.179	16.258
18.182	17.463
18.908	16.256
18.912	17.390
19.026	14.908
20.005	16.749
20.070	18.167
20.802	18.733
20.919	17.243
21.953	17.240
24.202	16.808
26.030	17.654];
data.tL_K(:,1) = (0 + data.tL_K(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_K,1); if data.tL_K(i,1)<=data.tL_K(i-1,1);data.tL_K(i,1)=data.tL_K(i-1,1)+1e-8;end;end
units.tL_K = {'d', 'cm'};  label.tL_K = {'time since birth', 'std length','Kiritimati'};  
temp.tL_K = C2K(27.4);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'RuttHami2011';
comment.tL_K = 'Data from Kiritimati'; 

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
set1 = {'tL_P','tL_K'}; subtitle1 = {'Data from Palmyra, Kiritimati'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'weight-length relationship: W in g = 0.02630*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64G2T'; % Cat of Life
metaData.links.id_ITIS = '172276'; % ITIS
metaData.links.id_EoL = '46577061'; % Ency of Life
metaData.links.id_Wiki = 'Acanthurus_nigricans'; % Wikipedia
metaData.links.id_ADW = 'Acanthurus_nigricans'; % ADW
metaData.links.id_Taxo = '159961'; % Taxonomicon
metaData.links.id_WoRMS = '219638'; % WoRMS
metaData.links.id_fishbase = 'Acanthurus-nigricans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthurus_nigricans}}';
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
bibkey = 'RuttHami2011'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0021062}, ' ...
'author = {Ruttenberg B.I. and Hamilton, S.L. and Walsh, S.M. and Donovan, M.K. and Friedlander, A. and et al.}, ' ...
'year = {2011}, ' ...
'title = {Predator-Induced Demographic Shifts in Coral Reef Fish Assemblages}, ' ... 
'journal = {PLoSONE}, ' ...
'volume = {6(6)}, '...
'pages = {e21062}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthurus-nigricans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

