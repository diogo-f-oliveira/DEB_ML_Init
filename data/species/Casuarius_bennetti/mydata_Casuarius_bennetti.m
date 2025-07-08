function [data, auxData, metaData, txtData, weights] = mydata_Casuarius_bennetti

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Casuariiformes'; 
metaData.family     = 'Casuariidae';
metaData.species    = 'Casuarius_bennetti'; 
metaData.species_en = 'Dwarf cassowary'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.17); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 08 12];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1    = {'Bas Kooijman'};                 
metaData.date_mod_1 = [2022 11 16];                            
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};                  
metaData.address_mod_1   = {'VU University of Amsterdam'};      

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data;
data.ab = 50.5;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'EoL';  
  temp.ab = C2K(34); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '49 till 52 d';
data.tp = 0.7*365;       units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';  
  temp.tp = C2K(38.17); units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp = 'about the time the young bird is independant of parent and considered a sub-adult.';
data.tR = 4*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'EoL'; 
  temp.tR = C2K(38.17);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 26*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';                   
  temp.am = C2K(38.17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 340;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                         bibkey.Wwb = 'Reid1987'; 
  comment.Wwb = 'based on egg-size corrected value for C. casuarius: (13/13.8)^3*413';
data.Wwi = 35e3;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';                         bibkey.Wwi = 'AnAge';   
data.Wwim = 18.5e3;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'guess';   
  comment.Wwim = 'guess based on same relative weight of female, compered to C. casuarius: Wwi * 31/58.5';

data.Ri  = 5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';                         bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(38.17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - weight
data.tW = [ ... % time (d), weight (g)
     0   795
    10  1105
    20  1455
    30  1915
    40  2445
    50  3105
    60  4015
    70  4800
    80  5660
    90  6590
   104  7980];
data.tW(:,1) = 15 + data.tW(:,1); % exact birth time is unknown
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(38.17); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Reid1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: v reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'RQYZ'; % Cat of Life
metaData.links.id_ITIS = '174388'; % ITIS
metaData.links.id_EoL = '45515897'; % Ency of Life
metaData.links.id_Wiki = 'Casuarius_bennetti'; % Wikipedia
metaData.links.id_ADW = 'Casuarius_bennetti'; % ADW
metaData.links.id_Taxo = '93147'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7751E0D145194220'; % avibase
metaData.links.id_birdlife = 'dwarf-cassowary-casuarius-bennetti'; % birdlife
metaData.links.id_AnAge = 'Casuarius_bennetti'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Casuarius_bennetti}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reid1987'; type = 'Article'; bib = [ ... 
'author = {B. Reid}, ' ... 
'year = {1987}, ' ...
'title = {Food intake and growth rate of cassowary chicks \emph{Casuarius spp} reared at {Mendi, southern Highland Papua New Guinea}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {26}, ' ...
'pages = {189--198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Casuarius_bennetti}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178368/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'britannica'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.britannica.com/animal/flightless-bird}}'; 
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

