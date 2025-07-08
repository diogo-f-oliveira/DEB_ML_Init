function [data, auxData, metaData, txtData, weights] = mydata_Glycymeris_glycymeris

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Arcida'; 
metaData.family     = 'Glycymerididae';
metaData.species    = 'Glycymeris_glycymeris'; 
metaData.species_en = 'Dog cockle'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 05]; 

%% set data
% zero-variate data

data.am = 75*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BrocReyn2012';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.1; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'guess';
data.Lp  = 3; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on shell length 2 cm: 2/7*3.5';
data.Li  = 6.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Wiki';

data.Wwb = 5.8e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 55 mum: pi/9*0.0055^3'; 
data.Wdi = 0.54; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'Shell length Glycymeris_glycymeris: (4.2/6.5)^2*1.3';

data.Ri  = 5e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';

% uni-variate data

% time-length 
data.tL = [ ... % time since settlement (a), shell increment in a yr  (mum)
1.205	299.823
2.216	301.709
2.920	312.959
4.308	283.936
4.936	299.869
6.102	301.757
6.968	330.808
7.877	268.993
9.106	230.600
9.960	229.674
11.144	275.591
13.227	237.209
14.158	231.600
15.154	196.016
16.165	197.902
17.022	203.533
18.113	210.104
20.341	144.558
21.270	134.265
22.062	170.809
23.077	183.937
24.091	192.380
25.094	173.657
25.394	145.558
26.240	122.149
27.176	132.465
28.179	111.869
29.113	115.628
29.887	109.080
31.130	106.285
32.067	118.475
33.229	109.122
34.246	125.060
35.170	104.462
36.177	95.107
37.099	67.952
38.340	60.474
39.121	70.788
42.232	77.384
44.403	62.423
45.409	51.194
46.886	53.086
48.207	52.166
49.917	52.187
51.315	50.331
52.404	53.155
53.177	41.924
55.045	49.441
56.131	41.961
58.386	44.799
60.091	34.516
62.271	42.974
63.050	48.604
64.218	53.303
64.836	44.880
65.845	40.208
66.778	41.157
67.477	41.166
68.097	36.489
69.265	41.188
70.198	41.200
70.818	37.460];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/1e4; % convert mum in a yr to cm in a yr
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell height increment in a yr'};  
temp.tL    = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BrocReyn2012';
comment.tL = 'Data from eastern Isle of Man';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3GFF7'; % Cat of Life
metaData.links.id_ITIS = '79429'; % ITIS
metaData.links.id_EoL = '46466107'; % Ency of Life
metaData.links.id_Wiki = 'Glycymeris_glycymeris'; % Wikipedia
metaData.links.id_ADW = 'Glycymeris_glycymeris'; % ADW
metaData.links.id_Taxo = '39147'; % Taxonomicon, server down
metaData.links.id_WoRMS = '140025'; % WoRMS
metaData.links.id_molluscabase = '140025'; % MolluscaBase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrocReyn2012'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.palaeo.2012.03.030}, ' ...
'author = {W.M. Brocas and D.J. Reynolds and P.G. Butler and C.A. Richardson and J.D. Scourse and I.D. Ridgway and K. Ramsay}, ' ... 
'year = {2012}, ' ...
'title = {The dog cockle, \emph{Glycymeris glycymeris} ({L}.), a new annually-resolved sclerochronological archive for the {I}rish {S}ea}, ' ...
'journal = {Palaeogeography, Palaeoclimatology, Palaeoecology}, ' ...
'volume = {373}, ' ...
'pages = {133-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaviPouv2004'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.aquaculture.2004.05.029}, ' ...
'author = {Marie Savina and St\''{e}phane Pouvreau}, ' ... 
'year = {2004}, ' ...
'title = {A comparative ecophysiological study of two infaunal filter-feeding bivalves: \emph{Paphia rhombo\"{i}des} and \emph{Glycymeris glycymeris}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {239(1-4)}, ' ...
'pages = {289-306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Glycymeris-glycymeris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

