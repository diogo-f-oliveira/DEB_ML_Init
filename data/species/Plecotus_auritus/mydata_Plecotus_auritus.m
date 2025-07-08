function [data, auxData, metaData, txtData, weights] = mydata_Plecotus_auritus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Plecotus_auritus'; 
metaData.species_en = 'Brown long-eared bat';

metaData.ecoCode.climate = {'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 10 27];              

%% set data
% zero-variate data
data.tg = 65;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'age at puberty';               bibkey.tp = 'AnAge';
  temp.tp = C2K(34);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'FaniJone1995';
data.Wwi = 7.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'FaniJone1995';

data.Ri  = 1.33/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 1.33 pups per litters'; 

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.017	1.748
1.003	2.069
1.994	2.588
2.979	2.863
4.000	3.229
5.055	3.595
6.041	3.916
7.027	4.237
8.009	4.405
8.991	4.511
9.980	4.954
10.960	5.015
11.980	5.351
12.829	5.595
13.879	5.733
14.861	5.855
15.872	5.779
16.853	5.885
17.863	5.763
18.908	5.687
19.953	5.641
20.965	5.626
21.972	5.382
22.953	5.473
23.899	5.489];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'FaniJone1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.tp = 1 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'diapause (at start of gestation)';
weights.psd.t_0 = 5;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'High value for tp cannot be captured by the stx model with constant temperature; winter torpor probably contributes to tp';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4K2Z9'; % Cat of Life
metaData.links.id_ITIS = '632133'; % ITIS
metaData.links.id_EoL = '289433'; % Ency of Life
metaData.links.id_Wiki = 'Plecotus_auritus'; % Wikipedia
metaData.links.id_ADW = 'Plecotus_auritus'; % ADW
metaData.links.id_Taxo = '169514'; % Taxonomicon
metaData.links.id_WoRMS = '1037285'; % WoRMS
metaData.links.id_MSW3 = '13802155'; % MSW3
metaData.links.id_AnAge = 'Plecotus_auritus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Brown_long-eared_bat}}'];
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
bibkey = 'FaniJone1995'; type = 'Article'; bib = [ ... 
'author = {E. de Fanis and G. Jones}, ' ...
'title = {Post-natal growth, mother-infant interactions and development of vocalizations in the vespertilionid bat \emph{Plecotus auritus}}, ' ...
'journal = {J. Zool., Lond.}, ', ...
'year = {1995}, ' ...
'volume = {235}, ', ...
'number = {1}, ', ...
'pages = {85--97}, ', ...
'doi = {10.1111/j.1469-7998.1995.tb05130.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = [...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Plecotus_auritus}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

