function [data, auxData, metaData, txtData, weights] = mydata_Pithecia_pithecia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Pitheciidae';
metaData.species    = 'Pithecia_monachus'; 
metaData.species_en = 'Monk saki'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii', 'xiCvm', 'xiCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 31];

%% set data
% zero-variate data

data.tg = 170;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'EoL';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for P. pitheca';
data.tp = 775;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for P. pitheca';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 120.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnAge';
  comment.Wwb = 'P. monachus';
data.Wwi = 1780;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (wk), wet weight (g)
 0 121
 1 166
 2 179
 3 189
 4 192
 5 221
 6 238
 7 244
 8 251
10 290
12 338
14 402
16 400
17 384
18 385
20 454
22 511
24 568];
data.tW(:,1) = 7 * data.tW(:,1); % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Clev1981';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, k has been targeted to 0.3 and pseudodata for k_J removed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6VLPB'; % Cat of Life
metaData.links.id_ITIS = '572990'; % ITIS
metaData.links.id_EoL = '1010832'; % Ency of Life
metaData.links.id_Wiki = 'Pithecia_monachus'; % Wikipedia
metaData.links.id_ADW = 'Pithecia_monachus'; % ADW
metaData.links.id_Taxo = '65835'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100366'; % MSW3
metaData.links.id_AnAge = 'Pithecia_monachus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pithecia_pithecia}}';
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
bibkey = 'Clev1981'; type = 'Article'; bib = [ ... 
'author = {Clevenger, M. A.}, ' ... 
'doi = {10.1111/j.1748-1090.1981.tb01989.x}, ' ...
'year = {1981}, ' ...
'title = {Hand-rearing a Silver-backed saki at {O}klahoma {C}ity {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {21}, ' ...
'pages = {221-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pithecia_monachus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1010832/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

