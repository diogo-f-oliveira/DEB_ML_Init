function [data, auxData, metaData, txtData, weights] = mydata_Sepiola_atlantica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiolida'; 
metaData.family     = 'Sepiolidae';
metaData.species    = 'Sepiola_atlantica'; 
metaData.species_en = 'Atlantic bobtail squid'; 
metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};
metaData.T_typical  = C2K(17.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 


%% set data
% zero-variate data

data.ab = 45;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'JoneRick2010';   
  temp.ab = C2K(17.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 190;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoneRick2010';
  temp.tp = C2K(17.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 270;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'JoneRick2010';   
  temp.am = C2K(17.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm';  label.Lb  = 'dorsal mantle length at birth';   bibkey.Lb  = 'JoneRick2010';
data.Lp  = 1.7;  units.Lp  = 'cm';  label.Lp  = 'dorsal mantle length at puberty'; bibkey.Lp  = 'JoneRick2010';
  comment.Lp = 'length at mating, guessed that this coincides with puberty';
data.Li  = 2.1;  units.Li  = 'cm';  label.Li  = 'dorsal mantle length at death';   bibkey.Li  = 'JoneRick2010';

data.Ni  = 161;  units.Ni  = '#';   label.Ni  = 'cum reprod at death';             bibkey.Ni  = 'JoneRick2010';   
  temp.Ni = C2K(17.7);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), dorsal mantle length (cm)
0.742	0.182
10.386	0.228
20.401	0.228
30.415	0.325
40.059	0.456
50.074	0.411
60.089	0.451
70.475	0.571
80.490	0.508
90.504	0.605
100.148	0.651
110.163	0.697
120.178	0.822
130.193	0.897
139.837	1.079
150.593	1.222
160.237	1.319
169.881	1.404
180.267	1.558
190.282	1.701
200.297	1.889
210.312	1.940
220.326	1.866
229.970	1.998
240.727	1.969
250.371	2.032
260.015	1.958
270.030	1.953
280.786	2.147];
units.tL   = {'d', 'g'};  label.tL = {'time since birth', 'dorsal mantle length'};  
temp.tL    = C2K(17.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoneRick2010';
  

data.LW = [ ... % dorsal mantle length (cm), wet weight (g)
0.420	0.054
0.446	0.068
0.507	0.074
0.560	0.124
0.565	0.117
0.599	0.138
0.616	0.116
0.628	0.145
0.643	0.145
0.645	0.208
0.655	0.272
0.679	0.102
0.701	0.208
0.769	0.264
0.801	0.420
0.839	0.278
0.844	0.314
0.859	0.356
0.903	0.384
0.894	0.668
0.963	0.384
0.971	0.476
0.988	0.419
1.017	0.533
1.012	0.589
1.013	0.667
1.051	0.539
1.051	0.646
1.063	0.646
1.085	0.639
1.054	0.809
1.047	0.852
1.100	0.745
1.107	0.546
1.139	0.652
1.136	0.773
1.168	0.766
1.139	0.858
1.098	1.079
1.188	0.915
1.217	1.000
1.198	1.078
1.184	1.284
1.261	0.978
1.280	1.113
1.251	1.156
1.264	1.255
1.264	1.475
1.323	1.539
1.341	1.120
1.400	1.332
1.385	1.510
1.400	1.602
1.431	1.353
1.477	1.339
1.469	1.126
1.527	1.069
1.559	1.260
1.613	1.466
1.616	1.523
1.538	1.544
1.560	1.651
1.505	1.644
1.500	1.736
1.527	1.786
1.561	1.857
1.544	1.900
1.503	1.942
1.493	1.978
1.573	2.048
1.631	1.714
1.639	1.984
1.706	1.742
1.571	2.162
1.562	2.205
1.574	2.233
1.695	2.083
1.733	2.012
1.562	2.404
1.531	2.560
1.599	2.673
1.661	2.346
1.727	2.374
1.773	2.352
1.787	2.281
1.930	2.216
1.892	2.416
1.870	2.515
1.866	2.572
1.812	2.558
1.708	2.694
1.745	2.743
1.621	2.780
1.624	2.922
1.617	3.113
1.697	2.957
1.705	3.298
1.717	3.326
1.801	3.119
1.808	2.871
1.818	2.871
1.896	2.984
1.937	3.204
2.015	3.210
2.018	3.281
1.962	3.431
1.781	3.503
1.904	3.594
1.912	3.886
1.913	3.942
1.945	3.516
1.958	3.587
2.018	3.558
2.038	3.693
2.064	3.409
2.113	3.636
2.103	3.678
2.153	3.934
2.068	4.034];
units.LW   = {'cm', 'g'};  label.LW = {'dorsal mantle length', 'wet weight'};  
bibkey.LW = 'YauBoyl1996';

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

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'YauBoyl1996'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WQSQ'; % Cat of Life
metaData.links.id_ITIS = '82357'; % ITIS
metaData.links.id_EoL = '448833'; % Ency of Life
metaData.links.id_Wiki = 'Sepiola_atlantica'; % Wikipedia
metaData.links.id_ADW = 'Sepiola_atlantica'; % ADW
metaData.links.id_Taxo = '40221'; % Taxonomicon
metaData.links.id_WoRMS = '141454'; % WoRMS
metaData.links.id_molluscabase = '141454'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepiola_atlantica}}';
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
bibkey = 'JoneRick2010'; type = 'Article'; bib = [ ... 
'author = {Jones, N. J. E. and Richardson, C. A.}, ' ... 
'year = {2010}, ' ...
'title = {Laboratory Culture, Growth, and the Life Cycle of the Little Cuttlefish \emph{Sepiola atlantica} ({C}ephalopoda: {S}epiolidae)}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {29}, ' ...
'pages = {241--246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YauBoyl1996'; type = 'Article'; bib = [ ... 
'author = {Yau, C. and Boyle, P. R.}, ' ... 
'year = {1996}, ' ...
'title = {Ecology of \emph{Sepiola atlantica} ({M}ollusca: {C}ephalopoda) in the shallow sublittoral zone}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {76}, ' ...
'pages = {733--748}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

