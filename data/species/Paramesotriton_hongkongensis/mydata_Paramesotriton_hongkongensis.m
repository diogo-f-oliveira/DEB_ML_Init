function [data, auxData, metaData, txtData, weights] = mydata_Paramesotriton_hongkongensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Paramesotriton_hongkongensis'; 
metaData.species_en = 'Hong Kong warty newt'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', 'jiFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 30];

%% set data
% zero-variate data

data.ab = 25;       units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Tat1976';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3 * 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Tat1976';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 10.3 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for P. chinensis';
  
data.Lp  = 5.3;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Tat1976';
data.Li  = 7.02;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'WingKarr2013';
data.Lim = 6.69;   units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'WingKarr2013';

data.Wwb = 1.28e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
   comment.Wwb = 'based on egg diameter of 2.9 mm: pi/6*0.29^3';
data.Wwi = 10.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'WingKarr2013';
   comment.Wwi = 'based on F1, using F1: 10^(-0.99 + 2.39 * log10(Li)';
data.Wwim = 9.6;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'WingKarr2013';
   comment.Wwim = 'based on F1, using F1: 10^(-0.99 + 2.39 * log10(Lim)';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on Lissotriton_vulgaris' ;

% univariate data
% time - length for embryo
data.tLe = [ ... age (d), total length (cm)
5.576	0.304
6.024	0.332
6.422	0.344
6.571	0.347
6.820	0.369
7.964	0.407
9.016	0.572
10.012	0.625
10.956	0.655
11.957	0.782
12.953	0.850
15.092	0.926
15.988	0.979
16.980	0.984
18.026	1.045
19.120	1.088
20.961	1.168
23.147	1.212
25.137	1.313]; % hatch
%27.226	1.393
%28.119	1.399
%31.201	1.488
%34.182	1.555
%36.270	1.636];
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'total length'};  
temp.tLe   = C2K(20);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Tat1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 50 * weights.tLe;
weights.Lp =  0 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 *  weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: log10[body weight in g] = -0.99 + 2.39 * log10[SVL in cm]),';
metaData.bibkey.F1 = 'WingKarr2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D374'; % Cat of Life
metaData.links.id_ITIS = '1106252'; % ITIS
metaData.links.id_EoL = '4357897'; % Ency of Life
metaData.links.id_Wiki = 'Paramesotriton_hongkongensis'; % Wikipedia
metaData.links.id_ADW = 'Paramesotriton_hongkongensis'; % ADW
metaData.links.id_Taxo = '151417'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Paramesotriton+hongkongensis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Paramesotriton_hongkongensis}}';
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
bibkey = 'WingKarr2013'; type = 'article'; bib = [ ...
'author = {Vivian Wing Kan Fu and Nancy E. Karraker and David Dudgeon}, ' ... 
'year = {2013}, ' ...
'title = {BREEDING DYNAMICS, DIET, AND BODY CONDITION OF THE {H}ONG {K}ONG NEWT (\emph{Paramesotriton hongkongensis})}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {27}, ' ...
'pages = {1-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tat1976'; type = 'PhDthesis'; bib = [ ...
'author = {Teng Tat-ming}, ' ... 
'year = {1976}, ' ...
'title = {The deleopmental stage of \emph{Paramesotriton hongkongensis} ({M}yers and {L}eviton) and its application in the study of embryology}, ' ...
'school = {The Chinese University of Hong Kong}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Paramesotriton_chinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

