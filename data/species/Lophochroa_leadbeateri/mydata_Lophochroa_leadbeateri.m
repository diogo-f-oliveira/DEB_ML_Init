function [data, auxData, metaData, txtData, weights] = mydata_Lophochroa_leadbeateri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Lophochroa_leadbeateri'; 
metaData.species_en = 'Pink cockatoo'; 

metaData.ecoCode.climate = {'BWh','BSh'};
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
metaData.date_subm = [2022 11 11];              
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

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '23-30 d';
data.tx = 57.5;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'Carv2008';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 172.5;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*363;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '3 to 3 yr';
data.am = 77*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'ADW';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 15.3;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';               bibkey.Ww0 = 'avibase';
  comment.Ww0 = 'Carv2008 gives 11 g';
data.Wwb = 12;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
data.Wwi = 392;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'avibase';
data.Wwim = 424; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri = 3.29/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.29 eggs/clutch;1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0 152
1 168
2 172
3 192
4 212
5 230
6 254
7 260];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Coomallo Creek'};  
temp.tW   = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Carv2008'; treat.tW = {1, {'Schubot et al.','Hunt'}};

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
metaData.links.id_CoL = 'P57G'; % Cat of Life
metaData.links.id_ITIS = '554838'; % ITIS
metaData.links.id_EoL = '1178082'; % Ency of Life
metaData.links.id_Wiki = 'Lophochroa_leadbeateri'; % Wikipedia
metaData.links.id_ADW = 'Cacatua_leadbeateri'; % ADW
metaData.links.id_Taxo = '2682322'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E39FD99C0B686D68'; % Avibase
metaData.links.id_birdlife = 'major-mitchells-cockatoo-cacatua-leadbeateri'; % Birdlife
metaData.links.id_AnAge = 'Cacatua_leadbeateri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lophochroa_leadbeateri}}';
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
bibkey = 'Carv2008'; type = 'techreport'; bib = [ ... 
'author = {Jarryd Carver}, ' ... 
'year = {2008}, ' ...
'title = {Husbandry Guidelines For Major Mitchell''s Cockatoo \emph{Cacatua leadbeateri}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond}, ' ...
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/03/Birds.-Galah-2008CS.pdf}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cacatua_leadbeateri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cacatua_leadbeateri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E39FD99C0B686D68&sec=lifehistory}}';
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

