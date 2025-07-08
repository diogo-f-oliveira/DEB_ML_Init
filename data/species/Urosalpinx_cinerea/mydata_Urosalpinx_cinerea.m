function [data, auxData, metaData, txtData, weights] = mydata_Urosalpinx_cinera

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Muricidae';
metaData.species    = 'Urosalpinx_cinerea'; 
metaData.species_en = 'Atlantic oyster drill';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 27]; 

%% set data
% zero-variate data

data.ab = 7*7;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'issg';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Fran1971: yearly temp cycle between -1 and 25 C; issg: 6-8 weeks; egss are laid if temp exceeds 20 C for more than 1 week';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'issg';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'issg';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 3.3;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Fran1971';

data.Wwb = 7e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ADW';
  comment.Wwb = 'Based on egg diameter of 240 mum: 4/3 * pi * (0.012)^3';
data.Wwi = 3.7;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Fran1971';

data.Ri  = 40*12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'issg';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Females attach 20-40 translucent, vase-shaped egg capsules to a suitable substrate. Each egg capsule contains 5-12 eggs';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.218	0.324
0.529	0.718
0.701	1.226
1.693	2.415
2.671	2.730
3.630	2.949];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fran1971';

data.LW = [ ...
1.115	0.088
1.124	0.092
1.141	0.099
1.148	0.082
1.159	0.103
1.160	0.111
1.174	0.078
1.175	0.089
1.184	0.091
1.187	0.122
1.219	0.082
1.259	0.111
1.288	0.120
1.328	0.130
1.329	0.141
1.335	0.102
1.337	0.121
1.392	0.172
1.401	0.152
1.403	0.191
1.413	0.180
1.423	0.165
1.467	0.186
1.487	0.158
1.504	0.246
1.511	0.177
1.514	0.220
1.549	0.246
1.560	0.230
1.582	0.200
1.587	0.298
1.596	0.240
1.632	0.233
1.693	0.218
1.777	0.362
1.780	0.432
1.809	0.520
1.819	0.413
1.822	0.480
1.834	0.429
1.846	0.392
1.889	0.416
1.892	0.532
1.979	0.544
1.995	0.568
1.997	0.660
2.026	0.612
2.028	0.700
2.055	0.548
2.060	0.737
2.089	0.674
2.103	0.621
2.105	0.694
2.183	0.635
2.203	0.748
2.237	0.788
2.252	0.715
2.324	0.907
2.394	0.867
2.395	0.913
2.396	0.962
2.440	1.448
2.441	1.537
2.451	1.013
2.452	1.091
2.457	1.374
2.484	0.854
2.496	1.502
2.505	0.947
2.518	1.783
2.544	0.990
2.548	1.247
2.582	1.013
2.588	1.314
2.665	1.256
2.668	1.457
2.692	1.703
2.717	2.145
2.723	1.157
2.726	1.323
2.731	1.629
2.739	2.380
2.765	1.210
2.768	1.393
2.794	1.703
2.796	1.904
2.800	2.276
2.816	1.821
2.827	1.165
2.867	2.582
2.899	1.665
2.918	1.467
2.924	1.875
2.925	1.946
2.930	2.469
2.948	2.080
2.958	3.155
2.973	2.308
3.026	3.323
3.070	3.061
3.110	2.413
3.117	3.273
3.287	3.657];
units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
bibkey.LW = 'Fran1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females longer and taller than their males';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DYQT'; % Cat of Life
metaData.links.id_ITIS = '73264'; % ITIS
metaData.links.id_EoL = '503335'; % Ency of Life
metaData.links.id_Wiki = 'Urosalpinx_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Urosalpinx_cinerea'; % ADW
metaData.links.id_Taxo = '36285'; % Taxonomicon
metaData.links.id_WoRMS = '140429'; % WoRMS
metaData.links.id_molluscabase = '140429'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urosalpinx_cinerea}}';
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
bibkey = 'Fran1971'; type = 'Article'; bib = [ ... 
'author = {Franz, D. R.}, ' ... 
'year = {1971}, ' ...
'title = {Population age structure, growth and longevity of the marine gastropod \emph{Urosalpinx cinerea} {S}ay}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {140}, ' ...
'pages = {63--72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'issg'; type = 'Misc'; bib = ...
'howpublished = {\url{http://issg.org/database/species/ecology.asp?si=1383&fr=1&sts=& ang=TC&ver=print&prtflag=false}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Urosalpinx_cinerea/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

