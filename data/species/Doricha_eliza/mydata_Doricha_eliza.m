function [data, auxData, metaData, txtData, weights] = mydata_Doricha_eliza

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Doricha_eliza'; 
metaData.species_en = 'Mexican sheartail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'DiazLara2011';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
data.tx = 23;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'DiazLara2011'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 69;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'DiazLara2011';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'guess'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Archilochus_alexandri';

data.Wwb = 0.3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'DiazLara2011';
  comment.Wwb = 'egg length 1.2 cm, width 0.8 cm, weight: pi/6*1.2*.8^2=0.4 g';
data.Wwi = 3.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'DiazLara2011';   

data.Ri  = 2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'EoL';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [...
 2	0.457
 3	0.110
 4	1.015
 5	1.285
 6	1.421
 7	1.852
 8	2.080
 9	2.537
10	2.605
11	2.740
12	3.112
13	3.053
14	3.044
15	3.526
16	3.163
17	3.112
18	3.442
19	3.349];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DiazLara2011';

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
D1 = 'mod_1: v reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37D3S'; % Cat of Life
metaData.links.id_ITIS = '555305'; % ITIS
metaData.links.id_EoL = '45509636'; % Ency of Life
metaData.links.id_Wiki = 'Doricha_eliza'; % Wikipedia
metaData.links.id_ADW = 'Doricha_eliza'; % ADW
metaData.links.id_Taxo = '72511'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'FAF780DFD2BE5ED7'; % avibase
metaData.links.id_birdlife = 'mexican-sheartail-doricha-eliza'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doricha_eliza}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'DiazLara2011'; type = 'Article'; bib = [ ... 
'author = {R. D{\i}az-Valenzuela and N. Z. Lara-Rodriguez and R. Ortiz-Pulido and F. Gonz\''{a}lez-Garc{\i}a and A. R. Bautista}, ' ... 
'year = {2011}, ' ...
'title = {Some aspects of the reproductive biology of the {M}exican sheartail (\emph{Doricha eliza}) in central {V}eracruz}, ' ...
'journal = {The Condor}, ' ...
'volume = {113}, ' ...
'pages = {177-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will2002'; type = 'Book'; bib = [ ...  
'author = {S. Williamson}, ' ...
'year = {2002}, ' ...
'title  = {A Field Guide to Hummingbirds of North America}, ' ...
'publisher = {Houghton Mifflin Company}, ' ...
'pages = {62}, ' ...
'howpublished = {\url{https://books.google.pt/books?id=XtZ1xotyal8C&printsec=frontcover&dq=a+field+of+hummingbirds+of+north+america}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = [ ...
'howpublished = {\url{http://eol.org/pages/914889/details}}'];
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

