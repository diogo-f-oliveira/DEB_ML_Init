function [data, auxData, metaData, txtData, weights] = mydata_Chloephaga_picta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Chloephaga_picta'; 
metaData.species_en = 'Upland goose'; 

metaData.ecoCode.climate = {'Cwc'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'xiTh'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 10 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 30;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 67;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 201;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 85;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Summ1983';
data.Wwi = 3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Wiki';
  comment.Wwi = '2.7 to 3.2 kg';

data.Ri  = 6.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '5 till 8 eggs per clutch; 1 clutch per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.723	85.821
4.337	123.134
6.145	164.179
7.319	180.970
13.916	369.403
14.729	414.179
21.958	710.821
22.771	733.209
28.916	1052.239
30.000	1145.522];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Summ1983';

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5Y8VT'; % Cat of Life
metaData.links.id_ITIS = '175206'; % ITIS
metaData.links.id_EoL = '1048516'; % Ency of Life
metaData.links.id_Wiki = 'Chloephaga_picta'; % Wikipedia
metaData.links.id_ADW = 'Chloephaga_picta'; % ADW
metaData.links.id_Taxo = '52101'; % Taxonomicon
metaData.links.id_WoRMS = '225936'; % WoRMS
metaData.links.id_avibase = '74FC5DAB02BDF076'; % avibase
metaData.links.id_birdlife = 'upland-goose-chloephaga-picta'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chloephaga_picta}}';
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
bibkey = 'Summ1983'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1983.tb03146.x}, ' ...
'author = {R. W. Summers}, ' ... 
'year = {1983}, ' ...
'title = {The life cycle of the Upland Goose \emph{Chlo\"{e}phaga picta} in the {F}alkland {I}slands}, ' ...
'journal = {Ibis}, ' ...
'volume = {125}, ' ...
'pages = {524-544}'];
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

