function [data, auxData, metaData, txtData, weights] = mydata_Passerculus_sandwichensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Passerellidae';
metaData.species    = 'Passerculus_sandwichensis'; 
metaData.species_en = 'Savannah sparrow'; 

metaData.ecoCode.climate = {'BSk', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf', 'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wd'; 't-E'; 't-JO'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 17];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 12];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 12.5;   units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'WillPrin1986';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 11;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'WillPrin1986';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;    units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'WillPrin1986';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at first brood';  bibkey.tR = 'WillPrin1986';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'WillPrin1986';
% data.Wwp = 27;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 28;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '15-29 g';

data.Ri  = 3.16/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'WillPrin1986';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-respiration
data.tJO = [ ... % time since birth (d), O2-cons (cc O2/h)
0.000	9.767
0.001	6.349
0.002	3.907
0.014	7.814
0.015	5.047
0.957	17.581
0.958	9.279
0.959	8.140
0.960	6.349
0.961	4.395
0.975	10.581
1.936	10.907
1.951	19.698
2.001	13.512
2.960	19.698
2.961	18.233
2.977	15.953
2.978	14.163
2.979	10.419
2.980	9.116
3.952	32.070
3.953	26.372
3.954	21.977
3.971	19.860
3.988	17.256
4.958	49.326
4.961	37.442
4.962	30.930
4.975	46.395
4.976	40.698
4.977	40.047
4.978	35.814
4.979	29.953
4.992	41.512
4.995	31.907
5.951	54.047
5.952	49.000
5.953	45.256
6.962	49.326
6.996	42.326
7.986	59.419];
units.tJO  = {'d', 'cc O2/h'}; label.tJO = {'time since birth', 'O2 consumption'};  
temp.tJO   = C2K(41.6); units.temp.tJO = 'K'; label.temp.tJO = 'temperature';
bibkey.tJO = 'WillPrin1986';

% time-weight
% lean dry mass = dry mass without lipid
data.tWd = [ % time since birth (d), lean dry mass (g), lipid (g)
0.015	0.375 .042
0.016	0.306 .071
0.017	0.221 .051
0.968	0.377 .052
0.969	0.257 .068
1.002	0.598 .081
1.989	0.668 .035
2.005	0.787 .103
2.958	0.500 .065
2.959	0.449 .087
2.973	1.130 .100
2.974	1.011 .113
2.976	0.602 .139
3.009	0.909 .203
3.010	0.823 .223
3.962	0.825 .345
3.975	1.745 .126
3.993	1.506 .300
3.994	1.370 .229
3.995	1.302 .300
4.011	1.574 .229
4.960	2.359 .345
4.977	2.257 .274
4.979	1.747 .303
4.980	1.679 .365
4.981	1.628 .419
4.982	1.560 .461
4.992	2.802 .232
4.994	2.206 .477
4.995	2.138 .300
4.997	1.832 .230
5.964	2.328 .300
5.965	2.140 .542
5.966	2.021 .594
6.984	2.789 .555
7.950	3.591 .358];
data.tWd = [data.tWd(:,1), data.tWd(:,2) + data.tWd(:,3)];
units.tWd   = {'d', 'g'};  label.tWd = {'time since birth', 'dry weight'};  
temp.tWd    = C2K(41.6);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'WillPrin1986';
%
data.tWw = [ % time since birth (d), wet mass (g)
0.000	1.427
0.011	2.446
0.012	2.039
0.013	1.699
0.999	3.797
1.001	3.118
1.002	2.778
1.004	2.098
1.987	5.352
1.988	4.944
1.990	4.265
2.973	7.246
2.975	6.635
2.976	6.023
2.977	5.751
2.978	5.547
2.979	5.276
2.980	5.004
2.981	4.256
2.983	3.576
3.965	7.034
3.977	9.141
3.981	7.646
3.982	7.306
3.986	5.743
4.965	10.831
4.966	10.356
4.967	9.744
5.956	10.823
5.987	12.250
6.004	12.590
6.959	12.921
7.985	13.252];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(41.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'WillPrin1986';

% time-energy 
data.tE = [ % time since birth (d), energy (kJ)
0.000	3.947
0.001	5.526
0.002	6.842
0.934	8.653
0.947	10.758
0.973	12.862
1.974	16.777
2.959	28.850
2.971	17.007
2.984	19.638
2.985	22.007
3.972	37.764
3.973	40.132
3.986	43.026
3.997	26.973
4.958	42.205
4.973	58.783
4.974	61.152
4.975	61.152
4.976	70.625
4.984	45.888
4.985	49.046
4.986	52.993
4.987	56.941
4.988	61.941
5.986	70.855
5.998	57.171
5.999	60.592
6.972	74.770
7.984	79.474];
units.tE   = {'d', 'kJ'};  label.tE = {'time since birth', 'energy content'};  
temp.tE    = C2K(41.6);  units.temp.tE = 'K'; label.temp.tE = 'temperature';
bibkey.tE = 'WillPrin1986';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = weights.tWw * 2;
% weights.tWd = weights.tWd * 2;
% weights.tJO = weights.tJO * 2;
% weights.tE = weights.tE * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: food availability is taken variable in tW data';
D3 = 'nod_4: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4DXYF'; % Cat of Life
metaData.links.id_ITIS = '179314'; % ITIS
metaData.links.id_EoL = '45511198'; % Ency of Life
metaData.links.id_Wiki = 'Passerculus_sandwichensis'; % Wikipedia
metaData.links.id_ADW = 'Passerculus_sandwichensis'; % ADW
metaData.links.id_Taxo = '58100'; % Taxonomicon
metaData.links.id_WoRMS = '422665'; % WoRMS
metaData.links.id_avibase = '26EB95E7DDA0BFEB'; % avibase
metaData.links.id_birdlife = 'savannah-sparrow-passerculus-sandwichensis'; % birdlife
metaData.links.id_AnAge = 'Passerculus_sandwichensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Passerculus_sandwichensis}}';
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
bibkey = 'WillPrin1986'; type = 'Article'; bib = [ ... 
'author = {Williams, J. B. and Prints, A.}, ' ... 
'year = {1986}, ' ...
'title = {Energetics of growth in nesting savannah sparrows: a comparison of doubly labelled water and laboratory estimates}, ' ...
'journal = {The condor}, ' ...
'volume = {88}, ' ...
'pages = {74--83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dixo1978'; type = 'Article'; bib = [ ... 
'author = {Dixon, C. L.}, ' ... 
'year = {1978}, ' ...
'title = {Breeding biology of the savannah sparrow on {K}ent {I}sland}, ' ...
'journal = {The Auk}, ' ...
'volume = {95}, ' ...
'pages = {235--246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

