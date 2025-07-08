function [data, auxData, metaData, txtData, weights] = mydata_Onychomys_leucogaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Onychomys_leucogaster'; 
metaData.species_en = 'Northern grasshopper mouse'; 

metaData.ecoCode.climate = {'BS'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCvm', 'xiCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 01 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty for female';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 114;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 13.1;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 32.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';

data.Ri  = 4*2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 2.5 litters per yr';

% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (wk), weight (g)
    2 10.3
    3 13.5
    4 18.2
    5 22.3
    6 24.9
    7 27.4
    8 28.8
    9 29.2
   10 29.1
   11 29.3
   12 29.2
   13 29.1
   14 29.4
   15 30.3
   16 30.2
   17 30.2
   18 30.3];
data.tWw_f(:,1) = 7 * data.tWw_f(:,1); % convert wk to d
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Pint1970';
comment.tWw_f = 'Data for females';

%
data.tWw_m = [ ... % time since birth (wk), weight (g)
    2 10.3
    3 13.2
    4 16.0
    5 20.3
    6 24.5
    7 27.4
    8 29.7
    9 30.0
   10 31.2
   11 32.2
   12 32.8
   13 32.3
   14 32.5
   15 33.8
   16 35.5
   17 34.9
   18 35.8];
data.tWw_m(:,1) = 7 * data.tWw_m(:,1); % convert wk to d
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Pint1970';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is from Onychomys_torridus';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '49RCX'; % Cat of Life
metaData.links.id_ITIS = '180382'; % ITIS
metaData.links.id_EoL = '328463'; % Ency of Life
metaData.links.id_Wiki = 'Onychomys_leucogaster'; % Wikipedia
metaData.links.id_ADW = 'Onychomys_leucogaster'; % ADW
metaData.links.id_Taxo = '62346'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000432'; % MSW3
metaData.links.id_AnAge = 'Onychomys_leucogaster'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychomys_leucogaster}}';
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
bibkey = 'Pint1970'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1378473}, ' ...
'author = {Pinter, A. J.}, ' ... 
'year = {1970}, ' ...
'title = {Reproduction and Growth for Two Species of Grasshopper Mice (\emph{Onychomys}) in the Laboratory}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {51(2)}, ' ...
'pages = {236–243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Onychomys_leucogaster}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

