function [data, auxData, metaData, txtData, weights] = mydata_Lagostomus_maximus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Chinchillidae';
metaData.species    = 'Lagostomus_maximus'; 
metaData.species_en = 'Plains viscacha'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-tW'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1 = [2018 09 06];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'sta@akvaplan.niva.no'};            
metaData.date_acc  = [2018 09 06];              

%% set data
% zero-variate data

data.tg = 154;   units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 54;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 258;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 456;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10.8*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 200;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 652.2; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 6000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 2*1.8/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 1.8 litters per yr';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
    10  200
    20  225
    30  242
    40  264
    50  285
   100  540
   110  650
   200 1600];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Maik1974';
comment.tW = 'data concerns a female';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
    10  185
    20  200
    30  230
    40  245
    50  260
   100  480
   110  620
   200 1400];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(36.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Maik1974';
comment.tW1 = 'data concerns a female';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
    10  212
    20  250
    30  320
    40  390
    50  500
   100  950
   110 1125
   200 2100];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(36.8);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Maik1974';
comment.tW2 = 'data concerns a female';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for female 1, 2, 3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
D2 = 'mod_1: extension  with t-Ww data, but Wwx is ignored, due to inconcistency of (tx,Wwx) with tW data';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6NTX9'; % Cat of Life
metaData.links.id_ITIS = '584708'; % ITIS
metaData.links.id_EoL = '326930'; % Ency of Life
metaData.links.id_Wiki = 'Lagostomus_maximus'; % Wikipedia
metaData.links.id_ADW = 'Lagostomus_maximus'; % ADW
metaData.links.id_Taxo = '63504'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400161'; % MSW3
metaData.links.id_AnAge = 'Lagostomus_maximus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagostomus_maximus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lagostomus_maximus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Maik1974'; type = 'Article'; bib = [ ... 
'author = {Maik-Siembida, J.}, ' ... 
'doi = {10.1111/j.1748-1090.1974.tb00788.x}, ' ...
'year = {1974}, ' ...
'title = {Breeding viscachas: \emph{Lagostomus maximus}: at {L}odz {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {14}, ' ...
'pages = {116-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

