function [data, auxData, metaData, txtData, weights] = mydata_Afrotis_afra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Otidiformes'; 
metaData.family     = 'Otididae';
metaData.species    = 'Afrotis_afra'; 
metaData.species_en = 'Southern black korhaan';

metaData.ecoCode.climate = {'BWk','BSk','Csa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.25); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 21;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Greg1986';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 33.75;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.25);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 101.25;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 4.5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.25);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                  bibkey.am = 'Wiki';   
  temp.am = C2K(40.25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 43;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'Greg1986';
  comment.Ww0 = '52–64 g';
data.Wwb = 33;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW and Ww0 data';
data.Wwi = 700;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'KirwColl2020';
data.Wwim = 700;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'KirwColl2020';
  comment.Wwim = 'Wiki: males are slightly heavier';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
 3.000	 52.478
 9.775	 97.668
14.159	110.787
20.137	134.111
25.716	132.653
28.904	144.315
32.225	155.977
35.679	167.638
37.937	182.216
40.196	198.251
42.454	212.828
47.369	212.828
50.424	227.405
53.480	250.729
55.207	274.052
57.731	301.749
59.325	314.869
62.513	320.700
64.904	336.735
66.897	368.805
68.889	402.332
71.945	430.029
75.266	448.980];
data.tW(:,1) = data.tW(:,1) - 1; % set origin at hatch
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Greg1986';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Ww0 data ignored due to inconsistency with Wwb data';
D3 = 'The high age at first reproduction cannot be captured by the std model';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '65HNS'; % Cat of Life
metaData.links.id_ITIS = '707801'; % ITIS
metaData.links.id_EoL = '45513880'; % Ency of Life
metaData.links.id_Wiki = 'Afrotis_afra'; % Wikipedia
metaData.links.id_ADW = 'Afrotis_afra'; % ADW
metaData.links.id_Taxo = '53446'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C84BD6490569D248'; % avibase
metaData.links.id_birdlife = 'northern-black-bustard-afrotis-afraoides'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Afrotis_afra}}';
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
bibkey = 'Greg1986'; type = 'article'; bib = [ ...
'title = {BREEDING THE LITTLE BLACK BUSTARD \emph{Eupodotis afra}}, ' ...
'author = {Jo Gregson}, ' ... 
'journal = {The Avicultural Magazine}, ' ...
'year = {1986}, ' ...
'volume = {92(2)}, ' ...
'howpublished = {\url{http://www.avisoc.co.uk/table-of-contents/breeding-the-little-black-bustard-eupodotis-afra/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C84BD6490569D248&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KirwColl2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.blabus3.02}, ' ...
'author = {Kirwan, G. M. and N. Collar and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {Black Bustard (\emph{Eupodotis afra}), version 2.0. In Birds of the World (S. M. Billerman and B. K. Keeney, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

