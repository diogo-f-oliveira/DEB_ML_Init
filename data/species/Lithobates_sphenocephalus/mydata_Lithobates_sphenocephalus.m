function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_sphenocephalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_sphenocephalus'; 
metaData.species_en = 'Southern leopard frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 05 26];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 05 26]; 


%% set data
% zero-variate data

data.ab = 4.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 63;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '50 to 75 d';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'HughMesh2017';
data.Lpm  = 4.22;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'HughMesh2017';
data.Li  = 8.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'HughMesh2017';
  comment.Li = 'Wiki give 13 cm';
data.Lim  = 6.95;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'HughMesh2017';

data.Wwb = 0.0024;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based egg diameter of 1.65 mm: pi/6*0.165^3; HughMesh2017 give mean diameter of 1.44 mm ';
data.Wwi = 148.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-correct value for Rana_muscosa: (8.5/6.8)^3*76';
data.Wwim = 81.1;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on size-correct value for Rana_muscosa: (6.95/6.8)^3*76';
  
% univariate data
% time-length data for larva
data.tL = [ ... % time s (d), SVL (cm)
0.000	0.322
3.264	0.379
7.180	0.471
10.052	0.493
13.838	0.505
16.971	0.608
21.018	0.700
24.021	0.745
27.937	0.779
30.940	0.871
34.726	0.882
37.859	0.974
44.648	0.950
48.825	1.168
58.486	1.294
62.533	1.374
69.582	1.500
76.501	1.637
83.290	1.602
86.162	1.636
90.209	1.751
96.867	2.073];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ErdmGodw2018';

% length-fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
4.690	609.546
5.978	1951.487
6.290	1146.322
6.554	1858.372
6.618	2455.399
6.854	2904.538
6.959	806.729
7.536	3255.086
7.715	1354.460
8.051	3200.313
8.250	3605.634];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HughMesh2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VHQX'; % Cat of Life
metaData.links.id_ITIS = '775116'; % ITIS
metaData.links.id_EoL = '47365236'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_sphenocephalus'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_sphenocephalus'; % ADW
metaData.links.id_Taxo = '996583'; % Taxonomicon
metaData.links.id_WoRMS = '1515914'; % WoRMS
metaData.links.id_amphweb = 'Rana_sphenocephalus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_sphenocephalus}}';
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
bibkey = 'ErdmGodw2018'; type = 'Article'; bib = [ ... 
'author = {James A. Erdmann and Cody D. Godwin and Martha R. Villalba-Guerra and D. Cooper Campbel and Jordan Donini and C. Elyse Parker and Ariana E. E. Rupp and Courtney A. Weyand and Melanie A.J. Partin and Timothy Borgardt and Christopher K. Beachy}, ' ... 
'year = {2018}, ' ...
'title = {Larval Life History of \emph{Lithobates sphenocephalus} (Southern Leopard Frog) in {S}outheast {L}ouisiana}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {17(2)}, ' ...
'pages = {221-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HughMesh2017'; type = 'Article'; bib = [ ... 
'doi = {10.11160/bah.53}, ' ...
'author = {Daniel F. Hughes and Walter E. Meshaka, Jr. and Pablo R. Delis}, ' ... 
'year = {2017}, ' ...
'title = {Reproduction and growth of the Southern Leopard Frog, \emph{Lithobates sphenocephalus} ({C}ope, 1886), in {V}irginia: implications for seasonal shifts in response to global climate change}, ' ...
'journal = {Basic and Applied Herpetology}, ' ...
'volume = {31}, ' ...
'pages = {17-31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&rel-family=equals&rel-ordr=equals&rel-intro_isocc=like&rel-description=like&rel-distribution=like&rel-life_history=like&rel-trends_and_threats=like&rel-relation_to_humans=like&rel-comments=like&rel-submittedby=like&max=200&orderbyaw=Genus%2Bspecies&include_synonymies=Yes&show_photos=Yes&rel-scientific_name=contains&where-scientific_name=Lithobates_sphenocephalus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

