function [data, auxData, metaData, txtData, weights] = mydata_Ciconia_abdimii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Ciconia_abdimii'; 
metaData.species_en = 'Abdim''s stork'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cwb', 'Cwc'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'DuigNutt1998';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DuigNutt1998';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 273;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.6*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 61;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'DuigNutt1998';
data.Wwi = 1398; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'DuigNutt1998';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - weight
data.tW = [ ... % age (d) weight (0.1 g)
0       610 
1.817	609.330
8.100	724.156
15.189	1156.996
23.083	2039.863
30.566	3370.971
38.041	5335.732
44.914	6824.361
53.389	9873.096
61.281	10914.375
68.571	11505.927
83.361	12055.674
91.469	12067.567];
data.tW(:,2) = 0.1 * data.tW(:,2); % convert 0.1 g to g (error in paper)
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DuigNutt1998';
comment.tW = 'mean values';

% time - metabolisable energy intake
data.tpX = [ ... % time since birth (d), energy intake (kJ/d)
0       38 % guessed 
2.080	41.594
5.380	80.872
7.214	107.833
10.032	186.020
13.096	269.102
16.286	378.977
18.145	552.028
19.990	644.729
21.351	754.427
24.919	937.383
28.214	947.443
32.143	1103.652
34.217	1103.854
40.192	1104.436
46.063	1202.399
47.128	1015.025
49.095	1105.303];
units.tpX   = {'d', 'kJ/d'};  label.tpX = {'time since birth', 'energy intake'};  
temp.tpX    = C2K(40.5);  units.temp.tpX = 'K'; label.temp.tpX = 'temperature';
bibkey.tpX = 'DuigNutt1998';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5YTT3'; % Cat of Life
metaData.links.id_ITIS = '174906'; % ITIS
metaData.links.id_EoL = '45515774'; % Ency of Life
metaData.links.id_Wiki = 'Ciconia_abdimii'; % Wikipedia
metaData.links.id_ADW = 'Ciconia_abdimii'; % ADW
metaData.links.id_Taxo = '167708'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '26CD03193C89F18B'; % avibase
metaData.links.id_birdlife = 'abdims-stork-ciconia-abdimii'; % birdlife
metaData.links.id_AnAge = 'Ciconia_abdimii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ciconia_abdimii}}';
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
bibkey = 'DuigNutt1998'; type = 'Article'; bib = [ ... 
'author = {P. J. Duignan and C. Nuttall and J. K. Kirkwood and P. J. S. Olney}, ' ... 
'year = {1998}, ' ...
'title = {Husbandry, breeding and post-embryonic growth of Abdim''s storks \emph{Ciconia abdimii} hand-reared at {London Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {27}, ' ...
'pages = {245--252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049143/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ciconia_abdimii}}';
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

