function [data, auxData, metaData, txtData, weights] = mydata_Zanda_funerea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Zanda_funerea'; 
metaData.species_en = 'Yellow-tailed black cockatoo'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA', 'TAt'};
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

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '28 to 31 d';
data.tx = 76;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 228;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 41*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'avibase';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 33.8;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 26;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
data.Wwi = 800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'avibase';
data.Wwim = 731; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'avibase';

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch;1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
     1  23.8
     2  26.5
     3  30.9
     4  36.2
     5  42.2
     6  49.0
     7  61.2
     8  72.7
     9  89.0
    10 107.7
    11 118.0
    12 130.8
    13 145.3
    14 161.0
    15 183.3
    16 198.3
    17 213.0
    18 229.0
    19 244.7
    20 265.0
    21 289.0
    22 314.3
    23 346.0
    24 367.0
    25 398.0
    26 323.0
    27 442.0
    28 461.0
    35 537.0
    42 601.0
    49 685.0
    56 816.0
    63 890.0];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Coomallo Creek'};  
temp.tW   = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Harr2007';
comment.tW = 'hand reared';

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
D1 = 'relative feeding rate decreases towards fledging';
D2 = 'Body temperatures are guessed';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'Q6YD'; % Cat of Life
metaData.links.id_ITIS = '177479'; % ITIS
metaData.links.id_EoL = '1177830'; % Ency of Life
metaData.links.id_Wiki = 'Zanda_funerea'; % Wikipedia
metaData.links.id_ADW = 'Calyptorhynchus_funereus'; % ADW
metaData.links.id_Taxo = '54189'; % Taxonomicon
metaData.links.id_avibase = 'E6DFA7077084129A'; % Avibase
metaData.links.id_birdlife = 'yellow-tailed-black-cockatoo-zanda-funerea'; % Birdlife
metaData.links.id_AnAge = 'Calyptorhynchus_funereus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zanda_funerea}}';
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
bibkey = 'Harr2007'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/03/Birds.-Yellow-tailed-Black-Cockatoo-2007LH.pdf}}, ' ...
'author = {Lisa Harris}, ' ... 
'year = {2007}, ' ...
'title = {Husbandry Manual for Yellow-Tailed Black Cockatoo \emph{Calyptorhynchus funereus}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calyptorhynchus_funereus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B933D557691385E4&sec=lifehistory}}';
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

