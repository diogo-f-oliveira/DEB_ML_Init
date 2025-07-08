function [data, auxData, metaData, txtData, weights] = mydata_Aethia_pusilla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Aethia_pusilla'; 
metaData.species_en = 'Least auklet'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 08 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 26];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 30;         units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 29;         units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Verm1987';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 87;         units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  
data.tR = 1095;       units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.1*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12.3;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Verm1987';
data.Wwi = 92;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Verm1987';
comment.Wwi = 'AnAge: 96 g';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Verm1987';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_66 = [ ... % time since birth (d), wet weight (% of adult weight)
    0 12.3
    1 15.4
    2 18.1
    3 21.9
    4 26.1
    5 29.2
    6 34.4
    7 39.3
    8 41.2
    9 45.9
   10 51.8
   11 54.8
   12 59.3
   13 65.8
   14 68.0
   15 73.0
   16 74.1
   17 82.6
   18 81.3
   19 85.5
   20 89.8
   21 89.0
   22 89.8
   23 90.0
   24 92.3
   25 94.7
   26 89.3
   27 88.9
   28 87.2
   29 89.6
   30 88.1
   31 88.2];

units.tW_66   = {'d', 'g'};  label.tW_66 = {'time since birth', 'wet weight', '1966'};  
temp.tW_66    = C2K(40.7);  units.temp.tW_66 = 'K'; label.temp.tW_66 = 'temperature';
bibkey.tW_66  = 'Seal1968';
% 
data.tW_67 = [ ... % time since birth (d), wet weight (% of adult weight)
    0 12.4
    1 14.5
    2 17.5
    3 21.8
    4 26.4
    5 29.1
    6 35.0
    7 40.0
    8 46.1
    9 50.3
   10 57.2
   11 58.9
   12 62.7
   13 67.7
   14 71.7
   15 74.7
   16 79.0
   17 81.4
   18 84.8
   19 86.5
   20 85.2
   21 87.0
   22 85.2
   23 84.4
   24 84.2
   25 86.8
   26 85.2
   27 82.6
   28 78.0
   29 78.4
   30 81.2];
units.tW_67   = {'d', 'g'};  label.tW_67 = {'time since birth', 'wet weight', '1967'};  
temp.tW_67    = C2K(40.7);  units.temp.tW_67 = 'K'; label.temp.tW_67 = 'temperature';
bibkey.tW_67  = 'Seal1968';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_67 = weights.tW_67 * 2;
weights.tW_66 = weights.tW_66 * 2;

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
set1 = {'tW_67','tW_66'}; subtitle1 = {'Data for 1967, 1966'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'mod_1: tW data from Verm1987 replaced by the original data of Seal1968';
D3 = 'mod_2: v is reduced';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '65CP6'; % Cat of Life
metaData.links.id_ITIS = '177020'; % ITIS
metaData.links.id_EoL = '45509364'; % Ency of Life
metaData.links.id_Wiki = 'Aethia_pusilla'; % Wikipedia
metaData.links.id_ADW = 'Aethia_pusilla'; % ADW
metaData.links.id_Taxo = '53928'; % Taxonomicon
metaData.links.id_WoRMS = '344016'; % WoRMS
metaData.links.id_avibase = '044509DAF1E58241'; % avibase
metaData.links.id_birdlife = 'least-auklet-aethia-pusilla'; % birdlife
metaData.links.id_AnAge = 'Aethia_pusilla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aethia_pusilla}}';
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
bibkey = 'Verm1987'; type = 'Techreport'; bib = [ ...  
'title = {GROWTH AND NESTLING PERIODS OF CASSINS AUKLETS: ADAPTATIONS OF PLANKTIVOROUS AUKLETS TO BREEDING AT NORTHERN LATITUDES}, ' ...
'institution = {Canadian technical report of hydrography and ocean sciences}, ' ...
'volume = {93}, ' ...
'year = {1987}, ' ...
'author = {K. Vermeer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Aethia_pusilla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Seal1968'; type = 'phdthesis'; bib = [ ...  
'title = {A comparative study of breeding ecology and timing in plankton-feeding alcids (\emph{Cychlorrhynchus} and \emph{Aethia} spp.) on St. Lawrence Island, Alaska}, ' ...
'school = {Univ. British Columbia}, ' ...
'year = {1968}, ' ...
'author = {Spencer George Sealy}'];
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

