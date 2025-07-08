function [data, auxData, metaData, txtData, weights] = mydata_Ammodramus_savannarum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Emberizidae';
metaData.species    = 'Ammodramus_savannarum'; 
metaData.species_en = 'Grasshopper sparrow'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Dfa','Dfb' };
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg','0iTa'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxCii','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp 
metaData.data_0     = {'ah', 'ap', 'aR', 'am', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Marie Trijau'};    
metaData.date_subm = [2020 05 20];              
metaData.email    = {'marie.trijau@ibacon.com'};            
metaData.address  = {'ibacon GmbH'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 12;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Smit1968';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '11 to 13 days of incubation time for the egg';  
data.tx = 8.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Walk1940';
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 25.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Vick1996';   
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'Vick1996';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max. longevity in the wild';

data.Wwb = 2;   units.Wwb = 'g';   label.Wwb = 'wet weight at hatching';    bibkey.Wwb = 'Walk1940';
  comment.Wwb = '1.7 to 2.3 g'; 
data.Wwi = 20.42;    units.Wwi = 'g';   label.Wwi = 'wet weight at ultimate state';    bibkey.Wwi = 'Dela1994';
  comment.Wwi = 'maximum weight of A. s. floridanus females';

data.Ri  = (6*2)/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'McNa1986';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max 6 eggs per clutch, 2 clutch per year assumed';
 
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
0   2
2   2.9
6   8.9
7   9.7
8   10.5];  
units.tWw   = {'d', 'g'};  label.tWw = {'time since hatching', 'wet weight'};  
temp.tWw    = C2K(41.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Walk1940';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWw = weights.tWw * 2;

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
D1 = 'Time between clutches at T is 1 year, similarly to the other members of the Emberizidae family present in the database; this value is used as parameter t_N (not estimated)';
D2 = 'mod_1: v is reduced, food availability is taken variable in tW data';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts 
F1 = {'Distribution and habitat: breeding habitat is open fields and prairie across southern Canada, the United States, Mexico and Central America, with a small endangered population in the Andes of Colombia and (perhaps only formerly) Ecuador. The northern populations migrate to the southern United States, Mexico, Central America and the Caribbean'};
metaData.bibkey.F1 = 'Wikipedia'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CTL9'; % Cat of Life
metaData.links.id_ITIS = '179333'; % ITIS
metaData.links.id_EoL = '45511206'; % Ency of Life
metaData.links.id_Wiki = 'Ammodramus_savannarum'; % Wikipedia
metaData.links.id_ADW = 'Ammodramus_savannarum'; % ADW
metaData.links.id_Taxo = '85902'; % Taxonomicon
metaData.links.id_WoRMS = '422666'; % WoRMS
metaData.links.id_avibase = '5BFFE091FBA75EA2'; % avibase
metaData.links.id_birdlife = 'grasshopper-sparrow-ammodramus-savannarum'; % birdlife
metaData.links.id_AnAge = 'Ammodramus_savannarum'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'Wikipedia'; type = 'misc'; bib = [ ... 
'author = {Wikipedia}, ' ... 
'year = {2019}, ' ...
'title = {Wikipedia article on Grasshopper Sparrow}, ' ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Grasshopper_sparrow}}, ' ...
'note = {Last accessed: 2020-05-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'Smit1968'; type = 'Article'; bib = [ ... 
'author = {Smith, R. L.}, ' ... 
'year = {1968}, ' ...
'title = {Life histories of {N}orth {A}merican cardinals, grosbeaks, buntings, towhees, finches, sparrows, and allies}, ' ...
'journal = {Bulletin of the United States National Museum, Washington, USA}, ' ...
'volume = {237}, ' ...
'number = {2}, '...
'pages = {725--745}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'Walk1940'; type = 'Article'; bib = [ ...
'author = {Walkinshaw, L. H.}, ' ... 
'year = {1940}, ' ...
'title = {Some {M}ichigan notes on the grasshopper sparrow}, ' ...
'journal = {Jack-pine Warbler}, ' ...
'volume = {18}, ' ...
'pages = {50--59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'Vick1996'; type = 'misc'; bib = [ ... 
'author = {Vickery, P. D.}, ' ... 
'year = {1996}, ' ...
'title = {Grasshopper Sparrow (\textit{Ammodramus savannarum}), version 2.0.}, ' ...
'institution = {Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'Dela1994'; type = 'Article'; bib = [ ... 
'author = {Delany, M. F., Moore C. T. and Jr. Progulske, D. R. }, ' ... 
'year = {1994}, ' ...
'title = {Distinguishing gender of {F}lorida Grasshopper Sparrows using body measurements}, ' ...
'journal = {Florida Field Naturalist}, ' ...
'volume = {51}, ' ...
'pages = {22-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
%
bibkey = 'McNa1986'; type = 'Article'; bib = [ ...
'author = {McNair, D. B.}, ' ... 
'year = {1986}, ' ...
'title = { Clutch information for the {F}lorida Grasshopper Sparrow from oological collections}, ' ...
'journal = {Florida Field Naturalist}, ' ...
'volume = {49}, ' ...
'pages = {14-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib,'}'';'];
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

