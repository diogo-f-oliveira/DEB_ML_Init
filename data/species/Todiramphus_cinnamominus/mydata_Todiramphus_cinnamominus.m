function [data, auxData, metaData, txtData, weights] = mydata_Todiramphus_cinnamominus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Coraciiformes'; 
metaData.family     = 'Alcedinidae';
metaData.species    = 'Todiramphus_cinnamominus'; 
metaData.species_en = 'Micronesian kingfisher'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 06 11];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BahnBalt1998';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from HollRome2012';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BahnBalt1998';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from KeslHaig2004';
data.tp = 99;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from KeslHaig2004';
data.tR = 304.8; units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'BahnBalt1998';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4745;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BahnBalt1998';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PratBrun1987';

data.Wwb = 5.75; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HollRome2012';
data.Wwi = 63.225; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BahnBalt1998';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'BahnBalt1998','HollRome2012'};   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
2 6.71052861;
3	7.2274459;
4	8.96616771;
5	12.06767147;
6	14.27631808;
7	15.82706996;
8	18.9755662;
9	22.17105493;
10	26.07143087;
11	27.62218275;
12	31.00564139;
13	34.01316019;
14	36.83270906;
15	39.93421282;
16	43.78759628;
17	47.54699478;
18	50.93045342;
19	53.56203237;
20	56.85150605;
21	60.70488951;
22	63.2424835;
23	64.27631808;
24	64.84022786;
25	64.7462429;
26	63.71240831;
27	61.45676921;
28	59.38910004;
29	58.82519026;
30	57.2274459;
31	54.68985192;
32	56.19361132;
33	54.03195718;
34	52.9981226;
35	55.15977673];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BahnBalt1998';
  
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
D1 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '7CG5Z'; % Cat of Life
metaData.links.id_ITIS = '692702'; % ITIS
metaData.links.id_EoL = '45516480'; % Ency of Life
metaData.links.id_Wiki = 'Todiramphus_cinnamominus'; % Wikipedia
metaData.links.id_ADW = 'Todiramphus_cinnamominus'; % ADW
metaData.links.id_Taxo = '1125446'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3FD21E0406D6A736'; % avibase
metaData.links.id_birdlife = 'guam-kingfisher-todiramphus-cinnamominus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Todiramphus_cinnamominus}}';
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
bibkey = 'PratBrun1987'; type = 'Book'; bib = [ ... 
'author = {Pratt, H. D. and Bruner, P. L. and Berrett, D. G.}, ' ... 
'year = {1987}, ' ...
'title = {The Birds of Hawaii and the Tropical Pacific}, ' ...
'publisher = {Princeton University Press}, ' ...
'address = {Princeton, NJ}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BahnBalt1998'; type = 'Misc'; bib = [ ... 
'author = {Bahner, B. and Baltz, A. and Diebold, E.}, ' ... 
'year = {1998}, ' ...
'title = {Micronesian Kingfisher Species Survival Plan Husbandry Manual \emph{Halcyon cinnamomina cinnamomina}. First Edition}, ' ...
'howpublished = {\url{http://www.coraciiformestag.com/Kingfisher/cinnamomina/Husbandry.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HollRome2012'; type = 'Misc'; bib = [...
'author = {Holland, G. and Romer, L.}, ' ... 
'year = {2012}, ' ...
'institution = {Kingfishers. Australasian Society of Zoo Keeping Inc.}, ' ...
'howpublished = {\url{http://www.aszk.org.au}}'];
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

