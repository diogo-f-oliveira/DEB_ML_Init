function [data, auxData, metaData, txtData, weights] = mydata_Otus_senegalensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Otus_senegalensis'; 
metaData.species_en = 'African scops owl'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 19];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 22;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'BrowRiek1987';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 26;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BrowRiek1987';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '25 to 28 d';
data.tp = 78;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '25 to 28 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 6.8 yr for Otus scops and 8.1 yr for Otus flammeolus, but that seems very short';
  
data.Wwb = 8;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'BrowRiek1987';
  comment.Wwb = 'Otus scops: egg length 3.13 cm, width 2.7 cm, weight: pi/6*3.13*2.7^2=11.95 g';
data.Wwi = 89;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'BrowRiek1987';

data.Ri  = 4.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), ln wet weight (ln g)
1.170	9.271
3.149	16.281
5.938	26.910
8.007	34.146
11.066	41.608
17.858	56.080
19.073	57.437
19.792	61.508
22.941	62.638
25.775	63.090];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BrowRiek1987';

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

%% Links
metaData.links.id_CoL = '4B8JL'; % Cat of Life
metaData.links.id_ITIS = '686649'; % ITIS
metaData.links.id_EoL = '1036379'; % Ency of Life
metaData.links.id_Wiki = 'Otus_senegalensis'; % Wikipedia
metaData.links.id_ADW = 'Otus_senegalensis'; % ADW
metaData.links.id_Taxo = '54735'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AE1306449B6781F7'; % avibase
metaData.links.id_birdlife = 'african-scops-owl-otus-senegalensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otus_senegalensis}}';
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
bibkey = 'BrowRiek1987'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1987.9634144}, ' ...
'author = {C. J. Brown and B. R. Riekert and R. J. Morsbach}, ' ... 
'year = {1987}, ' ...
'title = {THE BREEDING BIOLOGY OF THE {A}FRICAN SCOPS OWL}, ' ...
'journal = {Ostrich}, ' ...
'volume = {58}, ' ...
'pages = {58-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Otus_scops}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
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

