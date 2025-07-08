function [data, auxData, metaData, txtData, weights] = mydata_Eolophus_roseicapilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Eolophus_roseicapilla'; 
metaData.species_en = 'Galah'; 

metaData.ecoCode.climate = {'A','B','Cfa','Cfb','Cs'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 25.5;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tx = 56;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 168;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 363;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '4 to 6 yr';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 14.4;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 10;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Scan2008';
data.Wwi = 299.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'avibase';
data.Wwim = 324.2; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch;1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0 mean([7 12])    NaN
    1 mean([7 12])    NaN
    2 mean([9 13])    NaN
    3 mean([10 15])   NaN
    4 mean([11 16])   NaN
    5 mean([12 19])   NaN
    6 mean([13 22])   NaN
    7 mean([15 27])   NaN
    8 mean([16 28])   NaN
    9 mean([18 37])   NaN
   10 mean([22 43])   NaN
   11 mean([24 51])   NaN
   12 mean([32 57])   NaN
   13 mean([34 68])   NaN
   14 mean([35 77])   NaN
   15 mean([38 90])    99
   16 mean([43 101])  112
   17 mean([47 115])  126
   18 mean([50 126])  148
   19 mean([57 132])  157
   20 mean([63 141])  171
   21 mean([67 146])  186
   22 NaN             197
   23 NaN             212
   24 mean([89 161])  226
   28 mean([114 181]) 262
   35 mean([172 257]) 259
   42 mean([205 300]) 260
   49 mean([240 305]) 266
   56 mean([225 292]) NaN
   63 mean([220 289]) NaN
   70 mean([209 294]) NaN
   77 mean([228 285]) NaN
  114 mean([237 309]) NaN
  121 mean([243 302]) NaN
  128 mean([248 299]) NaN];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Coomallo Creek'};  
temp.tW   = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Scan2008'; treat.tW = {1, {'Schubot et al.','Hunt'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'relative feeding rate decreases towards fledging';
D3 = 'Body temperatures are guessed';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6FJCY'; % Cat of Life
metaData.links.id_ITIS = '714023'; % ITIS
metaData.links.id_EoL = '45511257'; % Ency of Life
metaData.links.id_Wiki = 'Eolophus_roseicapilla'; % Wikipedia
metaData.links.id_ADW = 'Eolophus_roseicapilla'; % ADW
metaData.links.id_Taxo = '1125233'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '155F5285693BF58B'; % Avibase
metaData.links.id_birdlife = 'galah-eolophus-roseicapilla'; % Birdlife
metaData.links.id_AnAge = 'Eolophus_roseicapilla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eolophus_roseicapilla}}';
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
bibkey = 'Scan2008'; type = 'techreport'; bib = [ ... 
'author = {Charmaine Scannell}, ' ... 
'year = {2008}, ' ...
'title = {Husbandy guidelines for the galah \emph{Eolophus roseicapilla}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond}, ' ...
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/03/Birds.-Galah-2008CS.pdf}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eolophus_roseicapilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=155F5285693BF58B&sec=lifehistory}}';
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

