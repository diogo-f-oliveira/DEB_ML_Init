function [data, auxData, metaData, txtData, weights] = mydata_Somateria_mollissima

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Somateria_mollissima'; 
metaData.species_en = 'Common eider'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'xiMc'};
metaData.ecoCode.embryo  = {'Tncf','Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2016 12 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(34); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 70;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'HawkButl1998';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 37.8*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.Wwb = 72;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GoudRobe2020';
data.Wwi = 1920;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight female';  bibkey.Wwi = 'Wiki';
data.Wwim = 2210;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight male';   bibkey.Wwim = 'Wiki';
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr';
  
% uni-variate data
% time-weight 
data.tW = [ ... % time since birth (d), wet weight (g)
0.112	73.217
6.841	174.174
14.096	371.709
21.077	549.234
27.917	726.735
34.977	1060.651
41.962	1228.195
48.961	1359.143
56.123	1433.557
62.975	1581.115
69.727	1622.188
77.049	1650.048
84.114	1611.321
97.909	1673.552];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'HawkButl1998';
comment.tW = 'Data for female ducklings';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 3;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6Z4ZB'; % Cat of Life
metaData.links.id_ITIS = '175155'; % ITIS
metaData.links.id_EoL = '45510587'; % Ency of Life
metaData.links.id_Wiki = 'Somateria_mollissima'; % Wikipedia
metaData.links.id_ADW = 'Somateria_mollissima'; % ADW
metaData.links.id_Taxo = '52255'; % Taxonomicon
metaData.links.id_WoRMS = '137074'; % WoRMS
metaData.links.id_avibase = 'B77377EEB852D0AF'; % avibase
metaData.links.id_birdlife = 'common-eider-somateria-mollissima'; % birdlife
metaData.links.id_AnAge = 'Somateria_mollissima'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Somateria_mollissima}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Somateria_mollissima}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HawkButl1998'; type = 'Article'; bib = [ ...  
'title = {GROWTH AND MORPHOLOGY OF CAPTIVE FEMALE COMMON EIDER \emph{Somateria mollissima} DUCKLINGS}, ' ...
'journal = {Wildfowl}, ' ...
'year = {1998}, ' ...
'author = {P A J Hawkins and P J Butler and A J Woakes}, ' ...
'volume = {49}, ' ...
'pages = {92--102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoudRobe2020'; type = 'Misc'; bib = [...
'doi = {10.2173/bow.comeid.01}, ' ...
'year = {2020}, ' ...
'author = {Goudie, R. I. and G. J. Robertson and A. Reed}, ' ...
'title = {Common Eider (Somateria mollissima), version 1.0.}, ' ...
'howpublished = {In Birds of the World (S. M. Billerman, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

