function [data, auxData, metaData, txtData, weights] = mydata_Aphrastura_spinicauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Furnariidae';
metaData.species    = 'Aphrastura_spinicauda'; 
metaData.species_en = 'Thorn-tailed rayadito'; 

metaData.ecoCode.climate = {'Csb', 'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 27];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MoreMeri2005';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 21.8;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MoreMeri2005';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-23 d';
data.tp = 65.4;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '16-23 d';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'MoreMeri2005';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.1;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MoreMeri2005';
data.Wwi = 11;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'MoreMeri2005';

data.Ri  = 1.5*4.1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoreMeri2005';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 6 eggs per clutch, sometimes 2 clutches per year';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.930	3.510
1.930	3.731
1.930	4.553
1.961	2.909
1.961	3.067
1.961	3.289
1.961	3.984
1.961	4.237
1.961	4.332
1.992	2.561
3.983	5.217
3.983	5.439
3.983	5.597
3.983	5.692
3.983	5.818
3.983	5.945
3.983	6.134
3.983	6.261
3.983	6.451
3.983	6.957
4.014	4.522
4.014	4.870
4.014	5.091
4.045	4.174
5.944	7.304
5.944	7.462
5.944	7.652
5.944	7.779
5.944	7.968
5.944	8.190
5.944	8.348
5.944	8.854
5.944	9.043
5.944	9.233
5.975	6.893
7.997	10.498
7.997	10.719
7.997	10.783
7.997	11.668
7.997	11.794
7.997	12.237
8.028	8.822
8.028	8.980
8.028	9.202
8.028	9.360
8.028	9.486
8.028	9.676
8.028	9.866
8.028	10.087
8.028	10.941
8.028	11.036
8.028	11.257
8.028	11.383
8.028	11.510
9.928	14.229
9.958	11.004
9.958	11.257
9.958	11.447
9.958	11.542
9.958	11.826
9.958	11.984
9.958	12.174
9.958	12.332
9.958	12.522
9.958	12.711
9.958	12.901
9.958	13.059
9.958	13.217
9.958	13.534
12.900	15.273
12.930	11.573
12.930	11.889
12.930	12.047
12.930	12.206
12.930	12.553
12.930	12.870
12.930	13.249
12.930	13.407
12.930	13.534
12.930	13.787
12.930	13.913
12.930	14.040
12.930	14.166
12.961	14.545
13.972	13.154
13.972	13.312
13.972	13.470
14.003	10.783
14.003	11.257
14.003	12.522
14.003	12.901
14.033	11.605
14.033	11.826
14.033	11.984
14.033	12.142
14.033	12.300
20.928	14.609
20.958	11.257
20.958	11.826
20.958	12.016
20.958	12.174
20.958	12.364
20.958	12.617
20.958	13.059
20.958	13.281
20.958	13.407
20.958	13.565
20.958	14.040
20.958	14.166
20.958	14.324];
n = size(data.tW,1); for i =2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-4;end;end 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MoreMeri2005';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

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
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5VN2B'; % Cat of Life
metaData.links.id_ITIS = '558708'; % ITIS
metaData.links.id_EoL = '917985'; % Ency of Life
metaData.links.id_Wiki = 'Aphrastura_spinicauda'; % Wikipedia
metaData.links.id_ADW = 'Aphrastura_spinicauda'; % ADW
metaData.links.id_Taxo = '74811'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '42F16BDC71348982'; % avibase
metaData.links.id_birdlife = 'thorn-tailed-rayadito-aphrastura-spinicauda'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphrastura_spinicauda}}';
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
bibkey = 'MoreMeri2005'; type = 'Article'; bib = [ ... 
'author = {J. Moreno and S. Merino and R. A. Vasquez and J. J. Armesto}, ' ... 
'year = {2005}, ' ...
'title = {BREEDING BIOLOGY OF THE THORN-TAILED RAYADITO ({F}URNARIIDAE) IN SOUTH-TEMPERATE RAINFORESTS OF {C}HILE}, ' ...
'journal = {The Condor}, ' ...
'volume = {107}, ' ...
'number = {1}, '...
'pages = {69--77}'];
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

