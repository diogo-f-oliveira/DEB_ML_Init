function [data, auxData, metaData, txtData, weights] = mydata_Zanda_latirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Cacatuidae';
metaData.species    = 'Zanda_latirostris'; 
metaData.species_en = 'Carnaby''s black cockatoo'; 

metaData.ecoCode.climate = {'Cs'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 09];              
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

data.ab = 29.5;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '28 to 31 d';
data.tx = 78;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'Saun1982';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 234;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 4*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '4 to 6 yr';
data.am = 41*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 27;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Saun1982';
  comment.Wwb = 'egg length 4.88 cm, width 3.47, weight: pi/6*4.88*3.47^2=30.7';
data.Wwi = 780;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Saun1982';
  comment.Wwi = 'asymptotic weight of netling; adult weight 637 g (Wiki)';   

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch;1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0       27 % added from Wwb
12.772	188.097
17.684	269.112
22.877	352.872
27.789	435.261
32.842	508.027
38.035	553.298
42.947	588.953
47.860	613.611
53.053	630.016
57.965	623.059
63.158	622.970
68.070	603.641
73.263	582.934
78.035	574.604];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'Coomallo Creek'};  
temp.tW   = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = {'Saun1982','Saun1986'};
comment.tW = 'data from Coomallo Creek';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
 0       27 % added from Wwb
12.772	155.107
17.684	236.122
23.018	275.893
28.070	365.153
32.842	414.556
37.895	440.586
42.947	454.245
48.000	454.158
52.772	493.939
58.105	517.215
63.018	503.385
68.351	523.911
73.263	512.831
77.614	504.508
83.368	445.303];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Manmanning'};  
temp.tW1   = C2K(41.3);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Saun1982';
comment.tW1 = 'data from Manmanning';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tW1 = weights.tW1 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data from Coomallo Creek, Manmanning'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'relativ feeding rate decreases towards fledging';
D2 = 'Body temperatures are guessed';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'Q6YF'; % Cat of Life
metaData.links.id_ITIS = '554834'; % ITIS
metaData.links.id_EoL = '1177833'; % Ency of Life
metaData.links.id_Wiki = 'Zanda_latirostris'; % Wikipedia
metaData.links.id_ADW = 'Calyptorhynchus_latirostris'; % ADW
metaData.links.id_Taxo = '91081'; % Taxonomicon
metaData.links.id_avibase = 'B933D557691385E4'; % Avibase
metaData.links.id_birdlife = 'carnabys-black-cockatoo-zanda-latirostris'; % Birdlife
metaData.links.id_AnAge = 'Calyptorhynchus_latirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zanda_latirostris}}';
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
bibkey = 'Saun1982'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1982.tb03790.x}, ' ...
'author = {D. A. Saunders}, ' ... 
'year = {1982}, ' ...
'title = {THE BREEDING BEHAVIOUR AND BIOLOGY OF THE SHORT-BILLED FORM OF THE WHITE-TAILED BLACK COCKATOO \emph{Calyptorhynchus funereus}}, ' ...
'journal = {Ibis}, ' ...
'volume = {124}, ' ...
'pages = {422-455}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Saun1986'; type = 'Article'; bib = [ ... 
'author = {D. A. Saunders}, ' ... 
'year = {1986}, ' ...
'title = {Breeding Season, Nesting Success and Nestling Growth in {C}arnaby''s Cockatoo, \emph{Calyptorhynchus funereus latirostris}, over 16 Years at {C}oomallo {C}reek, and a Method for Assessing the Viability of Populations in other Areas}, ' ...
'journal = {Aust. Wildl. Res.}, ' ...
'volume = {13}, ' ...
'pages = {261-273}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calyptorhynchus_latirostris}}';
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

